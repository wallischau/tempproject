import { actions } from './actions'

const initialState = {
	open: false,
	snackbarMessage: '',
	snackbarMessageClass: '',
	snackbarChamberName: ''
}

export default (state = initialState, action) => {

	let newMessages = {...state.testSetupMessages};
	console.log('newMessage:', newMessages);
	console.log('action: ', action)
	switch (action.type) {
		case actions.SHOW_ERR_MESSAGE:
			return {
				...state,
				snackbarMessage: action.snackbarMessage,
				open: true,
				snackbarChamberName: action.chamberName
			}
		case actions.SHOW_SUCCESS_MESSAGE:
			return {
				...state,
				snackbarMessage: 'abc',
			}
		case actions.SHOW_INFO_MESSAGE:
			return {
				...state,
				snackbarMessage: 'abc',
			}
		case actions.SHOW_WARNING_MESSAGE:
			return {
				...state,
				snackbarMessage: 'abc',
			}
		case actions.RESET_MESSAGE:
		    newMessages[action.chamberName] = {
        		error: null
      		}

			return {
				...state,
				snackbarMessage: null,
				open: false,
		        testSetupMessages: newMessages

			}
		default:
			return state
	}
}