import React from 'react'
import { LineChart } from 'react-chartkick'


class RvRCompare extends React.Component {
  /// per run only. old system does not combine at all
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

    const display = `${datetime} ${name} (${tr.firmware.company} ${tr.firmware.model_name})`
    
    return display
  }

  render() {
    const graph_data_24 = this.props.runs.reduce((out, run) => {
      const fres = run.test_results.rate_vs_range.find((res) => res.data.ghz[0] === 2.4)
      if (fres) {
        out.push({ name: this.fromTestRunToDisplayString(run) ,data: fres.data.dB_throughput })
      }
      return out
    }, [])

    const graph_data_5_40 = this.props.runs.reduce((out, run) => {
      const fres = run.test_results.rate_vs_range.find(res => res.data.ghz[0] === 5 && res.data.mhz[0] === 40)
      if (fres) {
        out.push({ name: this.fromTestRunToDisplayString(run) ,data: fres.data.dB_throughput })
      }
      return out
    }, [])

    const graph_data_5_80 = this.props.runs.reduce((out, run) => {
      const fres = run.test_results.rate_vs_range.find(res => res.data.ghz[0] === 5 && res.data.mhz[0] === 80)
      if (fres) {
        out.push({ name: this.fromTestRunToDisplayString(run) ,data: fres.data.dB_throughput })
      }
      return out
    }, [])
    
    return (
      <div style={{ width: '95%' }}>
        <div className='chart-section'>
          <h2 className='compare-res-title'>2.4GHz 20MHz</h2>
          <LineChart
            // put these in indv results too  
            ytitle='Mbps'
            xtitle='Attenuation'
            id="24" 
            data={graph_data_24}
            height="600px"
            download={true}
            legend={true}
          />
        </div>

        <div className='chart-section'>
          <h2 className='compare-res-title'>5GHz 40Mhz</h2>
          <LineChart 
            ytitle='Mbps'
            xtitle='Attenuation'
            id="charter" 
            data={graph_data_5_40}
            height="600px"
            download={true}
            legend={true}
          />
        </div>
        <div className='chart-section'>
          <h2 className='compare-res-title'>5GHz 80Mhz</h2>
          <LineChart 
            ytitle='Mbps'
            xtitle='Attenuation'
            id="charter" 
            data={graph_data_5_80}
            height="600px"
            download={true}
            legend={true}
          />
        </div>
      </div>
    )
  }
}


export default RvRCompare
