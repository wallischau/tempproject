import { setError, normalizeResponse } from '../error-handling/actions'

export const actions = {
  CHAMBER_FETCH: 'chamber/CHAMBER_FETCH',
  CHAMBER_UPDATE: 'chamber/CHAMBER_UPDATE',
  DUTS_FETCH: 'chambers/DUTS_FETCH',
  RESERVE_CHAMBER: 'chamber/RESERVE_CHAMBER',
  TEST_SETUP_ERROR: 'chamber/TEST_SETUP_ERROR',
  TEST_SETUP_ERROR_RESET: 'chamber/TEST_SETUP_ERROR_RESET',
  TEST_SETUP_SUCCESS: 'chamber/TEST_SETUP_SUCCESS',
  TEST_SETUP_SUCCESS_RESET: 'chamber/TEST_SETUP_SUCCESS_RESET'
};

export const setTestSetupError = (chamberName, message, timeout=10000) => {
  return dispatch => {
    setTimeout(() => {
      dispatch({
        type: actions.TEST_SETUP_ERROR_RESET,
        chamberName: chamberName
      })
    }, timeout)

    console.log('here', message);
    if (message.constructor === Object) {
      console.log('here2', message);
      message = JSON.stringify(message);
    }

    dispatch({
      type: actions.TEST_SETUP_ERROR,
      chamberName: chamberName,
      testSetupError: message
    })
  }
}

export const setTestSetupSuccess = (chamberName, message, timeout=5000) => {
  return dispatch => {
    setTimeout(() => {
      dispatch({
        type: actions.TEST_SETUP_SUCCESS_RESET,
        chamberName: chamberName
      })
    }, timeout)

    dispatch({
      type: actions.TEST_SETUP_SUCCESS,
      chamberName: chamberName,
      testSetupSuccess: message
    })
  }
}

export const fetchChambers = () => {
  return dispatch => {
    // fetch api/chambers
    return fetch('/v1/test-chamber/')
    .then(res => normalizeResponse(res, '/v1/test-chamber'))
    .then(res => {
      let data = res.data ? res.data : [];
      
      if (!res.success)  {
        dispatch(setError(res.errors));
      }

      dispatch({
        type: actions.CHAMBER_FETCH,
        chambers: data
      });
    })
  }
}

export const updateChamber = (chamberUpdate) => {
  return dispatch => {
    dispatch({
      type: actions.CHAMBER_UPDATE,
      chamber: chamberUpdate
    })
  }
}

export const fetchDuts = () => {
  return dispatch => {
    // fetch api/duts
    fetch('/v1/dut')
    .then(res => normalizeResponse(res, '/v1/dut'))
    .then(res => {
      let data = res.data ? res.data : [];

      if (!res.success) {
        dispatch(setError(res.errors));
      }

      dispatch({
        type: actions.DUTS_FETCH,
        duts: data
      });
    })
  }
}

export const sendAttenuation = (chamberName, attenuationIP, attenuationValue, rangeBegin, rangeEnd) => {
  return dispatch => {
    return fetch('/v1/jfw', {
      method: 'PUT',
      headers: {
        "Content-Type": "application/json"
      },
      body: JSON.stringify({
        ip: attenuationIP,
        portRangeStart: rangeBegin,
        portRangeEnd: rangeEnd,
        attenuation: attenuationValue
      }),
      credentials: 'include'
    })
    .then(res => normalizeResponse(res, '/v1/jfw'))
    .then(res => {
      if (!res.success) {
        return dispatch(setTestSetupError(chamberName, res.errors));
      }

      return dispatch({
        type: actions.ATTEN_CHANGE
      })
    })
  }
}

export const getAttenuation = (chamberName, attenuationIP, rangeBegin, rangeEnd, attenGHz) => {
  let url = '/v1/jfw?ip=' + attenuationIP + "&begin=" + rangeBegin + "&end=" + rangeEnd
  return dispatch => {
    return fetch(url, {
      method: 'GET'
    }).then(res => normalizeResponse(res, '/v1/jfw')
    .then(res => {
      let data = res.data;
      if (!res.success) {
        dispatch(setTestSetupError(chamberName, res.errors));
        return '-9999';
      } else {
        let attainedValue = parseInt(
          data.split("|")[2].replace("GET", "").split(":")[1], 10);
        return attainedValue;
      }
    }))
  }
}

export const saveAttenuation = (chamberId, name, atten) => {
  let url = '/v1/test-chamber/'+chamberId;
  return dispatch => {
    return fetch(url, {
      method: 'PUT',
      headers: {
        "Content-Type": "application/json"
      },
      credentials: 'include',
      body: JSON.stringify({attenuator: atten})
    }).then(res => normalizeResponse(res, '/v1/test-chamber'))
    .then((res) => {
      if (!res.success) {
        dispatch(setTestSetupError(name, res.errors));
      } else {
        dispatch(setTestSetupSuccess(name, ['Chamber Successfully Updated']))
      }
    })

  }
}

