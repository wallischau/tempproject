import React from 'react';
import PlaylistLine from './playlist-line'

const PlaylistTable = (
  { list
  , queuedTests
  , contextMenu
  , handleClick
  , hideDisabledOne
  , hideDisabledTwo
  , switchDisabledTwo
  , switchDisabledOne
  , scanSSID
  , moveToList
  , ssids24
  , ssids5
  , selectedSSID24
  , selectedSSID5
  , changeSSID 
  }) => {

  return (
    <div className="tab-content">
    
      <table id="playlistTable">
        <tbody>
          <tr>
            <td>
              <select size="25" width="250px" className="playlist">
              {list.map(x => (
                <PlaylistLine {...x}
                              id={x.name}
                              key={["other",x.name].join("-")}
                              ssidType="playlist-item"
                              contextMenu={contextMenu}
                              handleClick={handleClick}
                              hideDisabled={hideDisabledOne}
                              />
              ))}
              </select>
              <p> Hide Disabled Tests: 
                  <input  className="checkbox"
                          checked={hideDisabledOne || ''}
                          onChange={switchDisabledOne}
                          type="checkbox"/>
              </p>
            </td>
            <td>
              <button className="btn" onClick={moveToList}> >> </button>
            </td>
            <td>
              <select size="25" width="250px" className="playlist">
              {/* Need to filter out empty array from toggle view update */}
              {queuedTests.filter(qt => qt !== undefined && qt.length !== 0).map(x => (
                <PlaylistLine {...x}
                              id={["other",x.name].join("-")}
                              key={["other",x.name].join("-")}
                              ssidType="playlist-item"
                              contextMenu={contextMenu}
                              handleClick={handleClick}                        
                              hideDisabled={hideDisabledTwo}/>
              ))}
              </select>
              <p> Hide Disabled Tests: 
                  <input  className="checkbox"
                          checked={hideDisabledTwo || ''}
                          onChange={switchDisabledTwo}
                          type="checkbox"/>
              </p>
            </td>
            <td>                    
              <button className="btn" onClick={scanSSID}> Scan For SSIDs </button>
            </td>
          </tr>
        </tbody>
      </table>

      <h3> 2.4 Ghz SSIDs </h3>
      <table  id="ssid24Table"
              width="375px"
              style={{display: 'inline-block', marginRight: '5%'}}>
        <thead>
          <tr>
            <th> BSSID </th>
            <th> SSID </th>
            <th> RSSI </th>
          </tr>
        </thead>
        <tbody>   
        {ssids24 && ssids24.map(x => (    
          <tr key={x.ssid}
              className={
                x.ssid === selectedSSID24 && selectedSSID24 ? "selected" : ""}
              onClick={() => changeSSID(24, x.ssid)}>
            <td style={{paddingRight: '10px'}}> {x.bssid} &nbsp;</td>
            <td style={{paddingRight: '10px'}}> {x.ssid} &nbsp;</td> 
            <td > {x.rssi} </td>          
          </tr>
          ))}
        </tbody>
      </table>

      <h3> 5 Ghz SSIDs </h3>
      <table  id="ssid5Table"
              width="375px"
              style={{display: 'inline-block', marginLeft: '5%'}}>
        <thead>
          <tr>
            <th> BSSID </th>
            <th> SSID </th>
            <th> RSSI </th>
          </tr>
        </thead>
        <tbody>   
        {ssids5 && ssids5.map(x => (    
          <tr key={x.ssid}
              className={
                x.ssid === selectedSSID5 && selectedSSID5 ? "selected" : ""}
              onClick={()=> changeSSID(5, x.ssid)}>
              <td style= {{paddingRight: '10px'}}> {x.bssid} &nbsp;</td>
              <td style= {{paddingRight: '10px'}}> {x.ssid} &nbsp;</td> 
              <td > {x.rssi} </td>          
          </tr>
          ))}
        </tbody>
      </table>
    </div>
  )
}

export default PlaylistTable