import React, { Component } from 'react'
// import DatePicker from 'react-datepicker'
import moment from 'moment'
import autobind from 'class-autobind'
import 'react-datepicker/dist/react-datepicker.css';

import SingleSelect, { handleChangeSingleSelect } from '../../components/app/single-select'
import TechMatrixReport from '../../components/reports/report-specific-forms/tech-matrix'

import './style.css'

const BlankForm = () => (<div></div>)

const testOptions = [
  {id:0, display:"---"},
  {id:1, display:"Tech Matrix", component: TechMatrixReport},
  // {id:2, display:"Greater Reporto"},
  // {id:3, display:"OK Reportish"},
  // {id:4, display:"Book Report"},
  // {id:5, display:"Dummy Reports"},
]

class ReportsPage extends Component {
  constructor(props) {
    super(props)
    autobind(this)

    this.state = {
      report: '0', /// id of inital report loaded, set back to 0!!!
      selected_date: moment()
    }

    this.handleChange = handleChangeSingleSelect.bind(this)
  }

  handleDateChange(date) {
    this.setState({
      selected_date: date
    })
  }

  render() {
    const report_form = testOptions.find(o => o.id*1 === this.state.report*1)
    let FormComponent = BlankForm
    if (report_form) {
      FormComponent = report_form["component"] || BlankForm
    }

    return (
      <div className="reports">
        <h1>Reporting Page</h1>
        <section className="report-selector">
          <h2>Select a report</h2>
          <SingleSelect value={this.state.report} name='report' handleChange={this.handleChange} options={testOptions} />
        </section>
        <FormComponent />

        <div style={{ height: '50px' }} />



        <div style={{ height: '400px' }} />
        

        {/* component lib build zone */}
        {/* <DatePicker 
          selected={this.state.selected_date}
          onChange={this.handleDateChange}
        /> */}

        {/* GENERIC select component ----- one single select, one multi-select */}

        {/* engineer select */}

        {/* firmware select */}

        {/* test-type select */}

        {/* vendor select */}

        {/* model select */}

        {/* initiative select */}

        {/*  */}

      </div>
    )
  }
}


export default ReportsPage
