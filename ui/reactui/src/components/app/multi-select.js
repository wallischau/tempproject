import React from 'react'
import PropTypes from 'prop-types'


const MultiSelect = ({ value, state_key, handleChange, options }) => (
  // value = array of [option.id]s (think: <select value> must be a subset of <option value> items)
  // options = arraoy of objects with { id, display }
  // name = key in state 
  <select multiple value={value} onChange={handleChange} state_key={state_key}>
    {options.map(opt => (<option value={opt.id} key={opt.id}>{opt.displayText.trim()}</option>))}
  </select>
)

MultiSelect.propTypes = {
  options: PropTypes.arrayOf(PropTypes.object).isRequired,
  state_key: PropTypes.string.isRequired,
  value: PropTypes.arrayOf(PropTypes.string).isRequired,
  handleChange: PropTypes.func.isRequired
}

export default MultiSelect


export function handleChangeMultiSelect (e) {
  /// must be non-arrow function for .bind(this) to work.
  const target = e.target
  const options = target.options
  const key = target.getAttribute('state_key')   
  const filtered_options = [...options].filter(o => o.selected).map(o => o.value)
  this.setState({ [key]: filtered_options })   
}

// Alternative approach, call this function to create handleChange  
// export const handleChangeMaker = (parent_setState) => {
//   return (e) => {
//     const target = e.target
//     const options = target.options
//     const key = target.getAttribute('state_key')   
//     const filtered_options = [...options].filter(o => o.selected).map(o => o.value)
//     parent_setState({ [key]: filtered_options })   
//     // setup in parent with 
//     //// this.handleChange = handleChangeMaker(this.setState.bind(this))
//   }
// }
