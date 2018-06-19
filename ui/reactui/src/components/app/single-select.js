import React from 'react'
import PropTypes from 'prop-types'


// options = [{id:_[unique string/num]_, display:_[what's shown]_}]

const SingleSelect = ({ value, name, state_key, handleChange, options, style }) => (
  <select className="dropdown" style={style} value={value} onChange={handleChange} name={name} state_key={state_key}>
    {options.map(opt => (<option value={opt.id} key={opt.id}>{opt.display}</option>))}
  </select>
) 

SingleSelect.propTypes = {
  options: PropTypes.arrayOf(PropTypes.object).isRequired,
  name: PropTypes.string,
  state_key: PropTypes.string,
  value: PropTypes.string.isRequired,
  handleChange: PropTypes.func.isRequired
}

export default SingleSelect


export function handleChangeSingleSelect(e) {
  const target = e.target
  const value = target.value 
  let key = target.name
  if(!key) key = target.getAttribute('state_key'); 
  this.setState({ [key]: value })
}
