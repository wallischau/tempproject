import React, { Component } from 'react';
import { connect } from 'react-redux'

import PlaylistTable from '../../playlist/playlist-table'
import { fetchTestSuites, scanForSSIDs } from '../../../services/playlist/actions'
import { populateTestItems } from '../../../services/testqueue/actions'
import { setTestSetupError } from '../../../services/snackbars/actions'
import './playlist-style.css'

class TestSuitePlaylist extends Component {
  constructor(props) {
    super(props)
    this.state = 
    { selected: null
    , testSuiteList: []
    , hideDisabledOne: true
    , hideDisabledTwo: true 
    , ssids24: []
    , ssids5: []
    }

    this.showSuite = this.showSuite.bind(this)
    this.handleClick = this.handleClick.bind(this)
    this.moveToList = this.moveToList.bind(this)
    this.mergeItem = this.mergeItem.bind(this)
    this.init_mouse_listener = this.init_mouse_listener.bind(this)
    this.contextMenu = this.contextMenu.bind(this)
    this.removeFromList = this.removeFromList.bind(this)
    this.getTestSuiteDetails = this.getTestSuiteDetails.bind(this)
    this.changeEnable = this.changeEnable.bind(this)
    this.switchDisabledOne = this.switchDisabledOne.bind(this)
    this.switchDisabledTwo = this.switchDisabledTwo.bind(this)
    this.scanSSID = this.scanSSID.bind(this)

    const { fetchTestSuites } = this.props
    fetchTestSuites(this.props.chamber)
    .then((data) => {
      //// put full list of test suites into state. State hold hide/show status
      for (var i = 0; i < data.length; i++){
        data[i].hide = true
      }
      this.setState({ testSuiteList: data })
    });
  }

  showSuite(id) {
    let listHolder = [] 
    if (id.includes("other-")){
      listHolder = this.props.queuedTests.slice()
    }
    else {
      listHolder = this.state.testSuiteList
    }
    let fullName = id.replace("other-", "")
    let names = fullName.split("/")
    let num = 0;
    for (var i = 0; i < listHolder.length; i++) {
      if (listHolder[i] === undefined) {
        listHolder[i] = [];
      }

      if (listHolder[i].name === names[0]){
        num = i;
      }
    }
    let begin = listHolder[num]
    let next = begin.test_suites ? begin.test_suites : begin.test_cases;
    if (names.length === 1){
      for (var obj in next){
        next[obj].hide = !next[obj].hide
      }
      begin.hide = !begin.hide
    }
    else if (names.length === 2){
      next[names[1]].hide = !next[names[1]].hide
    }

    if (id.includes("other-")){
      this.props.updateQueuedTests(listHolder)
    }
    else {
      this.setState({ testSuiteList: listHolder })
    }

  }

  switchDisabledOne() {
    this.setState({hideDisabledOne: !this.state.hideDisabledOne})
  }

  switchDisabledTwo() {
    this.setState({hideDisabledTwo: !this.state.hideDisabledTwo})
  }

  removeFromList(obj){
    let fullName = obj.replace("other-", "")
    let obj_pieces = fullName.split("/")
    let listHolder = this.props.queuedTests.slice()
    let num = 0
    for (var j = 0; j < listHolder.length; j++){
      if (listHolder[j]){
        if (listHolder[j].name === obj_pieces[0]){
          num = j
        }
      }
      
    }
    let begin = listHolder[num]
    let next = begin.test_suites;
    for (var i = 1; i < obj_pieces.length; i++) {
      if (i === obj_pieces.length-1){
        delete next[obj_pieces[i]]
      }
      else {
        if (next[obj_pieces[i]].test_cases){
          next = next[obj_pieces[i]].test_cases
        }
        else {
          next = next[obj_pieces[i]]
        }
      }
    }
    this.props.updateQueuedTests(listHolder)
    return
  }

