import React, { Component } from 'react'
import { connect } from 'react-redux'
import {
  saveIxiaConfigChange,
  saveAttenuatorConfigChange
} from '../../../services/chambers/actions'
import {
  
  setTestSetupSuccess,
  saveAttenuation,
  sendAttenuation,
  getAttenuation
} from '../../../services/chambers/actions'
import {setTestSetupError} from '../../../services/snackbars/actions'

class ChamberConfiguration extends Component {
  constructor(props) {
    super(props)
    this.state = {
      atten_5: this.props.chamber.attenuator.atten_5_GHz || 0,
      atten_24: this.props.chamber.attenuator.atten_24_GHz || 0,
      ip5: props.chamber.card_config.wifi_5_GHz.ip || '0.0.0.0',
      ip24: props.chamber.card_config.wifi_24_GHz.ip || '0.0.0.0',
      ethernetIP: this.props.chamber.card_config.ethernet.ip || '0.0.0.0',
      slot5: props.chamber.card_config.wifi_5_GHz.slot || '?',
      slot24: props.chamber.card_config.wifi_24_GHz.slot || '?',
      ethernetSlot: props.chamber.card_config.ethernet.slot || '?',
      model5: props.chamber.card_config.wifi_5_GHz.model || '?',
      model24: props.chamber.card_config.wifi_24_GHz.model || '?',
      ethernetModel: props.chamber.card_config.ethernet.model || '?',
      port5: props.chamber.card_config.wifi_5_GHz.port || '?',
      port24: props.chamber.card_config.wifi_24_GHz.port || '?',
      ethernetPort: props.chamber.card_config.ethernet.port || '?',
      attenuatorManufacturer: props.chamber.attenuator.make || '?',
      attenuator5Ports: props.chamber.attenuator.ports_5_GHz || '?',
      attenuator24Ports: props.chamber.attenuator.ports_24_GHz || '?',
      attenuatorIP: props.chamber.attenuator.ip || '0.0.0.0',
      ixiaButtonText: "Edit",
      vlan1: props.chamber.card_config.ethernet.vlan ?
              props.chamber.card_config.ethernet.vlan.vlan_1 :
              "Not Available",
      vlan2: props.chamber.card_config.ethernet.vlan ?
              props.chamber.card_config.ethernet.vlan.vlan_2 :
              "Not Available",
      vlan3: props.chamber.card_config.ethernet.vlan ?
              props.chamber.card_config.ethernet.vlan.vlan_3 :
              "Not Available",
      wan: props.chamber.card_config.ethernet.vlan ?
            props.chamber.card_config.ethernet.vlan.wan :
            "Not Available",
      attenuatorButtonText: "Edit"
    }
    this.changeIxiaButton = this.changeIxiaButton.bind(this)
    this.changeAttenuatorButton = this.changeAttenuatorButton.bind(this)
    this.changeAtten = this.changeAtten.bind(this)
    this.setAttenuations = this.setAttenuations.bind(this) 
  }

  componentDidMount() {
    this.setAttenuations()  
  }

  setAttenuations(){
    if (!this.props.chamber.attenuator.ports_5_GHz || !this.props.chamber.attenuator.ports_24_GHz) {
      return
    }
    let atten5Begin = ""
    let atten24Begin = ""
    let atten5End = ""
    let atten24End = ""
    
    atten5Begin = this.props.chamber.attenuator.ports_5_GHz.split("-")[0]
    if (this.props.chamber.attenuator.ports_5_GHz.includes("-")) {
      atten5End = this.props.chamber.attenuator.ports_5_GHz.split("-")[1]
    }
    else {
      atten5End = atten5Begin
    }
    atten24Begin = this.props.chamber.attenuator.ports_24_GHz.split("-")[0]
    if (this.props.chamber.attenuator.ports_24_GHz.includes("-")) {
      atten24End = this.props.chamber.attenuator.ports_24_GHz.split("-")[1]
    }
    else {
      atten24End = atten24Begin
    }

    this.props.getAttenuation(
      this.props.chamber.name,
      this.props.chamber.attenuator.ip,
      atten24Begin,
      atten24End)
    .then((attenValue) => {
      this.setState({atten_24: attenValue});
    });
    this.props.getAttenuation(
      this.props.chamber.name,
      this.props.chamber.attenuator.ip,
      atten5Begin,
      atten5End)
    .then((attenValue) => {
      this.setState({atten_5: attenValue});
    });
  }

