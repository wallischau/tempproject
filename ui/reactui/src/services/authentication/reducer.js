import { actions } from './actions'

/// userAuthStatus = BOOL is a user logged in or not?
/// authRequested = BOOL is a loging request pending?
/// firstload = BOOL false on first load and the = true after initial_load function is called


const initialState = {
  user: {
    displayName: '', 
    group: 'None'
  },
  authRequested: false, 
  userAuthStatus: false, 
  firstload: true,
  loginError: ''
}

export default (state = initialState, action) => {
  switch (action.type) {
    case actions.INITIAL_LOAD_COMPLETE:
      return {
        ...state,
        firstload: false
      }
    case actions.REQUEST_LOGIN:
      return {
        ...state,
        authRequested: true,
        loginError: ''        
      }
    case actions.COMPLETE_LOGIN:
      return {
        ...state,
        user: action.user,
        authRequested: false, 
        userAuthStatus: true, 
        loginError: ''
      }
    case actions.LOGOUT: 
      return {
        ...state, 
        user: initialState.user, 
        userAuthStatus: false, 
        authRequested: false,
        loginError: ''               
      }
    case actions.FAIL_LOGIN: 
      return {
        ...state, 
        userAuthStatus: false,
        authRequested: false, 
        user: initialState.user,
        loginError: action.errors
      }
    case actions.COMPLETE_REGISTER:
      return {
        ...state,
        authRequested: false
      }
    case actions.REQUEST_REGISTER:
      return {
        ...state, 
        authRequested: true
      }
    case actions.FAIL_REGISTER:
      return {
        ...state, 
        loginError: action.errors
      }

    default:
      return state
  }
}
