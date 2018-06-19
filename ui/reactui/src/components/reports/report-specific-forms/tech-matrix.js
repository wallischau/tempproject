import React, { Component } from 'react'
import { connect } from 'react-redux'

import MultiSelect, { handleChangeMultiSelect } from '../../app/multi-select'
import { getFirmware } from '../../../services/firmwares/actions' 

import './report-form-style.css'
import './tech-matrix.css'

const mapStateToProps = state => ({
  firmwares: state.firmwares.firmwares
})

const grid_row_map = {
  /// _keyName are keys not mappable to the firmware.capabilities object directly
  // device info header
  _vendor: {gridRow: 2},
  _model: {gridRow: 3},
  _firmware: {gridRow: 4},
  // 24 header
  capable_24: {gridRow: 6}, 
  max_band_24: {gridRow: 7}, /// 40 MHz
  _three_ant_24: {gridRow: 8},
  // 5 header
  capable_5: {gridRow: 10}, 
  max_band_5: {gridRow: 11}, // 80 MHz
  _three_ant_5: {gridRow: 12}, 
  // Additional items header
  _standards: {gridRow: 14},
  dual_band: {gridRow: 15}, // 1/0
  ipv4: {gridRow: 16}, //1/0
  ipv6: {gridRow: 17}, //1/0
  sg: {gridRow: 18}, // 1/0
  lg: {gridRow: 19}, // 1/0
  _su_mimo: {gridRow: 20}, 
  mu_mimo: {gridRow: 21}
}

const grid_header_name_map = {
    // header
    _vendor: "Vendor",
    _model: "Model",
    _firmware: "Firmware",
    // 24 header
    capable_24: "2.4 GHz Capable", 
    max_band_24: "2.4 GHz Bandwidth", 
    _three_ant_24: "Three Antenna/SS",
    // 5 header
    capable_5: "5 GHz Capable",
    max_band_5: "5 GHz Bandwidth", 
    _three_ant_5: "Three Antenna/SS", 
    // Add header
    _standards: "Standards",
    dual_band: "Dual Band", 
    ipv4: "IPV4", 
    ipv6: "IPV6", 
    sg: "SG", 
    lg: "LG", 
    _su_mimo: "SU MIMO (missing)", 
    mu_mimo: "MU MIMO"
}

const grid_row_headers_map = {
  // these are the section headers
  'Device information': {gridRow: 1},
  '2.4 GHz Band': {gridRow: 5},
  '5 GHz Band': {gridRow: 9},
  'Additional Capabilities': {gridRow: 13}
}


class TechMatrixReport extends Component {
  constructor(props) {
    super(props);

    this.state = {
      models_selected: [],
      firmwares_selected: []
    };

    this.handleChange = handleChangeMultiSelect.bind(this);

    if (!this.props.firmwares.length) this.props.getFirmware();
  }
  
  render() {
    const models = [...new Set(this.props.firmwares.map(f => `${f.company} ${f.model_name}`))] // unique make/model combos
      .map(f => ({ id: f, displayText: f }))
      .sort((a,b) => a.displayText.localeCompare(b.displayText));
    
    const firmwares = this.props.firmwares
      .filter(f => this.state.models_selected.includes(`${f.company} ${f.model_name}`)) 
      .map(f => ({ id: f.id, displayText: `${f.name} (${f.company} ${f.model_name})` }))
      .sort((a,b) => a.displayText.localeCompare(b.displayText));

    // console.log(firmwares, models)

    const selected_full = this.state.firmwares_selected.map(f_id => this.props.firmwares.find(f => f.id*1 === f_id*1))
      
    return (
      <div className="report-specific-form"> 
        <h3 className="report-form-header">Tech Matrix Report</h3>
        <p className="report-help-text">ctrl-click to select multiple</p>
        <h4 className="report-select-title">Models:</h4>
        <MultiSelect 
          state_key="models_selected"
          value={this.state.models_selected}  /// value = selected options 
          options={models} 
          handleChange={this.handleChange}
        />
        <h4 className="report-select-title">Firmwares:</h4>        
        <MultiSelect 
          state_key="firmwares_selected"
          value={this.state.firmwares_selected}  /// value = selected options 
          options={firmwares} 
          handleChange={this.handleChange}
        />
        
        <h4 className="report-select-title">Selected:</h4>                
        <section className="report-selected">
          <ul>
            {selected_full.map(firm => (<li key={firm.id}>{`${firm.name} (${firm.company} ${firm.model_name}`})</li>))}
          </ul>
        </section>
        
        { this.state.firmwares_selected.length &&
          <section className="report-table">
            <h3 className="report-form-header">Device Capabilities</h3>
              <div className="tech-matrix-grid">
              {
                // render row headers
                Object.entries(grid_row_map).map(([key, val], i) => {
                  return <div className="tmg-row-header" key={key} style={{...val, gridColumn:1}}>{grid_header_name_map[key]}</div>
                })
              }
              {
                // render grid spanning headers
                Object.entries(grid_row_headers_map).map(([key, val], i) => {
                  return <div className="tmg-divide-header" key={key} style={{...val, gridColumnStart:1, gridColumnEnd:this.state.firmwares_selected.length + 2 }}>{key}</div>
                })
              }
              {
                // render the info on the selected firmwares
                selected_full.map((f, i) => {
                  // add capabilities
                  const caps = Object.entries(f.capabilities).map(([key, val]) => {
                    if (key in grid_row_map) {
                      val === 1 && (val = 'YES')
                      val === 0 && (val = 'NO')
                      return <div className="grid-square" key={""+key+i} style={{...grid_row_map[key], gridColumn: i+2}}>{val}</div>
                    }
                    return null
                  })

                  // add vendor, model, firmware
                  caps.push(<div className="grid-square" key={"vendor"+i} style={{...grid_row_map._vendor, gridColumn: i+2}}>{f.company}</div>)
                  caps.push(<div className="grid-square" key={"model"+i} style={{...grid_row_map._model, gridColumn: i+2}}>{f.model_name}</div>)
                  caps.push(<div className="grid-square" key={"firm"+i} style={{...grid_row_map._firmware, gridColumn: i+2}}>{f.name}</div>)
                  
                  // add three_ant 24, 5, standard
                  caps.push(<div className="grid-square" key={"three_ant_24"+i} style={{...grid_row_map._three_ant_24, gridColumn: i+2}}>{`${f.capabilities.ant_tx_24} x ${f.capabilities.ant_rx_24} x ${f.capabilities.ss_24}`}</div>)
                  caps.push(<div className="grid-square" key={"three_ant_5"+i} style={{...grid_row_map._three_ant_5, gridColumn: i+2}}>{`${f.capabilities.ant_tx_5} x ${f.capabilities.ant_rx_5} x ${f.capabilities.ss_5}`}</div>)
                  caps.push(<div className="grid-square" key={"standards"+i} style={{...grid_row_map._standards, gridColumn: i+2}}>{f.capabilities.standards && f.capabilities.standards.join(', ')}</div>)
                  
                  return caps
                })
              }
              </div>
          </section>
        }
      </div>
    )
  }
}


export default connect(
  mapStateToProps, 
  { getFirmware }
)(TechMatrixReport)
