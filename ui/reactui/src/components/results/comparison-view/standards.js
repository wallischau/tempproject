/// File contains data needed across multiple result components
//   filter/organization options
//   select types/options
//   chart bar colors


export const chart_series_types = [
  {
    id: 0,
    display: 'Model',
  }, {
    id: 1,
    display: 'Firmware'
  }, {
    id: 2,
    display: 'Test Run'
  }
]

export const organize_by_types = [
  {
    id: 'band', 
    display: 'Band/Bandwidth'
  }, {
    id: 'band_ss',
    display: 'Band/Bandwidth + SS'
  }, {
    id: 'mcs', 
    display: 'MCS'
  }, {
    id: 'mcs_major',
    display: 'MCS (Major)'
  }, {
    id: 'direction',
    display: 'Direction'
  }, {
    id: 'ipv',
    display: 'IPV'
  }, {
    id: 'ss', 
    display: 'Spatial Stream'
  }, {
    id: 'standard',
    display: '802.11 Standard'
  }
]

export const bar_chart_colors = [
  {
    // blue
    backgroundColor: "rgba(151, 187, 205, 0.5)", 
    borderColor: "rgba(151, 187, 205, 0.8)", 
    hoverBackgroundColor: "rgba(151, 187, 205, 0.75)", 
    hoverBorderColor: "rgba(151, 187, 205, 1)", 
  }, 
  // {
  //   // grey
  //   backgroundColor: "rgba(220, 220, 220, 0.5)", 
  //   borderColor: "rgba(220, 220, 220, 0.8)", 
  //   hoverBackgroundColor: "rgba(220, 220, 220, 0.75)", 
  //   hoverBorderColor: "rgba(220, 220, 220, 1)", 
  // }, 
  {
    // purple
    backgroundColor: "rgba(198, 158, 239, 0.5)",
    borderColor: "rgba(198, 158, 239, 0.8)",
    hoverBackgroundColor: "rgba(198, 158, 239, 0.75)",
    hoverBorderColor: "rgba(198, 158, 239, 1)",
  }, 
  {
    // red
    backgroundColor: "rgba(239, 158, 158, 0.5)",
    borderColor: "rgba(239, 158, 158, 0.8)",
    hoverBackgroundColor: "rgba(239, 158, 158, 0.75)",
    hoverBorderColor: "rgba(239, 158, 158, 1)",
  }, 
  {
    // green
    backgroundColor: "rgba(209, 224, 193, 0.5)",
    borderColor: "rgba(209, 224, 193, 0.8)",
    hoverBackgroundColor: "rgba(209, 224, 193, 0.75)",
    hoverBorderColor: "rgba(209, 224, 193, 1)",
  }
]

export const pf_bar_graph_options = {
  scales: {
    // xAxes: [{
    // }],
    yAxes: [{      
      display: true,
      ticks: {
        beginAtZero: true,
        max: 100,
        callback: (value, index, values) => (value + '%')
      }, 
      scaleLabel: {
        display: true, 
        labelString: 'Percent Passed'
      }
    }]
  }
};

export const total_tests_options = {
  scales: {
    yAxes: [{      
      display: true,
      ticks: {
        beginAtZero: true,
      }, 
      scaleLabel: {
        display: true, 
        labelString: 'Number of Tests Run'
      }
    }]
  }
}
