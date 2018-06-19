import React from 'react'

import base_config_raw from '../../../wirediagram/wiring-base-conf.json'
import style_ref from '../../../wirediagram/wiring-style.json'
import '../../../wirediagram/wdg-style.css'


/// old code section
const endpointIds = {} // stores jsPlumb enpoints with key to basic string endpoint.
// old code
const spacer = (point, total_points) => {
    return point/(total_points + 1)
}
// old code
const addDOMElement = ({ className, id, main_label, secondary_label, parent_element, child_length }) => {
    const element = document.createElement('div')

    element.className = className += ' border'
    if (id){element.id = id} // not to useful atm
    if (main_label) {
        const label_ele = document.createElement('p')
        label_ele.className = "main-label"
        label_ele.textContent = main_label
        if (child_length) {
            label_ele.style = `grid-column: 1/${child_length + 1};`
        }
        element.appendChild(label_ele)
    }
    if (secondary_label) {
        const label_ele = document.createElement('p')
        label_ele.className = "secondary-label"
        label_ele.textContent = secondary_label
        element.appendChild(label_ele)
    }
    if (parent_element) {
        parent_element.appendChild(element)
    } else {
        window.wrap.appendChild(element)
    }

    return element
}
// old code
const addEndpoints = ({ element, type, endpoints: { inputs, outputs } }, jp_instance) => {

    const addOneSide = (array, io_type) => {
        array.forEach((point, i, arr) => {
            const anchor = style_ref[type].positioning[io_type].slice()
            const spacer_index = anchor.indexOf("x")
            if (spacer_index !== -1) { anchor[spacer_index] = spacer(i+1, arr.length) }
            // let label_loc
            // if (spacer_index === 0) { // top or bottom labels
            //     if (anchor[1] === 1) { //bottom
            //         label_loc = [.5, -0.5]
            //     } else { //top
            //         label_loc = [.5, 1.5]
            //     }
            // } else { // left or right labels
            //     if (anchor[0] === 1) { //left
            //         label_loc = [-.5, .5]
            //     } else { //right
            //         label_loc = [1.5, .5] 
            //     }
            // }

            // try {
            //     if(style_ref[type].label_pos[io_type]){ label_loc = style_ref[type].label_pos[io_type] }  
            // } catch (e) {}

            endpointIds[point] = jp_instance.addEndpoint(element, {
                anchor, 
                maxConnections: -1,
                overlays: [
                    ["Label", { 
                        label: point.split("_").slice(-1)[0], 
                        location: [.5,.5]  
                    }]
                ]
            }, style_ref[io_type], {cssClass: "testeroon"})
        })
    }

    if (inputs) {addOneSide(inputs, 'inputs')}
    if (outputs) {addOneSide(outputs, 'outputs')}
}
// old code
const addDevice = (device, parent_element=null, jp_instance) => {
    // do everything to add a device node
    const { type, id, main_label, secondary_label, endpoints, children } = device

    let child_length = 0
    if (children) {
        child_length = children.length 
    }
    
    const element = addDOMElement({ className: style_ref[type].cssClass, id, main_label, secondary_label, parent_element, child_length })
    if (type === "dut") {
        element.style = `min-height: ${endpoints.outputs.length* 50}px;`
    }

    addEndpoints({ element, type, endpoints }, jp_instance)
    if (children) {
        children.forEach((child_device) => {
            addDevice(child_device, element, jp_instance)
        })
    }
}
// old code
const populate_children = (device, all_devices) => {
    let l = device.children_ids || []
    if (l.length) {
        device.children = device.children_ids.map((key) => all_devices[key])
    }
}
// old code
const makeDevices = (devices, jp_instance) => {
    Object.keys(devices).forEach((key) => {
        const device = devices[key]
        populate_children(device, devices)
    })
    Object.keys(devices).forEach((key) => {
        const device = devices[key]
        if (!device.parent_id) {
            addDevice(devices[key], null, jp_instance)
        }
    })
}
// old code
const makeConnections = (connections, jp_instance) => {
    connections.forEach((con) => {
      jp_instance.connect({
            source: endpointIds[con.source],
            target: endpointIds[con.target],
        }, style_ref[con.type] || {})
    })
}

