import { normalizeResponse } from '../error-handling/actions'
import { setTestSetupError } from '../chambers/actions'

export const actions = {
  TEST_SUITE_FETCH: 'playlist/TEST_SUITE_FETCH',
  SSID_FETCH: 'playlist/SSID_FETCH'
}

export const scanForSSIDs = (chamberName, data) => {
  const html = '?ip=' + data.ip +
               '&slot=' + data.slot +
               '&port=' + data.port +
               '&frequency=' + data.frequency +
               '&channel=' + data.channel +
               '&ixversion=7.3.3';

  return dispatch => {
    return fetch('/v1/scan-ssid' + html, {
      method: 'GET',
      headers: {
        "Content-Type": "application/json"
      },
      credentials: 'include'
    })
    .then(res => normalizeResponse(res, '/v1/scan-ssid' + html))
    .then(res => {
      const ssids = res.data ? res.data : [];

      if (!res.success) {
        dispatch(setTestSetupError(chamberName, res.errors));
        return [];
      }

      if (ssids.length === 0) {
        dispatch(setTestSetupError(chamberName,
                                   'No ' + data.frequency + ' SSIDs found'));
        return [];
      }

      dispatch({
        type: actions.SSID_FETCH,
        ssids: ssids
      })

      return ssids;
    })
  }
}

export const fetchTestSuites = (chamber) => {
  return dispatch => {
    // fetch api/v1/test-suite
    let url = '/v1/test-suite';
    if (chamber.dut) {
      url = url + '?dut=' + chamber.dut._id;
    }
    return fetch(url)
    .then(res => normalizeResponse(res, url))
    .then(res => {
      const data = res.data ? res.data : [];

      if (!res.success) {
        dispatch(setTestSetupError(chamber.name, res.errors));
      }

      dispatch({
        type: actions.TEST_SUITE_FETCH,
        suites: data
      })

      return data
    })
  }
}
