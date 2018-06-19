import { setError, normalizeResponse } from '../error-handling/actions'


export const actions = { 
  ADD_TEST_RUN_DATA: 'firmware/ADD_TEST_RUN_DATA', 
  REQUESTING_TEST_RUNS: 'firmware/REQUESTING_TEST_RUNS',
}


export const getTestRuns = (firmware_id) => {
  return dispatch => {
    dispatch({
      type: actions.REQUESTING_TEST_RUNS
    })

    const init = {
      method: 'GET', 
      headers: {'Content-Type': 'application/json'},
      credentials: 'include'
    }

    return fetch(`/v1/test-runs?firmware=${firmware_id}`, init)
    .then(res => normalizeResponse(res, '/v1/test-runs'))
    .then(res => {
      let data = res.data ? res.data : {};

      if (!res.success) {
        dispatch(setError(res.errors));
      } 
      // we're still dispatching the 'successfull' action even if it fails :P

      dispatch({
        type: actions.ADD_TEST_RUN_DATA,
        data: { test_runs: data }
      })
    })
  }
}