  changeEnable(obj){
    let fullName = obj.replace("other-", "")
    let obj_pieces = fullName.split("/")
    let listHolder = this.props.queuedTests.slice()
    let num = 0
    for (var j = 0; j < listHolder.length; j++){
      if (listHolder[j] && listHolder[j].name === obj_pieces[0]){
        num = j
      }
    }
    let begin = listHolder[num]
    let next = begin.test_suites;
    for (var i = 1; i < obj_pieces.length; i++) {
      if (next[obj_pieces[i]].test_cases){
        next[obj_pieces[i]].modified = true
        next = next[obj_pieces[i]].test_cases
      }
      else {
        next = next[obj_pieces[i]]
      }
    }
    next.enabled['currently'] = !next.enabled['currently']
    this.props.updateQueuedTests(listHolder)
    return next
  }

  scanSSID(){
    let scanning = [{
      rssi: 'Scanning',
      bssid: 'SSIDs',
      ssid: 'for'
    }]
    this.setState({ssids24: scanning})
    this.setState({ssids5: scanning})
    let obj24 = this.props.chamber.card_config['wifi_24_GHz']
    obj24.channel = 6
    obj24.frequency = 2400
    let obj5 = this.props.chamber.card_config['wifi_5_GHz']
    obj5.channel = 149
    obj5.frequency = 5000
    this.props.scanForSSIDs(this.props.chamber.name, obj24).then((data) => {
      let arr = [];
      let newSSID = {};
      if (data.length === 0){
        arr.push(data)
      }
      else {
        data.forEach(function (line){
          newSSID = {
            bssid: line[0],
            ssid: line[1],
            rssi: line[2]
          }
          arr.push(newSSID)
        });
        arr.sort(function(a, b) {
          return b - a
        });
      }      
      this.setState({ssids24: arr})
    });
    this.props.scanForSSIDs(this.props.chamber.name, obj5).then((data) => {
      let arr = [];
      let newSSID = {};
      if (data.length === 0){
        arr.push(data)
      }
      else {
        data.forEach(function (line){
          newSSID = {
            bssid: line[0],
            ssid: line[1],
            rssi: line[2]
          }
          arr.push(newSSID)
        });
        arr.sort(function(a, b) {
          return b - a
        });
      } 
      this.setState({ssids5: arr})
    });
  }

  moveToList() {
    let items = this.state.selected.split("/")
    let listHolder = this.props.queuedTests.slice()
    for (var i = 0; i < this.state.testSuiteList.length; i++) {
      if (this.state.testSuiteList[i].name === items[0]){
        if (!listHolder.includes(this.state.testSuiteList[i]) && items.length === 1){
          if (listHolder.length === 0){
            let fullWave = JSON.parse(JSON.stringify(this.state.testSuiteList[i]))
            listHolder[i] = fullWave
          }
          else{
            let fullWave = JSON.parse(JSON.stringify(this.state.testSuiteList[i]))
            if (listHolder[i]){
              this.mergeItem(listHolder[i], fullWave, items, 0)
            }
            else {
              listHolder[i] = fullWave
            }
          }          
        }
        else {
          let copyOfList = JSON.parse(JSON.stringify(this.state.testSuiteList[i]));
          let holder = JSON.parse(JSON.stringify(this.state.testSuiteList[i]));
          copyOfList.test_suites = {};
          let container = copyOfList.test_suites;
          for (var j = 1; j < items.length; j++){
            container[items[j]] = holder.test_cases ? JSON.parse(JSON.stringify(holder.test_cases[items[j]])) : container[items[j]] = JSON.parse(JSON.stringify(holder.test_suites[items[j]]));    
            container = container[items[j]]
            if (container && container.test_cases && j!== items.length-1){
              container.test_cases = {}
              container = container.test_cases
              holder = holder.test_cases ? holder.test_cases[items[j]] : holder = holder.test_suites[items[j]]
            }
          }
          if (listHolder.length === 0){
            listHolder[i]=(copyOfList)
          }
          else{
            if (listHolder[i]){
              this.mergeItem(listHolder[i], copyOfList, items, 1)
            }
            else {
              listHolder[i] = copyOfList
            }
          }
        }
        this.props.updateQueuedTests(listHolder)
      }
    }
  }