  changeAtten(atten, value){
    if (atten === 24){
      this.setState({atten_24: value})
    }
    else if (atten === 5){
      this.setState({atten_5: value})
    }
  }

  changeIxiaButton(){
    if (this.state.ixiaButtonText === "Edit"){
      this.setState({ixiaButtonText: "Save"})
    }
    else {
      if (this.state.port24 < 0 ||
          this.state.port5 < 0 ||
          this.state.ethernetPort < 0) {
        this.props.setTestSetupError(
          this.props.chamber.name,
          'Ports can not be a negative number')
        return
      }
      if (this.state.slot24 < 0 ||
          this.state.slot5 < 0 ||
          this.state.ethernetSlot < 0) {
        this.props.setTestSetupError(
          this.props.chamber.name,
          'Slots can not be a negative number')
        return
      }
      let newCardConfig = {
        wifi_24_GHz: {
          port: this.state.port24,
          slot: this.state.slot24,
          serial: this.props.chamber.card_config.wifi_24_GHz.serial,
          model: this.state.model24,
          ip: this.state.ip24
        },
        wifi_5_GHz: {
          port: this.state.port5,
          slot: this.state.slot5,
          serial: this.props.chamber.card_config.wifi_5_GHz.serial,
          model: this.state.model5,
          ip: this.state.ip5

        },
        ethernet: {
          port: this.state.ethernetPort,
          slot: this.state.ethernetSlot,
          serial: this.props.chamber.card_config.ethernet.serial,
          model: this.state.ethernetModel,
          ip: this.state.ethernetIP,
          vlan: this.props.chamber.card_config.ethernet.vlan
        }
      }
      this.props.saveIxiaConfigChange(
        this.props.chamber._id,
        this.props.chamber.name,
        newCardConfig)
      this.setState({ixiaButtonText: "Edit"})
    }
  }

  changeAttenuatorButton(){
    let rangeBegin24 = 0 
    let rangeBegin5 = 0
    let rangeEnd24 = 0
    let rangeEnd5 = 0
    if (this.state.attenuatorButtonText === "Edit"){
      this.setState({attenuatorButtonText: "Save"})
    }
    else {
      let newAttenuator = {
        ports_24_GHz: this.state.attenuator24Ports,
        ports_5_GHz: this.state.attenuator5Ports,
        ip: this.state.attenuatorIP,
        make: this.state.attenuatorManufacturer,
        atten_24_GHz: this.state.atten_24,
        atten_5_GHz: this.state.atten_5
      }
      if (this.state.attenuator24Ports.includes("-")){
        rangeBegin24 = parseInt(this.state.attenuator24Ports.split("-")[0], 10)
        rangeEnd24 = parseInt(this.state.attenuator24Ports.split("-")[1], 10)
      }
      else {
        rangeEnd24 = rangeBegin24 = parseInt(this.state.attenuator5Ports, 10)
      }
      if (this.state.attenuator5Ports.includes("-")){
        rangeBegin5 = parseInt(this.state.attenuator5Ports.split("-")[0], 10)
        rangeEnd5 = parseInt(this.state.attenuator5Ports.split("-")[1], 10)
      }
      else {
        rangeEnd5 = rangeBegin5 = parseInt(this.state.attenuator5Ports, 10)
      }
      this.props.saveAttenuatorConfigChange(
        this.props.chamber._id,
        this.props.chamber.name,
        newAttenuator)
      this.props.sendAttenuation(
        this.props.chamber.name,
        this.props.chamber.attenuator.ip,
        parseInt(this.state.atten_5, 10),
        rangeBegin5,
        rangeEnd5) 
      this.props.sendAttenuation(
        this.props.chamber.name,
        this.props.chamber.attenuator.ip,
        parseInt(this.state.atten_24, 10),
        rangeBegin24,
        rangeEnd24) 
      this.setState({attenuatorButtonText: "Edit"})
    }
  }

