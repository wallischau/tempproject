import React from 'react';
import { bindActionCreators } from 'redux'
import { connect } from 'react-redux'
import PropTypes from 'prop-types';
import {withStyles} from '@material-ui/core/styles';
// import Button from '@material-ui/core/Button';
import Snackbar from '@material-ui/core/Snackbar';
import IconButton from '@material-ui/core/IconButton';
import CloseIcon from '@material-ui/icons/Close';
import { resetErrMessage } from '../../services/snackbars/actions'

const styles = theme => ({
  close: {
    width: theme.spacing.unit * 4,
    height: theme.spacing.unit * 4,
  },
});


class SnackbarMessage extends React.Component {

	handleClose = (event, reason) => {
		if (reason === 'clickaway') {
			return;
		}
		console.log('props before resetErr: ', this.props);
		this.props.resetErrMessage(this.props.chamberName);
	};

	//add new line for each msg entry in the array
	formatMessages = () => {
		this.props.snackbarMessages.map(v => v + '\n');
	};

	render() {
		console.log('snack');
		console.log('snackbar props: ', this.props);
		const { classes, open } = this.props;
		return (
			<div>
				<Snackbar
					anchorOrigin = {{
						vertical: 'top',
						horizontal: 'center',
					}}
					open={open}
					onClose={this.handleClose}
					ContentProps={{
						'aria-describedby': 'message-id',
					}}
					message={<span className="snackbar-msg" id='message-id'>{this.props.snackbarMessages}</span>}
					action={[
						<IconButton key="Close"
							aria-label="Close"
							color="inherit"
							className={classes.close}
							onClick={this.handleClose} >
							<CloseIcon />
						</IconButton>
					]}
				/>
			</div>
		);
	}//render
}

SnackbarMessage.propTypes = {
	classes: PropTypes.object.isRequired,
};

const mapStateToProps = (state ) => ({
	open: state.snackbars.open,
	chamberName: state.snackbars.snackbarChamberName,
	snackbarMessages: state.snackbars.snackbarMessages
})

const mapDispatchToProps = dispatch => bindActionCreators({
	resetErrMessage
}, dispatch)

export default withStyles(styles)(connect(
	mapStateToProps,
	mapDispatchToProps
)(SnackbarMessage))
