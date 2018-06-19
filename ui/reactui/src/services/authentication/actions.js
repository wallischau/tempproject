import { setError, normalizeResponse } from '../error-handling/actions'


// Login/Authentication actions

export const actions = {
  REQUEST_LOGIN: 'auth/REQUEST_LOGIN', 
  COMPLETE_LOGIN: 'auth/COMPELETE_LOGIN', 
  FAIL_LOGIN: 'auth/FAIL_LOGIN', 

  LOGOUT: 'auth/LOGOUT', 

  REQUEST_REGISTER: 'auth/REQUEST_REGISTER',
  FAIL_REGISTER: 'auth/FAIL_REGISTER',  
  COMPLETE_REGISTER: 'auth/COMPLETE_REGISTER', 

  REQUEST_CHANGE_PASSWORD: 'auth/REQUEST_CHANGE_PASSWORD',
  COMPLETE_CHANGE_PASSWORD: 'auth/COMPLETE_CHANGE_PASSWORD',

  INITIAL_LOAD_COMPLETE: 'INITIAL_LOAD_COMPLETE'
}


//////// LOGIN

export const submitLogin = (user) => {
  return dispatch => {
    dispatch({type: actions.REQUEST_LOGIN})

    const init = {
      method: 'POST', 
      headers: {'Content-Type': 'application/json'},
      credentials: 'include',
      body: JSON.stringify(user)
    }

    fetch('/v1/user/login', init)
    .then(res => normalizeResponse(res, '/v1/user/login'))
    .then(res => {
      if (res.success) {
        dispatch({
          type: actions.COMPLETE_LOGIN, 
          user: res.data
        })
      } else {
        let errors = res.errors
        if (typeof errors === 'string') {
          errors = {server: res.errors}
        }
        dispatch({
          type: actions.FAIL_LOGIN,
          errors: errors
        })
      }
    })
    .catch(err => {
      dispatch(setError(err))
    })
  }
}


export const logout = () => {
  /// fetch /logout, clear cookie? 
  return dispatch => {

    const init = {
      method: 'GET', 
      credentials: 'include',
    }

    fetch('/v1/user/logout', init)
    .then(res => normalizeResponse(res, '/v1/user/logout'))
    .then(res => {
      if (res.success) {
        dispatch({
          type: actions.LOGOUT
        })
      } else {
        dispatch(setError(res.errors));
      }
    })
  }
}



///// REGISTRATION

export const submitRegistration = (user) => {
  return dispatch => {
    dispatch({
      type: actions.REQUEST_REGISTER
    })

    const init = {
      method: 'POST', 
      headers: {'Content-Type': 'application/json'},
      credentials: 'include',
      body: JSON.stringify(user)
    }

    fetch('/v1/user/register', init) 
    .then(res => normalizeResponse(res, '/v1/user/register'))
    .then(res => {
      if (res.success) {
        dispatch({
          type: actions.COMPLETE_REGISTER
        })
      } else {
        let errors = res.errors
        if (typeof errors === 'string') {
          errors = {server: res.errors}
        }
        dispatch({ 
          type: actions.FAIL_REGISTER,
          errors
        })
      }
    })
    .catch(err => {
      dispatch(setError(err))
    })
  }
}

export const changePassword = (user, newPassword) => {
  return dispatch => {
    const init = {
      method: 'POST', 
      headers: {'Content-Type': 'application/json'},
      credentials: 'include',      
      body: JSON.stringify({ user, newPassword })
    }
    return fetch('/v1/user/changePassword', init)
    .then(res => res.json())
    .then(res => {
      return res.success
    })
  }
}

export const resetPassword = (email) => {
  return dispatch => {
    const init = {
      method: 'POST', 
      headers: {'Content-Type': 'application/json'},
      body: JSON.stringify({ email })
    }

    return fetch('/v1/user/resetPassword', init)
  }
} 

///////////////////////////// Login check

export const initialPageLoad = () => {
  return dispatch => {
    /// try to login with cookie
    const init = {
      credentials: 'include',
    }
    
    // get current user? 
    fetch('/v1/user/checkforlogin', init)
    .then(res => normalizeResponse(res, '/v1/user/checkforlogin'))
    .then(res => {
      if (res.success && res.data.userid) {
        dispatch({
          type: actions.COMPLETE_LOGIN, 
          user: res.data
        })
      } else if (!res.success) {
        dispatch(setError(res.errors));
      }

      dispatch({
        type: actions.INITIAL_LOAD_COMPLETE
      })
    })
    .catch(err => {
      dispatch(setError('Invalid response from /v1/user/checkforlogin'))
    })
  }
}
