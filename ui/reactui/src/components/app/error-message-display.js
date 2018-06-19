import React from 'react';

export const ErrorMessageDisplay = ({ errorMessage, errorClass }) => {
  return (
    <div className={errorClass}>
      Error encountered: {errorMessage}
    </div>
  )
}

export const SuccessMessageDisplay = ({ successMessage, successClass }) => {
  return (
    <div className={successClass}>
      Operation successful: {successMessage}
    </div>
  )
}
