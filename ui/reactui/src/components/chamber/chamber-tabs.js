import React from 'react'

import ChamberConfiguration from './modal_tabs/chamber-configuration'
import ChamberWiring from './modal_tabs/chamber-wiring'
import ChamberDut from './modal_tabs/chamber-dut'
import ReserveChamber from './modal_tabs/reserve-chamber'
import ChamberTestSetup from './modal_tabs/chamber-test-setup'

const ChamberTabs = (props) => {
  let tabContent = null;
  switch (props.tab) {
    case 'config':
      tabContent = <ChamberConfiguration chamber={props.chamber}
                                         setTab={props.setTab}
                                         changeAtten={props.changeAtten}
                                         setAtten={props.setAtten} />;
      break;
    case 'wiring':
      tabContent = <ChamberWiring chamber={props.chamber} />;
      break;
    case 'dut':
      tabContent = <ChamberDut chamber={props.chamber}
                               duts={props.duts} 
                               changeDut={props.changeDut}
                               chosenDut={props.chosenDut}/>;
      break;
    case 'reserve':
      tabContent = <ReserveChamber chamber={props.chamber}
                                   user={props.user} />;
      break;
    case 'setup':
      tabContent = <ChamberTestSetup chamber={props.chamber} user={props.user} />;
      break;
    default:
      tabContent = (
        <div className='tab-content'>
          <h4>Placeholder</h4>
        </div>
      )
      break;
  }

  return (tabContent)
}

export default ChamberTabs