  render() {
    return (
      <div className='tab-content'>
        <h4>General Information</h4>
        <dl>
          <dt>Name</dt>
          <dd>{this.props.chamber.name}&nbsp;</dd>
          <dt>Rack</dt>
          <dd>{this.props.chamber.rack}&nbsp;</dd>
          <dt>Shelf</dt>
          <dd>{this.props.chamber.shelf}&nbsp;</dd>
          <dt>Make</dt>
          <dd>{this.props.chamber.make}&nbsp;</dd>
          <dt>Model</dt>
          <dd>{this.props.chamber.model}&nbsp;</dd>
          <dt>Reserved by</dt>
          <dd>{this.props.chamber.reserved_by}&nbsp;</dd>
          <dt>DUT</dt>
          <dd>
            {this.props.chamber.dut ?
              this.props.chamber.dut.firmware.company + ' ' +
              this.props.chamber.dut.firmware.model_name + ' ' :
              'None '
            }
            [<button className="btn-link"
                    onClick={() => this.props.setTab('dut')}>change</button>]
          </dd>
        </dl>
        <span className='divider'/>
        <h4>{this.props.chamber.make} Card Config</h4>
        <dl>
          <dt>5GHz Card</dt>
          <dd>
            <input  disabled={this.state.ixiaButtonText === "Edit"}
                    className="config-card-input"
                    onChange={
                      (x) => this.setState({ip5: x.target.value})
                    }
                    defaultValue = {this.state.ip5}>
            </input>
          </dd>
          <dt>Slot</dt>
          <dd>
            <input  disabled={this.state.ixiaButtonText === "Edit"}
                    className="config-card-input"
                    onChange={
                      (x) => this.setState({
                        slot5: parseInt(x.target.value, 10)
                      })
                    }
                    defaultValue={this.state.slot5}>
            </input>
          </dd>
          <dt>Model</dt>
          <dd>
            <input  disabled={this.state.ixiaButtonText === "Edit"}
                    className="config-card-input"
                    onChange={
                      (x) => this.setState({model5: x.target.value})
                    }
                    defaultValue={this.state.model5}>
            </input>
          </dd>
          <dt>Port</dt>
          <dd>
            <input  disabled={this.state.ixiaButtonText === "Edit"}
                    className="config-card-input"
                    onChange={
                      (x) => this.setState({
                        port5: parseInt(x.target.value, 10)
                      })
                    }
                    defaultValue={this.state.port5}>
            </input>
          </dd>
          <dt>2.4GHz Card</dt>
          <dd>
            <input  disabled={this.state.ixiaButtonText === "Edit"}
                    className="config-card-input"
                    onChange={
                      (x) => this.setState({ip24: x.target.value})
                    }
                    defaultValue = {this.state.ip24}>
            </input>
          </dd>
          <dt>Slot</dt>
          <dd>
            <input  disabled={this.state.ixiaButtonText === "Edit"}
                    className="config-card-input"
                    onChange={
                      (x) => this.setState({
                        slot24: parseInt(x.target.value, 10)
                      })
                    }
                    defaultValue={this.state.slot24}>
            </input>
          </dd>
          <dt>Model</dt>
          <dd>
            <input  disabled={this.state.ixiaButtonText === "Edit"}
                    className="config-card-input"
                    onChange={
                      (x) => this.setState({model24: x.target.value})
                    }
                    defaultValue={this.state.model24}>
            </input>
          </dd>
          <dt>Port</dt>
          <dd>
            <input  disabled={this.state.ixiaButtonText === "Edit"}
                    className="config-card-input"
                    onChange={
                      (x) => this.setState({
                        port24: parseInt(x.target.value, 10)
                      })
                    }
                    defaultValue={this.state.port24}>
            </input>
          </dd>
          <dt>Ethernet Card</dt>
          <dd>
            <input  disabled={this.state.ixiaButtonText === "Edit"}
                    className="config-card-input"
                    onChange={
                      (x) => this.setState({ethernetIP: x.target.value})
                    }
                    defaultValue = {this.state.ethernetIP}>
            </input>
          </dd>
          <dt>Slot</dt>
          <dd>
            <input  disabled={this.state.ixiaButtonText === "Edit"}
                    className="config-card-input"
                    onChange={
                      (x) => this.setState({
                        ethernetSlot: parseInt(x.target.value, 10)
                      })
                    }
                    defaultValue={this.state.ethernetSlot}>
            </input>
          </dd>
          <dt>Model</dt>
          <dd>
            <input  disabled={this.state.ixiaButtonText === "Edit"}
                    className="config-card-input"
                    onChange={
                      (x) => this.setState({ethernetModel: x.target.value})
                    }
                    defaultValue={this.state.ethernetModel}>
            </input>
          </dd>
          <dt>Port</dt>
          <dd>
            <input  disabled={this.state.ixiaButtonText === "Edit"}
                    className="config-card-input"
                    onChange={
                      (x) => this.setState({
                        ethernetPort: parseInt(x.target.value, 10)
                      })
                    }
                    defaultValue={this.state.ethernetPort}>
            </input>
          </dd>
          <h4>VLAN</h4>
          <dt>WAN</dt>
          <dd>{this.state.wan}</dd>           
          <dt>VLAN 1</dt>
          <dd>{this.state.vlan1}</dd>
          <dt>VLAN 2</dt>
          <dd>{this.state.vlan2}</dd>
          <dt>VLAN 3</dt>
          <dd>{this.state.vlan3}</dd>
          <button className="btn"
                  onClick={
                    () => this.changeIxiaButton()
                  }>
            {this.state.ixiaButtonText}
          </button>
        </dl>
        <span className='divider'/>
        <h4>Attenuator</h4>
        <dl>
          <dt>Manufacturer</dt>
          <dd>
            <input  disabled={this.state.attenuatorButtonText === "Edit"}
                    className="config-card-input"
                    onChange={
                      (x) => this.setState({
                        attenuatorManufacturer: x.target.value
                      })
                    }
                    defaultValue={this.state.attenuatorManufacturer}>
            </input>
          </dd>
          <dt>5GHz Ports</dt>
          <dd>
            <input  disabled={this.state.attenuatorButtonText === "Edit"}
                    className="config-card-input"
                    onChange={
                      (x) => this.setState({
                        attenuator5Ports: x.target.value
                      })
                    }
                    defaultValue={this.state.attenuator5Ports}>
            </input>
          </dd>
          <dt>5GHz Attenuation</dt>
          <dd>
            <input  disabled={this.state.attenuatorButtonText === "Edit"}
                    className="config-card-input"
                    type="number"
                    value={this.state.atten_5}
                    onChange={
                      (x) => this.changeAtten(5, x.target.value)
                    }>
            </input>
          </dd>
          <dt>24GHz Ports</dt>
          <dd>
            <input  disabled={this.state.attenuatorButtonText === "Edit"}
                    className="config-card-input"
                    onChange={
                      (x) => this.setState({
                        attenuator24Ports: x.target.value
                      })
                    }
                    defaultValue={this.state.attenuator24Ports}>
            </input>
          </dd>
          <dt>24GHz Attenuation</dt>
          <dd>
            <input  disabled={this.state.attenuatorButtonText === "Edit"}
                    className="config-card-input"
                    type="number"
                    value={this.state.atten_24}
                    onChange={
                      (x) => this.changeAtten(24, x.target.value)
                    }>
            </input>
          </dd>
          <dt>IP</dt>
          <dd>
            <input  disabled={this.state.attenuatorButtonText === "Edit"}
                    className="config-card-input"
                    onChange={
                      (x) => this.setState({attenuatorIP: x.target.value})
                    }
                    defaultValue={this.state.attenuatorIP}>
            </input>
          </dd>
          <button className="btn"
                  onClick={
                    () => this.changeAttenuatorButton()
                  }>
            {this.state.attenuatorButtonText}
          </button>
        </dl>
      </div>
    )
  }
}

export default connect(
  null,
  { saveIxiaConfigChange,
    saveAttenuation,
    saveAttenuatorConfigChange,
    setTestSetupError,
    setTestSetupSuccess,
    sendAttenuation,
    getAttenuation }
)(ChamberConfiguration)