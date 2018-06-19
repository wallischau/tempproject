import React, { Component } from 'react';
import { bindActionCreators } from 'redux'
import { connect } from 'react-redux'
import Route from 'react-router-dom/Route';

import AuthFilter from '../../components/app/auth-filter'
import ResourceConfiguration from '../../components/configuration/resource-configuration'
import ConfigurationTable from '../../components/configuration/configuration-table'

import { fetchConfiguration } from '../../services/configurations/actions'
import { updateConfiguration } from '../../services/configurations/actions'
import { addConfiguration } from '../../services/configurations/actions'
import { deleteConfiguration } from '../../services/configurations/actions'

import './style.css'

class Configuration extends Component {
  constructor(props) {
    super(props)
    this.state = {selected: null, edit: null, new: null}
    this.editEthernet = this.editEthernet.bind(this)
    this.saveEthernet = this.saveEthernet.bind(this)
    this.handleClick = this.handleClick.bind(this)
    this.insertNewEthernet = this.insertNewEthernet.bind(this)
    this.deleteEthernet = this.deleteEthernet.bind(this)

    const { ethernets, fetchConfiguration } = this.props
    console.log(ethernets, fetchConfiguration)
    console.log(this.props);
  	this.props.fetchConfiguration();
  }

  editEthernet(id) {
    this.setState({edit: id})
  }

  saveEthernet(id, data) {
    console.log(data)
    this.setState({selected: null});
    this.setState({edit: null});
    this.setState({newEthernet: null});
    this.props.updateConfiguration(id, data);
    this.props.fetchConfiguration();
  }

  deleteEthernet(id){
    this.props.deleteConfiguration(id);
    this.setState({selected: null});
  }

  handleClick(id) {
    this.setState({selected: id});
  }

  insertNewEthernet(){
    this.setState({newEthernet: true});
    let newItem = {
      type: "ethernet",
      chassis_ip: "",
      card_serial: "",
      slot: "",
      port: "",
      reserved_by_chamber: ""
    }

    this.props.addConfiguration(newItem).then(() => {
      this.props.fetchConfiguration().then(() => {
        this.handleClick(this.props.ethernets[this.props.ethernets.length-1]._id);
        this.editEthernet(this.props.ethernets[this.props.ethernets.length-1]._id);
      })
    })
  }

  render(){
    return (
      <AuthFilter>
        <Route path={`/configuration/`} component={({match}) => <ResourceConfiguration chamber={ this.props.ethernets }
        editEthernet={this.editEthernet} saveEthernet={this.saveEthernet} insertNewEthernet={this.insertNewEthernet} 
        deleteEthernet={this.deleteEthernet} edit={this.state.edit} selected={this.state.selected} newEthernet={this.state.newEthernet}/> }/>
        <ConfigurationTable chambers={this.props.ethernets} selected={this.state.selected} handleClick={this.handleClick} 
        saveEthernet={this.saveEthernet} edit={this.state.edit} />
      </AuthFilter>
    );
  }
}

const mapStateToProps = state => ({ 
  ethernets: state.configurations.configurations
})

const mapDispatchToProps = dispatch => bindActionCreators({ 
  fetchConfiguration,
  updateConfiguration,
  addConfiguration,
  deleteConfiguration
}, dispatch)

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(Configuration)