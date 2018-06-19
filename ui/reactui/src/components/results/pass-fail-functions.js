//// This file exports functions used to evaluate the pass/fail of a single test result for a given test_type
/// returns a boolean


export const max_client_pf = result => {
  return result.clients >= 50
}

export const tcp_pf = result => {
  /// returns an object with bool results for each mss
  return { 
    pf_536: (result.mss_results['536'] && result.mss_results['536'].percentage) >= 65, 
    pf_1460: (result.mss_results['1460'] && result.mss_results['1460'].percentage) >= 75
  }
}

export const udp_pf = res => {
  /// throw error if no res
  /// throw error if res is missing data
  if (res.frame_size_results['64']) {
    if (!(res.frame_size_results['64'].percentage >= 10)) {
      return false
    }
  }

  if (res.frame_size_results['128']) {
    if (!(res.frame_size_results['128'].percentage >= 34)) {
      return false
    }
  }

  if (res.frame_size_results['256']) {
    if (!(res.frame_size_results['256'].percentage >= 54)) {
      return false
    }
  }

  if (res.frame_size_results['512']) {
    if (!(res.frame_size_results['512'].percentage >= 75)) {
      return false
    }
  }

  if (res.frame_size_results['1024']) {
    if (!(res.frame_size_results['1024'].percentage >= 80)) {
      return false
    }
  }

  if (res.frame_size_results['1518']) {
    if (!(res.frame_size_results['1518'].percentage >= 85)) {
      return false
    }
  }

  if (res.direction === 'BI') {
    const fsr_keys = Object.keys(res.frame_size_results)
    for (let index = 0; index < fsr_keys.length; index++) {
      const fsr = res.frame_size_results[fsr_keys[index]];
      if(!(fsr.diff <= 10)) {
        return false
      }
    }
  }

  return true
}