// import React from 'react'; /// only needed if using jsx. 

const small_width = 100

export const pass_rate_columns = [
  // {
  //   Header: 'Description', 
  //   accessor: 'description',
  //   width: 'fit-content' 
  // }, 
  {
    Header: 'Measurement Criteria',
    accessor: 'criteria',
    width: 300
  }, {
    Header: 'Achieved', 
    accessor: 'achieved',
    width: small_width,
    getProps: (state, rowInfo, column) => {
      return {
        style: {
          background: rowInfo.original.achieved === '100%' ? '#dff0d8' : '#f2dede',
          textAlign: 'center'
        }
      }
    }
  }, {
    Header: 'Passed', 
    accessor: 'passed',
    width: small_width,
    getProps: (state, rowInfo, column) => {
      return {
        style: {
          background: rowInfo.original.achieved === '100%' ? '#dff0d8' : '#f2dede',
          textAlign: 'center'
        }
      }
    }
  }, {
    Header: 'Failed', 
    accessor: 'failed',
    width: small_width,
    getProps: (state, rowInfo, column) => {
      return {
        style: {
          background: rowInfo.original.achieved === '100%' ? '#dff0d8' : '#f2dede',
          textAlign: 'center'
        }
      }
    }
  }, {
    Header: 'Aborted', 
    accessor: 'aborted', 
    width: small_width,
    getProps: (state, rowInfo, column) => {
      return {
        style: {
          background: rowInfo.original.aborted*1 > 0 ? '#f2dede' : '#dff0d8',          
          textAlign: 'center'
        }
      }
    }
  }, {
    Header: 'Total', 
    accessor: 'total',
    width: small_width,
    getProps: (state, rowInfo, column) => {
      return {
        style: {
          textAlign: 'center'
        }
      }
    }
  }
]




export const performace_columns = [
  {
    Header: 'Performance Criteria', 
    accessor: 'criteria', 
    // width: 'fit-content',
    getProps: () => {
      return {
        style: {
          textAlign: 'right'
        }
      }
    }
  }, {
    Header: 'Passed',
    accessor: 'passed',
    // width: small_width,
    getProps: (state, rowInfo, column) => {
      return {
        style: {
          background: rowInfo.original.total === rowInfo.original.passed ? '#dff0d8' : '#f2dede',
          textAlign: 'center'
        }
      }
    }
  }, {
    Header: 'Total', 
    accessor: 'total',
    // width: small_width,
    getProps: (state, rowInfo, column) => {
      return {
        style: {
          background: rowInfo.original.total === rowInfo.original.passed ? '#dff0d8' : '#f2dede',
          textAlign: 'center'
        }
      }
    }
  }
]
