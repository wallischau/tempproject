import { setError, normalizeResponse } from '../error-handling/actions'

export const actions = { /// rename to actionTypes ?
  ADD_FIRMWARE_DATA: 'firmware/ADD_FIRMWARE_DATA',   
  REQUESTING_FIRMWARE: 'firmware/REQUESTING_FIRMWARE',
}



export const getFirmware = () => {
  return dispatch => {
    dispatch({ type: actions.REQUESTING_FIRMWARE })
    
    fetch('/v1/firmware')
    .then(res => normalizeResponse(res, '/v1/firmware'))
    .then(res => {
      const data = res.data ? res.data : [];

      if (!res.success) {
        dispatch(setError(res.errors));
      }

      dispatch({
        type: actions.ADD_FIRMWARE_DATA,
        data: { firmwares: data }
      })
    })
  }
}





