export const actions = {
	SHOW_ERR_MESSAGE: 'snackbars/SHOW_ERR_MESSAGE',
	SHOW_SUCCESS_MESSAGE: 'snackbars/SHOW_SUCCESS_MESSAGE',
	SHOW_INFO_MESSAGE: 'snackbars/SHOW_INFO_MESSAGE',
	SHOW_WARNING_MESSAGE: 'snackbars/SHOW_WARNING_MESSAGE',
	RESET_MESSAGE: 'snackbars/RESET_MESSAGE',
};

export const setTestSetupError = (chamberName, message) => {
	return dispatch => {
		if (message.constructor === Object) {
			message = JSON.stringify(message);
		  }
			dispatch({ type: actions.SHOW_ERR_MESSAGE,
			chamberName: chamberName,
			snackbarMessage: message
		})
	}
}

export const resetErrMessage = (chamberName) => {
	return dispatch => {
		dispatch({ type: actions.RESET_MESSAGE,
			chamberName: chamberName
		})
	}
}

/*
export const setTestSetupError = (chamberName, message, timeout=5000) => {
	return dispatch => {
	  // setTimeout(() => {
	  //   dispatch({
	  //     type: actions.TEST_SETUP_ERROR_RESET,
	  //     chamberName: chamberName
	  //   })
	  // }, timeout)
  
	  if (message.constructor === Object) {
		message = JSON.stringify(message);
	  }
  
	  dispatch({
		type: actions.SHOW_ERR_MESSAGE,
		chamberName: chamberName,
		message: message
	  })
	}
  }
*/