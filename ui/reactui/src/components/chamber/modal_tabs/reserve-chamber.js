
import React, { Component } from 'react'
import { connect } from 'react-redux'
import  { reserveChamber
        , unReserveChamber
        
        , setTestSetupSuccess 
        } from '../../../services/chambers/actions'
import { setTestSetupError} from '../../../services/snackbars/actions'

class ReserveChamber extends Component {
  constructor(props) {
    super(props)


    this.state= {      
      startDate: this.props.chamber.start,
      endDate: this.props.chamber.end,
    }
    
    this.setDate = this.setDate.bind(this)
    this.updateReservationStatus = this.updateReservationStatus.bind(this)
    this.releaseChamber = this.releaseChamber.bind(this)
  }

  setDate(direction, value){
    let date = value.split("-")
    let newDate = new Date(parseInt(date[0], 10),
                           parseInt(date[1], 10)-1,
                           parseInt(date[2], 10)).toISOString()
    if (direction === "start"){
      this.setState({startDate: newDate})
    }
    else if (direction === "end") {
      this.setState({endDate: newDate})
    }
  }

  updateReservationStatus(){
    if (!this.state.startDate || !this.state.endDate){
      this.props.setTestSetupError(
        this.props.chamber.name,
        'Must have a Start Date and End Date set to Update Reservation')
      return
    }
    if (this.state.startDate > this.state.endDate){
      this.props.setTestSetupError(
        this.props.chamber.name,
        'Start Date can not be after End Date');
      return
    }
    let data = {
      chamber: this.props.chamber.name,
      userid: this.props.user.userid,
      start: this.state.startDate,
      end: this.state.endDate
    }
    this.props.reserveChamber(data)
  }

  releaseChamber(){
    let data = {
      chamber: this.props.chamber.name,
      userid: this.props.user.userid
    }
    this.setState({startDate: null})
    this.setState({endDate: null})
    this.props.unReserveChamber(data)
  }

  render() {
    let start = this.state.startDate ?
                this.state.startDate.substring(
                  0,
                  this.state.startDate.indexOf('T')) :
                null
    let end = this.state.endDate ?
              this.state.endDate.substring(
                0,
                this.state.endDate.indexOf('T')) :
              null
    let status = this.props.chamber.status
    let showStatus = ""
    if (status === "reserved"){
      showStatus = "Reserved by " + this.props.chamber.reserved_by
    }
    else if (status === "open"){
      showStatus = "Open"
    }
    return (
      <div className='tab-content'>
        <div className ="well">
          <label> Current Reservation Status </label>
          <p>
            <label className={status}> {showStatus} </label>
          </p>

          <label> Start </label> <br />
          <input  width="100%"
                  value={start === null ? "" : start}
                  onChange={(x)=>this.setDate("start", x.target.value)}
                  style={{marginTop: '15px', marginBottom: '15px'}}
                  type="date"/> <br />
          <label>End</label>
          <input  width="100%"
                  value={end === null ? "" : end}
                  onChange={(x)=>this.setDate("end", x.target.value)}
                  style={{marginTop: '15px', marginBottom: '15px'}}
                  type="date"/> <br />
        </div>
        <button className="updateButton"
                onClick={() => this.updateReservationStatus()}
                disabled={
                  this.props.chamber.reserved_by !== this.props.user.userid &&
                  this.props.chamber.reserved_by !== "" &&
                  this.props.chamber.reserved_by !== null
                }> Update Reservation Status </button>
        <button onClick={() => this.releaseChamber()}
                disabled={
                  this.props.chamber.reserved_by !== this.props.user.userid &&
                  this.props.chamber.reserved_by !== ""
                }
                style={
                  {
                    padding: '5px', float: 'right'
                  }
                }> Release Chamber </button>
        </div>
    )
  }
}


export default connect(
  null,
  { reserveChamber,
  unReserveChamber,
  setTestSetupError,
  setTestSetupSuccess  }
)(ReserveChamber)