  mergeItem(list, obj, name, num){
    let objName = obj.test_cases ? obj.test_cases : obj.test_suites
    let arr = list.test_cases ? list.test_cases : list.test_suites
    if (num === 0){
      for (var element in list.test_cases){
        name.push(element)
        this.mergeItem(list, obj, name, 1)
        name.splice(name.indexOf(element), 1)
      }
      return Object.assign(arr, objName)
      
    }
    else if (num < name.length){
      if (!arr[name[num]]) {
        return Object.assign(arr, objName)
      }
      else {
        if (arr[name[num]].test_cases && objName[name[num]].test_cases){
          return this.mergeItem(arr[name[num]], objName[name[num]], name, num)
        }
        else {
          return
        }
      }
    }
  }

  contextMenu(options) {
    const React_this = this
    if (options.indexOf("other-") !== -1) {
    
      var element = document.getElementById('reactjs-context-menu');
      var mouse_x = window._mouse.x || 0;
      var mouse_y = window._mouse.y || 0;
      
      if (element) {
        document.body.removeChild(element);
      }
      
      element = document.createElement('div');
      element.id = 'reactjs-context-menu';
      
      element.style.position = 'fixed';
      element.style.left = mouse_x + 'px';
      element.style.top = mouse_y + 'px';
      element.style.minWidth = '300px';
      element.style.border = '1px solid #555';
      element.style.background = '#ddd';
      element.style.zIndex = '9001';

      let items = [];

      let count = options.split('/').length;
        if (count === 2){
        items = [
          {label: "Remove from List", action: "removeFromList"}
        ]
      }
      else if (count === 3) {
        items = [
          {label: "Enable/Disable", action: "changeEnable"},
          {label: "Remove from List", action: "removeFromList"}
        ]
      }
      else {
        return
      }
      
      
      document.body.appendChild(element);
      
      items.forEach((option, i) => {
        var new_option = document.createElement('div');
        var text_node = document.createTextNode(option.label);
        new_option.id = option.label
        new_option.appendChild(text_node);
        new_option.onclick = function() {
          if (option.action === "removeFromList"){
            React_this.removeFromList(options)
          }
          else if (option.action === "changeEnable"){
            React_this.changeEnable(options)
          }
        }
        element.appendChild(new_option);
      });
    }
    
  }

  init_mouse_listener() {
    
    document.addEventListener('click', $event => {
      var element = document.getElementById('reactjs-context-menu');    
      if (element) {
        document.body.removeChild(element);
      }
    });
    
    document.addEventListener('mousemove', $event => {
      window._mouse = {
        x: $event.clientX,
        y: $event.clientY
      }
    });
    
    document.addEventListener('contextmenu', $event => {
      $event.preventDefault();
      $event.stopPropagation();
    });
  }

  handleClick(id) {
    this.setState({selected: id});
    this.showSuite(id);
  }

  getTestSuiteDetails(id) {
    return this.state.testSuiteList.find((x) => x.name === id)
  }

  getTestTypeDetails(wave, id) {
    return this.state.testSuiteList[wave].find((x) => x.test_suite === id)
  }

  render(){
    this.init_mouse_listener()
    return (
      <PlaylistTable 

        queuedTests={this.props.queuedTests} 
        list={this.state.testSuiteList} 
        selected={this.state.selected} 

        contextMenu={this.contextMenu} 
        handleClick={this.handleClick} 
        moveToList={this.moveToList} 
        hideDisabledOne={this.state.hideDisabledOne}
        hideDisabledTwo={this.state.hideDisabledTwo}

        ssids24 = {this.state.ssids24}
        ssids5 = {this.state.ssids5}
        selectedSSID24={this.props.selectedSSID24}
        selectedSSID5={this.props.selectedSSID5}
        scanSSID={this.scanSSID}
        changeSSID={this.props.changeSSID}
        
        switchDisabledTwo={this.switchDisabledTwo} 
        switchDisabledOne={this.switchDisabledOne} 
      />
    );
  }
}

const mapStateToProps = state => ({ 
  ssidList: state.playlist.ssids,
})

export default connect(
  mapStateToProps,
  { scanForSSIDs
  , fetchTestSuites
  , populateTestItems
  , setTestSetupError
  }
)(TestSuitePlaylist)