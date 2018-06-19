import React from 'react';
import ChamberCard from './chamber-card'

const ChamberStatusGrid = ({ chambers, duts, makeFilter, match, user }) => {
  let filteredChambers = [];
  if (makeFilter) {
    filteredChambers = chambers.filter(chamber => chamber.make === makeFilter);
  } else {
    filteredChambers = chambers;
  }

  return (
    <div className="chambers-container">
      <h1>
        {makeFilter === "Ixia" ? 
                        "Ixia " :
                        makeFilter === "OctoBox" ?
                                       "OctoBox " :
                                       ""}Chamber Status
      </h1>
      <div className="chamber-grid">
        {filteredChambers.map(x => (
          <ChamberCard chamber={{...x}}
                       key={x._id}
                       match={match}
                       duts={duts}
                       user={user} />
        ))}
      </div>
    </div>
  )
}

export default ChamberStatusGrid