// old python code converted to js
const generateDiagram = (base_config, aux_config, chamber, jp_instance) => {
  let chamber_key,
    atten_key,
    // trafficgen_key,
    switch_key,
    card_5_key,
    card_24_key,
    card_eth_key,
    dut_key

  Object.keys(base_config.devices).map(k => {
    /// This is a recreation of the og python code... in retrospec this logic will not work with multiple chambers
    switch(base_config.devices[k].type) {
      case 'chamber-dut':
        chamber_key = k
        break
      case 'atten':
        atten_key = k
        break
      case 'trafficGenWIDE': 
        // trafficgen_key = k
        break
      case 'switch':
        switch_key = k
        break
      case 'dut': 
        dut_key = k
        break
      case 'card': 
        switch (base_config.devices[k].main_label) {
          case '5':
            card_5_key = k
            break
          case '24': 
            card_24_key = k
            break
          case 'eth': 
            card_eth_key = k
            break
          default:
            break
        }
        break
      default:
        break
    }
    return ''
  })


    if(aux_config) {
      // chamber lettering
      aux_config.chamber_lettering.forEach((letter, i) => {
        base_config.devices[chamber_key].endpoints.inputs[i] =
        base_config.devices[chamber_key].endpoints.inputs[i].replace('{}', letter)
        if (letter !== 'na') {
          let connection_index
          base_config.connections.forEach((con, con_i) => {
            if (con.source === `atten1_out_${i+1}0`) {
              connection_index = con_i
            }
          })
          base_config.connections[connection_index].target = 
          base_config.connections[connection_index].target.replace('{}', letter)
        }
      })

      /// switch IP
      if (aux_config.switch_ip) {
        base_config.devices[switch_key].main_label =
        base_config.devices[switch_key].main_label.replace('{}', aux_config.switch_ip)
      }

      /// Switch port #
      if (aux_config.switch_port) {
        const og_name = base_config.devices[switch_key].endpoints.inputs[0]
        const _port = og_name.split('_')
        _port[_port.length-1] = aux_config.switch_port
        const port = _port.join('_')
        base_config.devices[switch_key].endpoints.inputs[0] = port
        // update connections        
        base_config.connections.forEach(con => {
          if(con.target === og_name) {
            con.target = port
          }
        })
      }

      if (aux_config.dut_device) {
        // not fully implemented in og, skipping for now
      }

      if (aux_config.dut_connections) {
        // skipping for now
      }

      /// eth card port #
      if (aux_config.card_ethernet_port) {
        const og_name = base_config.devices[card_eth_key].endpoints.inputs[0]
        const _port = og_name.split('_')
        _port[_port.length-1] = aux_config.card_ethernet_port
        const port = _port.join('_')
        base_config.devices[card_eth_key].endpoints.inputs[0] = port
        // update connections
        base_config.connections.forEach(con => {
          if(con.target === og_name) {
            con.target = port
          }
        })
      }
    }

    //// need chamber info!! 

    if (chamber) {
      base_config.devices[chamber_key].main_label = `Chamber ${chamber.name}` 
      if (chamber.dut) {
        base_config.devices[dut_key].main_label = `${chamber.dut.firmware.company} ${chamber.dut.firmware.model_name}`
      }
      if (chamber.attenuator) {
        base_config.devices[atten_key].main_label = `${chamber.attenuator.make} ${chamber.attenuator.ip}`
      }

      const update_card_display = (card, config_card, label) => {
        config_card.main_label = `${label} - ${card.model}`
        config_card.secondary_label = `${card.ip}:${card.port}`
      }
      chamber.card_config.ethernet && update_card_display(chamber.card_config.ethernet, base_config.devices[card_eth_key], 'Ethernet')
      chamber.card_config.wifi_24_GHz && update_card_display(chamber.card_config.wifi_24_GHz, base_config.devices[card_24_key], '2.4GHz')
      chamber.card_config.wifi_5_GHz && update_card_display(chamber.card_config.wifi_5_GHz, base_config.devices[card_5_key], '5GHz')

      const update_jfw_display = (port, arr_i, direction) => {
        const og_name = base_config.devices[atten_key].endpoints[direction][arr_i]
        const new_name = og_name.replace(`_${arr_i+1}0`, `_${port}`)
        
        base_config.devices[atten_key].endpoints[direction][arr_i] = new_name
        
        base_config.connections.forEach(con => {
          if (con.source === og_name) {
            con.source = new_name
          }
          if (con.target === og_name) {
            con.target = new_name
          }
        })
      }

      if (chamber.attenuator.ports_24_GHz) {
        const [start24, end24] = chamber.attenuator.ports_24_GHz.split('-')
        for (let port_num = start24*1, i=0; port_num <= end24*1; port_num++, i++) {
          update_jfw_display(port_num, i, 'outputs')
          update_jfw_display(port_num, i, 'inputs')
        }
      }

      if(chamber.attenuator.ports_5_GHz) {
        const [start5, end5] = chamber.attenuator.ports_5_GHz.split('-')
        for (let port_num = start5*1, i=4; port_num <= end5*1; port_num++, i++) {
          update_jfw_display(port_num, i, 'outputs')
          update_jfw_display(port_num, i, 'inputs')
        }
      }
    }
  
  makeDevices(base_config.devices, jp_instance)
  makeConnections(base_config.connections, jp_instance)
}

//// Actual React component here
const ChamberWiring = (props) => { 
  import('jsplumb')
  .then(() => {
    window.jsPlumb.reset()
  })
  .then(() => {
    window.jsPlumb.ready(() => {
      const jp_instance = window.jsPlumb.getInstance()
      window.jpi = jp_instance
      jp_instance.importDefaults({
        Connector: ["StateMachine"], 
        ConnectionsDetachable: false
      })
      const config_copy = JSON.parse(JSON.stringify(base_config_raw))
      window.wrap = document.getElementById('wrap')
      generateDiagram(config_copy, props.chamber.wiring_diagram_aux_config, props.chamber, jp_instance)
      jp_instance.repaintEverything()
    })
  })

  return (
    <div className='tab-content'>
      <div id='wrap' />
    </div>
  )
}


export default ChamberWiring
