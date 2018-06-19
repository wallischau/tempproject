import React, { Component } from 'react'
import { connect } from 'react-redux'

import SingleSelect, { handleChangeSingleSelect }  from '../../app/single-select'
import { saveDut } from '../../../services/chambers/actions'


class ChamberDut extends Component {
  constructor(props) {
    super(props)


    this.state= {
      chosenDut: this.props.chamber.dut ? this.props.chamber.dut._id : 'No Dut', 
      button_text: 'Save'
    }
    
    this.handleChange = this.handleChangeWrap.bind(this)
  }

  handleChangeWrap(e) {
    const original_dut_id = this.props.chamber.dut ? this.props.chamber.dut._id : 'No Dut'     
    if(this.state.chosenDut !== original_dut_id) {
      this.setState({ button_text: 'Save' })
    }
    handleChangeSingleSelect.bind(this)(e)
  }
  
  submitDutChange() {
    const original_dut_id = this.props.chamber.dut ? this.props.chamber.dut._id : 'No Dut' 
    if(this.state.chosenDut !== original_dut_id) {
      let new_dut = this.state.chosenDut
      if (this.state.chosenDut === 'No Dut') {
        new_dut = null
      } 
      this.props.saveDut(this.props.chamber._id, new_dut).then(dut_changed => {
        this.setState({ button_text: dut_changed ? 'Update Saved!' : 'API Failed, reload and retry' })
      })
    }
  }

  render() {
    const dutOptions = [{ id: 'No Dut', display: 'No Dut' }].concat(
      this.props.duts.map(d => ({
        id: d._id, 
        display: d.firmware ? `${d.firmware.company} ${d.firmware.model_name} ${d.barcode_id}` : 'nope'
      })).sort((a, b) => a.display.localeCompare(b.display))
    )

    return (
      <div className='tab-content'>
        <div className='well'>
          
            <label>
              <SingleSelect 
                value={this.state.chosenDut}
                options={dutOptions}
                state_key={'chosenDut'}
                handleChange={this.handleChange}
              />
            </label>
            <p></p>
            <button className="btn" style={{padding: '10px'}} onClick={() => this.submitDutChange()}>{this.state.button_text}</button>
          
        </div>
      </div>
    )
  }
}


export default connect(
  null,
  { saveDut }
)(ChamberDut)