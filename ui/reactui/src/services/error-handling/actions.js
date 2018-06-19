export const actions = { /// rename to actionTypes ?
  API_ERROR: 'error/API_ERROR',
  API_ERROR_RESET: 'error/API_ERROR_RESET',  
}

export const setError = (message, timeout=5000) => {
  return dispatch => {
    setTimeout(() => {
      // clear error after (default of) 5 seconds
      dispatch({
        type: actions.API_ERROR_RESET
      })
    }, timeout)

    if (message.constructor === Object) {
      message = JSON.stringify(message);
    }

    dispatch({
      type: actions.API_ERROR,
      errorMessage: message
    })
  }
}

export const normalizeResponse = (res, location) => {
  try {
    res = res.json();
  } catch (err) {
    res = {
      'success': false,
      'errors': [res.statusText + ' from ' + location]
    }
  }
  return res;
}

