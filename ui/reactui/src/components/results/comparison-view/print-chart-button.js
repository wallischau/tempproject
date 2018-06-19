import React from 'react'


const PrintChartButton = ({ getUri, file_name }) => {
  return (
    <button 
    className='print-chart-button'
    onClick={() => { 
      const link = document.createElement('a')
      link.download = file_name + '.png'
      link.href = getUri()
      document.body.appendChild(link)
      link.click()
      document.body.removeChild(link)
    }}>
      download chart
    </button>
  )
}

export const getUri = (ref_name) => {
  return function () { // can't bind () => {}
    return this.refs[ref_name].chartInstance.toBase64Image() 
  }
}


export default PrintChartButton
