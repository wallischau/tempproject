import React from 'react';
import DisabledPlaylistLine from './disabled-playlist-line'

class PlaylistLine extends React.Component {
  handleClick(){
    this.props.handleClick(this.props.id)
  }

  contextMenu(options){
    this.props.contextMenu(options)
  }

  tellApart(enabled, k, value, type){
    if (enabled === undefined) {
      enabled = true;
    } else {
      enabled = enabled['currently'];
    }

    //this.props.init_mouse_listener();
    if (enabled === true){
      return (<PlaylistLine {...value} enabled={enabled} name={k} ssidType={type} key={[this.state.key, k].join("/")} id={[this.props.id, k].join("/")} contextMenu={this.props.contextMenu} handleClick={this.props.handleClick} hideDisabled={this.props.hideDisabled}/>
      ) 
    }
    else if (!this.props.hideDisabled) {
      return (<DisabledPlaylistLine {...value} enabled={enabled} name={k} ssidType={type} key={[this.state.key, k].join("/")} id={[this.props.id, k].join("/")} contextMenu={this.props.contextMenu} handleClick={this.props.handleClick} hideDisabled={this.props.hideDisabled}/>)
    }
  }

  render() {
    let holder = null
    let type = ""
    if (this.props.test_cases){
      type = this.props.ssidType + " playlist-testcase"
      holder = this.props.test_cases
    }
    else if (this.props.test_suites){
      type = this.props.ssidType + " playlist-testtype"
      holder = this.props.test_suites
    }
    return ( 
        <PlaylistContainer className="playlist-line">
        <option className={this.props.ssidType} onContextMenu={() => this.contextMenu(this.props.id)} onClick={ () => this.handleClick(this.props.id) }> {this.props.modified ? "* " : ""}{ this.props.name }</option>
        {holder && !this.props.hide && Object.keys(holder).sort().map((keyName) => (
          this.tellApart(holder[keyName]['enabled'], keyName, holder[keyName], type)
          ))}
        </PlaylistContainer>
    )
  } 
  constructor(props) {
    super(props)
    this.state = {
      ...props
    }
  }

}

export default PlaylistLine


class PlaylistContainer extends React.Component {

  render() {
    return this.props.children;
  }


}