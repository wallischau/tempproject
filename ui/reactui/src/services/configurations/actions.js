import { setError, normalizeResponse } from '../error-handling/actions'

export const actions = {
  CONFIGURATION_FETCH: 'configuration/CONFIGURATION_FETCH'
}

// const fakeUsers = {
//   a: {displayName: 'Mark', userId: '123'},
//   b: {displayName: 'Longernamerino', userId: '789'}, 
//   none: {displayName:'', userId:'0'}
// }

// const fakeChambers = [
//   {id: 1, simpleName:'1.1', reserved: true, status: 'test running', user: fakeUsers.a}, 
//   {id: 2, simpleName:'1.2', reserved: true,  status: 'test pending', user: fakeUsers.b},
//   {id: 3, simpleName:'2.1', reserved: false,  status: 'open', user: fakeUsers.none}
// ]

export const fetchConfiguration = (callback) => {
  return dispatch => {
    return fetch('/v1/ethernet-port')
    .then(res => normalizeResponse(res, '/v1/ethernet-port'))
    .then(res => {
      let data = res.data ? res.data : []

      if (!res.success) {
        dispatch(setError(res.errors));
      }

      dispatch({
        type: actions.CONFIGURATION_FETCH,
        configurations: data
      })
    })

  }
}

export const updateConfiguration = (id, data) => {
    let url = '/v1/ethernet-port/'+id;
    let item = {
      type: data.type,
      chassis_ip: data.chassis_ip,
      card_serial: data.card_serial,
      slot: data.slot,
      port: data.port,
      reserved_by_chamber: data.reserved_by_chamber
    }
  return dispatch => {
    fetch(url, {
      method: 'PUT',
      headers: {
        "Content-Type": "application/json"
      },
      credentials: 'include',
      body: JSON.stringify(item)
    })
    .then(res => normalizeResponse(res, url))
    .then(res => {
      if (!res.success) {
        dispatch(setError(res.errors));
      }
    })
  }
}

export const addConfiguration = (item) => {
  return dispatch => {
    // fetch api/chambers
    return fetch('/v1/ethernet-port', {
      method: 'POST',
      headers: {
        "Content-Type": "application/json"
      },
      credentials: 'include',
      body: JSON.stringify(item)
    })
    .then(res => normalizeResponse(res, '/v1/ethernet-port'))
    .then(res => {
      if (!res.success) {
        dispatch(setError(res.errors));
      }
    })
  }
}

export const deleteConfiguration = (id) => {
  return dispatch => {
    fetch('/v1/ethernet-port/' + id, {
      method: 'DELETE',
      headers: {
        "Content-Type": "application/json"
      },
      credentials: 'include',
    })
    .then(res => normalizeResponse(res, '/v1/ethernet-port/' + id))
    .then(res => {
      if (!res.success) {
        dispatch(setError(res.errors));
      }

      dispatch(fetchConfiguration());
    })
  }
}


