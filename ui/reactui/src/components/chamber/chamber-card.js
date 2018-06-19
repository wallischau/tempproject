import React from 'react';
import { Link } from 'react-router-dom'

const ChamberCard = (props) => {
  let chamberLink = "/chamber-status/" +
                    props.match.params.make +
                    '/' +
                    props.chamber.name;

  let dut = null;
  if (props.chamber.dut) {
    dut = props.chamber.dut
  }
  
  return (
    <Link to={{ pathname:chamberLink }}
          className={"chamber " + props.chamber.status}>
      <div>
        {'Chamber ' + props.chamber.name + ' Rack ' + props.chamber.rack + 
         ' Shelf ' + props.chamber.shelf}
      </div>
      <div>
        {dut ? dut.firmware.company + ' ' + dut.firmware.model_name : ''}
      </div>
      <div className="chamber-reservation">
        {props.chamber.reserved_by ?
          'Reserved by: ' + props.chamber.reserved_by : ''}
      </div>
    </Link>
  )
}

export default ChamberCard