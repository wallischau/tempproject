import { normalizeResponse } from '../error-handling/actions'
import { setTestSetupSuccess } from '../chambers/actions'
import { setTestSetupError} from '../snackbars/actions'

export const actions = {
  TESTQUEUE_ADD: 'testqueue/TESTQUEUE_ADD',
}

export const getNextRunId = (chamberName) => {
  return dispatch => {
    return fetch('/v1/test-runs/next_id')
    .then(res => normalizeResponse(res, '/v1/test-runs/next_id'))
    .then(res => {
      let data = res.data ? res.data : 0;

      if (!res.success) {
        dispatch(setTestSetupError(chamberName, res.errors));
      }

      return data;
    })
  }
}

export const populateTestItems = (chamber, testsToQueue) => {
  return dispatch => {
    fetch('/v1/test-runs', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      credentials: 'include',
      body: JSON.stringify({chamber: chamber,tests: testsToQueue})
    })
    .then(res => normalizeResponse(res, '/v1/test-runs'))
    .then(res => {
      if(!res.success) {
        dispatch(setTestSetupError(chamber.name, res.errors));
      } else {
        dispatch(
          // need to track the test run _id in order to use it to cancel later. 
          //// tie test_run_id to chamber?? so then we get a  chamber.test_run_id to lookup later

          //// or -- do have the chamber in the test-queue docs.... look up with that in place of test_run_id? 
          setTestSetupSuccess(chamber.name, ['Tests successfully queued'])
        );
      }
    })
  }
}

// export const addTestsToQueue = (chamberName, testsToQueue) => {
//   return dispatch => {
//     // fetch api/chambers
//     fetch('/v1/test-queue', {
//       method: 'POST',
//       headers: {
//         'Content-Type': 'application/json'
//       },
//       credentials: 'include',
//       body: JSON.stringify(testsToQueue)
//     })
//     .then(res => normalizeResponse(res, '/v1/test-queue'))
//     .then(res => {
//       if (!res.success) {
//         dispatch(setTestSetupError(chamberName, res.errors));
//       } else {
//         dispatch(setTestSetupSuccess(chamberName, ['Tests successfully queued']))
//       }
      
//       dispatch({
//         type: actions.TESTQUEUE_ADD,
//       })
//     })

//   }
// }


