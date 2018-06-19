import React, { Component } from 'react';

class ResourceConfiguration extends Component {
  render() {
    const { ethernet } = this.props
    return (
      <div className="resource-configuration">
      {
        ethernet && 
        <div>
          <div>Chassis: {ethernet.chassis_ip}</div>
          <div>VLAN Switch IP: {ethernet.vlan_switch_ip}</div>
          <div>Shelf: {ethernet.slot}</div>
          <div>Port: {ethernet.port}</div>
          <div>VLAN Switch IP: {ethernet.vlan_switch_ip}</div>
          <div>VLAN Interface: {ethernet.vlan_interface}</div>
        </div>
      }
      <center>
        <button className="resourceBtn" onClick={() => this.props.insertNewEthernet()}>Insert New Ethernet</button>
        <button className="resourceBtn" disabled={!this.props.selected} hidden={!this.props.selected} onClick={() => this.props.editEthernet(this.props.selected)}> Edit Ethernet </button>
        <button className="resourceBtn" disabled={!this.props.selected} hidden={!this.props.selected} onClick={() => this.props.deleteEthernet(this.props.selected)}> Delete Ethernet </button>
        </center>
      </div>
    );
  }
}

export default ResourceConfiguration