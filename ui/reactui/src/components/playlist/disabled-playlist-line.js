import React from 'react';

class DisabledPlaylistLine extends React.Component {

  contextMenu(options){
    this.props.contextMenu(options)
  }

  handleClick(){
    this.props.handleClick(this.props.id)
  }

  render() {
    if (this.props.is_enabled !== undefined){
      console.log("Hello!")
    }
    return ( 
        <PlaylistContainer className="disabled-playlist-line">
        <option className={this.props.ssidType} onContextMenu={() => this.contextMenu(this.props.id)} style={{fontStyle: 'italic', color: 'grey'}} onClick={ () => this.handleClick(this.props.id) }> { this.props.name }</option>
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

export default DisabledPlaylistLine


class PlaylistContainer extends React.Component {

  render() {
    return this.props.children;
  }
}