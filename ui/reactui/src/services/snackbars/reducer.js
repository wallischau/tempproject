import { actions } from './actions'

const initialState = {
	open: false,
	snackbarMessages: [],
	snackbarMessageClass: '',
	snackbarChamberName: ''
}

export default (state = initialState, action) => {

	let newMessages = {...state.testSetupMessages};
	let newSnackbarMessages = state.snackbarMessages;
	console.log('newSnackbarMessages:', newSnackbarMessages);
	console.log('action: ', action)
	switch (action.type) {
		case actions.SHOW_ERR_MESSAGE:
			newSnackbarMessages.push('chamber ' + action.chamberName + " " + action.snackbarMessage);
			return {
				...state,
				snackbarMessages: newSnackbarMessages,
				open: true,
				snackbarChamberName: action.chamberName
			}
		case actions.SHOW_SUCCESS_MESSAGE:
			return {
				...state,
				snackbarMessages: 'abc',
			}
		case actions.SHOW_INFO_MESSAGE:
			return {
				...state,
				snackbarMessages: 'abc',
			}
		case actions.SHOW_WARNING_MESSAGE:
			return {
				...state,
				snackbarMessages: 'abc',
			}
		case actions.RESET_MESSAGE:
			// newSnackbarMessage.shift();
			newSnackbarMessages = [];
		    newMessages[action.chamberName] = {
        		error: null,
				snackbarChamberName: '' 
      		}

			return {
				...state,
				snackbarMessages: newSnackbarMessages,
				open: false,
		        testSetupMessages: newMessages

			}
		default:
			return state
	}
}