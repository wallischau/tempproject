import { actions } from './actions'

const initialState = {
  suites: [],
  ssids: [],
  otherList: []
}

export default (state = initialState, action) => {
  switch (action.type) {
    case actions.TEST_SUITE_FETCH:
      return {
        ...state,
        suites: action.suites
      }
    case actions.SSID_FETCH:
      return {
        ...state,
        ssids: actions.ssids
      }
    default:
      return state
  }
}
