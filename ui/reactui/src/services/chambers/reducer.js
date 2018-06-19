import { actions } from './actions'

const initialState = {
  chambers: [],
  duts: [],
  testSetupMessages: {},
}

export default (state = initialState, action) => {
  let newMessages = {...state.testSetupMessages};
  let newChambers = [...state.chambers];

  switch (action.type) {
    case actions.CHAMBER_FETCH:
      return {
        ...state,
        chambers: action.chambers
      }

    case actions.CHAMBER_UPDATE:
      for (let i in newChambers) {
        if (newChambers[i]._id === action.chamber._id) {
          newChambers[i] = action.chamber;
        }
      }
      return {
        ...state,
        chambers: newChambers
      }

    case actions.DUTS_FETCH:
      return {
        ...state,
        duts: action.duts
      }

    case actions.TEST_SETUP_ERROR:
      if (action.testSetupError.constructor === Array) {
        newMessages[action.chamberName] = {
          error: action.testSetupError.join(',')
        }
      } else {
        newMessages[action.chamberName] = {
          error: action.testSetupError
        }
      }

      return {
        ...state,
        testSetupMessages: newMessages
      }
    case actions.TEST_SETUP_ERROR_RESET:
      newMessages[action.chamberName] = {
        error: null
      }
      return {
        ...state,
        testSetupMessages: newMessages
      }

    case actions.TEST_SETUP_SUCCESS:
    if (action.testSetupSuccess.constructor === Array) {
        newMessages[action.chamberName] = {
          success: action.testSetupSuccess.join(',')
        }
      } else {
        newMessages[action.chamberName] = {
          success: action.testSetupSuccess
        }
      }

      return {
        ...state,
        testSetupMessages: newMessages
      }
    case actions.TEST_SETUP_SUCCESS_RESET:
      newMessages[action.chamberName] = {
        success: null
      }
      return {
        ...state,
        testSetupMessages: newMessages
      }

    default:
      return state
  }
}
