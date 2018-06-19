import { actions } from './actions'

const initialState = {
  queue: []
}

export default (state = initialState, action) => {
  switch (action.type) {
    case actions.TESTQUEUE_FETCH:
      return {
        ...state,
        queue: action.queue
      }
    default:
      return state
  }
}
