import React from 'react';
import PropTypes from 'prop-types';
import {withStyles} from '@material-ui/core/styles';
import Button from '@material-ui/core/Button';
import Snackbar from '@material-ui/core/Snackbar';
import IconButton from '@material-ui/core/IconButton';
import CloseIcon from '@material-ui/icons/Close';

const styles = theme => ({
  close: {
    width: theme.spacing.unit * 4,
    height: theme.spacing.unit * 4,
  },
});


class SimpleSnackbar extends React.Component {
	state = {
		open: true,
	};

	//this.setState({open:true})

	handleClose = (event, reason) => {
		if (reason === 'clickaway') {
			return;
		}
		this.setState({open:false});
	};

	render() {
		console.log('snack');
		const { classes } = this.props;
		return (
			<div className = {this.props.errorClass}>
				<Snackbar
					anchorOrigin = {{
						vertical: 'top',
						horizontal: 'center',
					}}
					open={this.state.open}
					{/*autoHideDuration={6000} */}
					onClose={this.handleclose}
					ContentProps={{
						'aria-describedby': 'message-id',
					}}
					message={<span id='message-id'>{this.props.errorMessage}</span>}
					action={[
						<Button key="detail" color="secondary" size="small" onClick={this.handleClose}>Detail
						</Button>,
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

SimpleSnackbar.propTypes = {
	classes: PropTypes.object.isRequired,
};

export default withStyles(styles)(SimpleSnackbar);