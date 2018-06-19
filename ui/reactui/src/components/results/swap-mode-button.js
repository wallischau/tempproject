import React from 'react'

const INDV = 'individual view'
const COMP = 'comparison view'
const selected_color = '#ccffcc'

const SwapModeButton = ({ toggleMode, mode }) => {
  return (
    <div 
    style={{
      display: 'inline-block',
      textAlign: 'center', 
      cursor: 'pointer', 
      border: '1px solid rgb(145, 145, 145)',
      borderRadius: '25px',
      overflow: 'hidden'
    }}
    onClick={toggleMode}>
      <div
      style={{
        background: mode === INDV && selected_color,
        width: '130px',
        display: 'inline-block',
        padding: '5px',
      }}>
        Individual
      </div>
      <div
      style={{
        background: mode === COMP && selected_color,
        width: '130px',
        display: 'inline-block',
        padding: '5px',        
      }}>
        Comparative
      </div>
    </div>
  )
}


export default SwapModeButton
