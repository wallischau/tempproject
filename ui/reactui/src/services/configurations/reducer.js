import { actions } from './actions'

const initialState = {
  configurations: []
}

export default (state = initialState, action) => {
  switch (action.type) {
    case actions.CONFIGURATION_FETCH:
      return {
        ...state,
        configurations: action.configurations
      }
    default:
      return state
  }
}
