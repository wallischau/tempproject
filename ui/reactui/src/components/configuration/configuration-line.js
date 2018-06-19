import React from 'react';

class ConfigurationLine extends React.Component {

  constructor(props) {
    super(props)
    this.state = {
      ...props
    }
    this.saveButton = this.saveButton.bind(this)
  }

  saveButton() {
    var stateObj = this.state;
    this.props.saveEthernet(stateObj._id, stateObj);
  }

  change(item, $event) {
    this.setState({[item]: $event.target.value})
  }

  render() {
    if (this.props.new === true){
      return (
        <tr className={ this.props._id === this.props.selected ? "configuration-line selected" : "configuration-line"} onClick={ this.props.handleClick }>
          <td><input defaultValue=""/></td> 
          <td><input defaultValue=""/></td>
          <td><input defaultValue=""/></td>
          <td><input defaultValue=""/></td>  
          <td><input defaultValue=""/></td>  
          <td><input defaultValue=""/></td>  
        </tr>
        )
    }
    else if (this.props._id === this.props.edit && this.props.reserved_by_chamber === ""){
      console.log("here")
      return (
        <tr className={ this.props._id === this.props.selected ? "configuration-line selected" : "configuration-line"} onClick={ this.props.handleClick }>
          <td><input value={this.state.chassis_ip} onChange={($event) => this.change("chassis_ip", $event)}/></td>
          <td><input value={this.state.reserved_by_chamber} onChange={($event) => this.change("reserved_by_chamber", $event)}/></td>
          <td><input value={this.state.slot} onChange={($event) => this.change("slot", $event)}/></td>
          <td><input value={this.state.port} onChange={($event) => this.change("port", $event)}/></td>  
          <td><input value={this.state.vlan_switch_ip} onChange={($event) => this.change("vlan_switch_ip", $event)}/></td> 
          <td><input value={this.state.vlan_interface} onChange={($event) => this.change("vlan_interface", $event)}/></td> 
          <td onClick={ this.saveButton } ><button>Save</button></td>
        </tr>
        )
    } else {
      return (
        <tr className={ this.props._id === this.props.selected ? "configuration-line selected" : "configuration-line"} onClick={ this.props.handleClick }>
          <td>{this.state.chassis_ip}</td>
          <td>{this.state.reserved_by_chamber}</td>
          <td>{this.state.slot}</td>
          <td>{this.state.port}</td>  
          <td>{this.state.vlan_switch_ip}</td>  
          <td>{this.state.vlan_interface}</td>  
        </tr>
      )
    }
  }

}

export default ConfigurationLine
