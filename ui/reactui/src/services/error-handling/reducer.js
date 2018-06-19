import { actions } from './actions'


export default (state = null, action) => {
  switch (action.type) {
    case actions.API_ERROR:
      return action.errorMessage || "Error with API server comunication"
    case actions.API_ERROR_RESET:
      return null
    default:
      return state
  }
}
