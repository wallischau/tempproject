import React from 'react'
import { Bar as BarChart } from 'react-chartjs-2';

import SingleSelect, { handleChangeSingleSelect } from '../../../app/single-select'
import { organize_by_types, bar_chart_colors, pf_bar_graph_options, total_tests_options } from '../standards'
import { tcp_pf } from '../../pass-fail-functions'
import PrintChartButton, { getUri } from '../print-chart-button'


class TCPCompare extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      organize_by: 'band' /// this will have to move down into individual chart display components
    }
    this.handleChangeOrganizeBy  = handleChangeSingleSelect.bind(this)
  }

  fromTestRunToDisplayString(tr) {
    let datetime = '00'
    if (tr.test_start) {
      const trSplit = tr.test_start.split('T')
      const timeSplit = trSplit[1].split(':')
      const date = trSplit[0]
      const time = [timeSplit[0], timeSplit[1]].join(':')
      datetime = `${date} ${time}`
    }
    
    const name = tr.user ? tr.user.lname : 'someone'

    const display = `${datetime} - ${name} (${tr.firmware.company} ${tr.firmware.model_name})`
    
    return display
  }

  preRender() {
    // These compare view components were intentially coded non-DRY in anticipation of breaking logic into sub-components. 
    // Currently those sub-components aren't needed, yet!
    const results_by_series = this.props.runs.reduce((out, current) => {
      switch (this.props.chart_series_type_id*1) {
        case 0: {
          /// model == all results for the same model together
          const model = current.firmware.model_name
          out.hasOwnProperty([model]) ? out[model].push(current) : out[model] = [current]
          break
        }
        case 1: {
          /// firmware == all results for the same firmware together
          const firmware = `${current.firmware.model_name} ${current.firmware.name}`
          out.hasOwnProperty([firmware]) ? out[firmware].push(current) : out[firmware] = [current]
          break
        }
        case 2: {
          /// per run == no change
          out[this.fromTestRunToDisplayString(current)] = [current]
          break
        }
      
        default:
          break;
      }

      return out
    }, {})



    //// a this point, could be the split from main -> child compos. each individual compo from here will calc chart data independantly
    /// reconsidering indivdual organize by? use organize by in the 
    /// pass/fail
    /// max
    /// total

    const organized_data = {}

    Object.keys(results_by_series).forEach(sublabel => {
      // flatten data_to_bundle and map down to just data obj
      const results_data_to_bundle = [].concat(...results_by_series[sublabel].map(tr => tr.test_results[this.props.test_type])).map(tr => tr.data)

      const data_bundle = {}

      results_data_to_bundle.forEach(tr => {
        if (!tr) return /// eh let's not have null data here pls?
        switch (this.state.organize_by) {
          case 'band': {
            const labeler = tr.ghz.length === 1 ? `${tr.ghz[0]}Ghz ${tr.mhz[0]}MHz` : 'Dual Band'
            data_bundle.hasOwnProperty(labeler) ? data_bundle[labeler].push(tr) : data_bundle[labeler] = [tr]
            break;
          }

          case 'band_ss': {
            let labeler = tr.ghz.length === 1 ? `${tr.ghz[0]}Ghz ${tr.mhz[0]}MHz` : 'Dual Band'
            if (tr.ss) {
              labeler = labeler + 'SS' + tr.ss
            } 
            data_bundle.hasOwnProperty(labeler) ? data_bundle[labeler].push(tr) : data_bundle[labeler] = [tr]
            break
          }

          case 'mcs': {
            const labeler = tr.mcs.join('/')
            data_bundle.hasOwnProperty(labeler) ? data_bundle[labeler].push(tr) : data_bundle[labeler] = [tr]
            break
          }

          case 'mcs_major': {
            const majors = [7, 15, 23, 31] 
            //dual band? ignore for the time 
            if (tr.mcs.length > 1) break

            let labeler
            if (tr.mcs[0] === 9 && tr.ss) {
              const ss = Array.isArray(tr.ss) ? tr.ss.join('/') : tr.ss
              labeler = 'MCS 9 SS ' + ss + '(ac)'
            } else if (majors.includes(tr.mcs[0]) && tr.interface[0] !== '802.11ac') {
              labeler = 'MCS ' + tr.mcs[0] + ' (n)'
            } else {
              break
            }
            
            data_bundle.hasOwnProperty(labeler) ? data_bundle[labeler].push(tr) : data_bundle[labeler] = [tr]
            break
          }

          case 'direction': {
            const labeler = tr.direction
            data_bundle.hasOwnProperty(labeler) ? data_bundle[labeler].push(tr) : data_bundle[labeler] = [tr]
            break
          }

          case 'ipv': {
            const labeler = tr.ipv.map(ipv => 'IPv'+ipv).join('/')
            data_bundle.hasOwnProperty(labeler) ? data_bundle[labeler].push(tr) : data_bundle[labeler] = [tr]
            break
          }

          case 'standard': {
            const labeler = tr.interface.join('/')
            data_bundle.hasOwnProperty(labeler) ? data_bundle[labeler].push(tr) : data_bundle[labeler] = [tr]
            break
          }

          case 'ss': {
            if (tr.ss) {
              const labeler = tr.ss
              data_bundle.hasOwnProperty(labeler) ? data_bundle[labeler].push(tr) : data_bundle[labeler] = [tr]
            }
            break
          }

          default:
            break;
        }
      })
      organized_data[sublabel] = data_bundle

    })
    /// Results charts
    // TOTAL TESTS

    const total_tests_chart_data = {
      labels: new Set(),
      datasets: []
    }

    Object.keys(organized_data).forEach((dataset_label, i) => {
      const data_set = organized_data[dataset_label]

      const bundle = {
        label: dataset_label,
        data: []
      }

      Object.keys(data_set).forEach(key => {
        total_tests_chart_data.labels.add(key)        
        bundle.data.push(data_set[key].length)
      })
      
      Object.assign(bundle, bar_chart_colors[i % bar_chart_colors.length])
      total_tests_chart_data.datasets.push(bundle)
    })
    total_tests_chart_data.labels = Array.from(total_tests_chart_data.labels)    



    // MAX
    const max_throughput_chart_data = {
      labels: new Set(),
      datasets: []
    }
    
    Object.keys(organized_data).forEach((dataset_label, i) => {
      
      const data_set = organized_data[dataset_label]

      const bundle = {
        label: dataset_label,
        data: []
      }
      
      Object.keys(data_set).forEach(key => {
        max_throughput_chart_data.labels.add(key)

        const max_value = data_set[key].reduce((out, current) => {
          let new_out = out
          if (current.mss_results['536'] && (current.mss_results['536'].actual_mbps > out)) {
            new_out = current.mss_results['536'].actual_mbps
          }
          if (current.mss_results['1460'] && (current.mss_results['1460'].actual_mbps > out)) {
            new_out = current.mss_results['1460'].actual_mbps            
          }
          
          return new_out
        }, 0)

        bundle.data.push(max_value)
      })

      Object.assign(bundle, bar_chart_colors[i % bar_chart_colors.length])
      max_throughput_chart_data.datasets.push(bundle)
    })
    max_throughput_chart_data.labels = Array.from(max_throughput_chart_data.labels)


    // Pass Fail
    const pass_fail_chart_data = {
      labels: new Set(),      
      datasets: []
    }

    Object.keys(organized_data).forEach((dataset_label, i) => {      
      const data_set = organized_data[dataset_label]
            
      const bundle = {
        label: dataset_label,
        data: []
      }


      Object.keys(data_set).forEach(key => {
        pass_fail_chart_data.labels.add(key)

        let passed = 0
        let total = 0
        
        data_set[key].forEach(result => {

          total += 2
          const { pf_536, pf_1460 } = tcp_pf(result)
          if (pf_536) {
            passed++
          }

          if (pf_1460) {
            passed++
          }
        })

        const pass_fail_percentage = (passed/total) * 100

        bundle.data.push(pass_fail_percentage)
      })
      Object.assign(bundle, bar_chart_colors[i % bar_chart_colors.length])
      pass_fail_chart_data.datasets.push(bundle)
    })

    pass_fail_chart_data.labels = Array.from(pass_fail_chart_data.labels)

    return { pass_fail_chart_data, max_throughput_chart_data, total_tests_chart_data }
  }

  render () {
    const { pass_fail_chart_data, max_throughput_chart_data, total_tests_chart_data } = this.preRender()

    return (
      <div>
        <div className='results-selector well'>
          <span>Organize By:</span>
          <SingleSelect
            style={{ width: '200px' }}
            value={this.state.organize_by} 
            state_key={'organize_by'} 
            options={organize_by_types} 
            handleChange={this.handleChangeOrganizeBy} 
          />
        </div>

        <div className='chart-section'>
          <h2 className='compare-res-title'>Pass Fail</h2>
          <PrintChartButton
            getUri={getUri('pf_chart').bind(this)}
            file_name={`${this.props.test_type}_pass_fail_by_${this.state.organize_by}`} 
          />
          <BarChart 
            ref='pf_chart'
            height={100}
            data={pass_fail_chart_data} options={pf_bar_graph_options} 
            redraw 
          />
        </div>

        <div className='chart-section'>        
          <h2 className='compare-res-title'>Max throughput</h2>
          <PrintChartButton
            getUri={getUri('max_chart').bind(this)} 
            file_name={`${this.props.test_type}_max_throughput_by_${this.state.organize_by}` } 
          />
          <BarChart 
            ref='max_chart'
            height={100}
            data={max_throughput_chart_data} 
            options={{
              scales: {
                yAxes: [{      
                  display: true,
                  ticks: {
                    beginAtZero: true,
                  }, 
                  scaleLabel: {
                    display: true, 
                    labelString: 'Actual Mbps'
                  }
                }]
              }
            }} 
            redraw 
          />
        </div>

        <div className='chart-section'>        
          <h2 className='compare-res-title'>Total Tests Run</h2>
          <PrintChartButton
            getUri={getUri('total_chart').bind(this)} 
            file_name={`${this.props.test_type}_total_tests_by_${this.state.organize_by}`} 
          />
          <BarChart 
            ref='total_chart'
            height={100}
            data={total_tests_chart_data} options={total_tests_options} 
            redraw 
          />
        </div>

      </div>
    )
  }
}


export default TCPCompare