export const saveIxiaConfigChange = (chamberId, name, card) => {
  let url = '/v1/test-chamber/'+chamberId;
  return dispatch => {
    return fetch(url, {
      method: 'PUT',
      headers: {
        "Content-Type": "application/json"
      },
      credentials: 'include',
      body: JSON.stringify({card_config: card})
    }).then(res => normalizeResponse(res, '/v1/test-chamber'))
    .then((res) => {
      if (!res.success) {
        dispatch(setTestSetupError(name, res.errors));
      } else {
        dispatch(setTestSetupSuccess(name, ['Chamber Successfully Updated']))
      }
    })
  }
}

export const saveAttenuatorConfigChange = (chamberId, name, card) => {
  let url = '/v1/test-chamber/'+chamberId;
  return dispatch => {
    return fetch(url, {
      method: 'PUT',
      headers: {
        "Content-Type": "application/json"
      },
      credentials: 'include',
      body: JSON.stringify({attenuator: card})
    }).then(res => normalizeResponse(res, '/v1/test-chamber'))
    .then((res) => {
      if (!res.success) {
        dispatch(setTestSetupError(name, res.errors));
      } else {
        dispatch(setTestSetupSuccess(name, ['Chamber Successfully Updated']))
      }
    })
  }
}

export const saveDut = (chamberId, new_dut_id) => {
  // data = {dut: _id}
  let url = '/v1/test-chamber/'+chamberId;
  return dispatch => {
    return fetch(url, {
      method: 'PUT',
      headers: {
        "Content-Type": "application/json"
      },
      credentials: 'include',
      body: JSON.stringify({dut: new_dut_id})
    })
    .then((res) => {
      // check if res is successful --- needs refactor
      return res.json()
    })
    .then(({ data }) => {
      dispatch(fetchChambers())
      return data.dut === new_dut_id
    })
  }
}

export const reserveChamber = (data) => {
  return dispatch => {
    fetch('/v1/test-chamber/reserve', {
      method: 'POST',
      headers: {
        "Content-Type": "application/json"
      },
      credentials: 'include',
      body: JSON.stringify(data)
    })
    .then((res) => {
      return res.json()
    })
    .then(({ data }) => {
      dispatch(fetchChambers())
    })
  }
}

export const unReserveChamber = (data) => {
  return dispatch => {
    fetch('/v1/test-chamber/release', {
      method: 'POST',
      headers: {
        "Content-Type": "application/json"
      },
      credentials: 'include',
      body: JSON.stringify(data)
    })
    .then((res) => {
      return res.json()
    })
    .then(({ data }) => {
      dispatch(fetchChambers())
    })
  }
}

const deletePendingTests = (chamberId) => {
  const query = {
    'status': 'pending',
    'topology.chamber._id': chamberId
  }

  const init = {
    method: 'DELETE',
    headers: {'Content-Type': 'application/json'},
    credentials: 'include',
    body: JSON.stringify(query)
  }
  return fetch('/v1/test-queue/', init)
  .then(res => normalizeResponse(res, '/v1/test-queue'));
}

const cancelCurrentTest = (chamberId) => {
  const update = {
    'status': 'cancelling',
  }

  const init = {
    method: 'PUT',
    headers: {'Content-Type': 'application/json'},
    credentials: 'include',
    body: JSON.stringify(update)
  }
  let baseUrl = '/v1/test-queue/'
  let url = baseUrl + '?status=running&topology.chamber._id=' + chamberId;
  return fetch(url, init)
  .then(res => normalizeResponse(res, baseUrl));
}

const cancelChamber = (chamberId) => {
  const update = {
    'status': 'cancelling',
  }

  const init = {
    method: 'PUT',
    headers: {'Content-Type': 'application/json'},
    credentials: 'include',
    body: JSON.stringify(update)
  }
  let baseUrl = '/v1/test-chamber/'
  let url = baseUrl + chamberId
  return fetch(url, init)
  .then(res => normalizeResponse(res, baseUrl));
}

export const cancelTests = (chamber) => {
  let chamberName = chamber.name;
  let chamberId = chamber._id;
  return dispatch => {
    deletePendingTests(chamberId)
    .then(res => {
      if (!res.success) {
        return dispatch(setTestSetupError(chamberName, res.errors));
      }

      cancelCurrentTest(chamberId)
      .then(res => {
        if (!res.success) {
          return dispatch(setTestSetupError(chamberName, res.errors));
        }

        cancelChamber(chamberId)
        .then(res => {
          if (!res.success) {
            return dispatch(setTestSetupError(chamberName, res.errors));
          }
        })
      })

    })
  }
}