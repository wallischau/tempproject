import React from 'react';
import ConfigurationLine from './configuration-line'

const ConfigurationTable = ({ chambers, selected, handleClick, saveEthernet, edit }) => {
  return (
    <div className="well">
      <table className="configuration-table">
        <thead>
          <tr>
            <th><center>Chassis</center></th>
            <th><center>Reserved by</center></th>
            <th><center>Slot</center></th>
            <th><center>Port</center></th>
            <th><center>VLAN Switch IP</center></th>
            <th><center>VLAN Interface</center></th>
          </tr>
        </thead>
        <tbody>
          {chambers.map(x => (
            <ConfigurationLine {...x} key={x._id} selected={selected} handleClick={() => handleClick(x._id)} saveEthernet={saveEthernet} edit={edit}/>
          ))}
        </tbody>
      </table>
    </div>
  )
}

export default ConfigurationTable