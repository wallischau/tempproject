import { actions } from './actions'

const initialState = {
  firmwares: [],
  firmwares_request_pending: false,
}

export default (state = initialState, action) => {
  switch (action.type) {
    case actions.ADD_FIRMWARE_DATA: 
      return Object.assign({}, state, action.data, { firmwares_request_pending: false })

    case actions.REQUESTING_FIRMWARE: 
      return Object.assign({}, state, { firmwares_request_pending: true }) 

    default:
      return state
  }
}
