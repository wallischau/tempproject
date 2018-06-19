import React from 'react'


const MetaDataSection = ({ info }) => {
  return (
  <section className="results-section results-metadata"> 
    <h2>Metadata</h2>
    <div className="results-inner-section">        
      <div className="data-section">
        {Object.keys(info).map(k => (
          <div key={k} className="meta-point">
            <span style={{fontWeight:'bold'}}>{k}</span>
            <span>{info[k]}</span>
          </div>)
        )}
      </div>
    </div>
  </section>
  )
}

export default MetaDataSection
