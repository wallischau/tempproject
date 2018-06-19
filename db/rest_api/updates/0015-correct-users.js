// Model imports
const User = require('../models/User.js');

//
// User-group table
//
const automationUsers = {
  "runner.daemon@charter.com": {"fname": "daemon", "lname": "runner"},
  "reaper.daemon@charter.com": {"fname": "daemon", "lname": "reaper"},
}

const userGroups = {
  "admin": ['carvelo', 'mcohen', 'dgolke', 'acrouch', 'kzucker'],
  "poc": ['mroeckel', 'tmccullough', 'jbenitez', 'cwatson', 'mdillon'],
  "executive": ['dolding', 'jperkins'],
  "qa": ['bhodges', 'eschultz'],
  "automation": ['drunner', 'dreaper']
};

//
// Update starts here!!!
//
// This update will do the following:
//
//   1. Add "automation" group users
//   2. Add user groups 
//   3. Change all passwords to corresponding usernames
//
module.exports = async function(done, fail, updateStatus) {
  
  //
  // Step #1 - Add "automation" group users
  //
  for(email in automationUsers) {
    let info = automationUsers[email];
    await User.remove({"email": email.toLowerCase()});
    await User.register(email, 'changeme', info.fname, info.lname, true);
  }
  
  //
  // Step #2 - Add user groups
  //
  
  // Add a "login" group to all users
  await User.update({}, {"$set": {"groups": ['login']}}, {multi: true});
  
  // Add usergroups
  for(group in userGroups) {
    let users = userGroups[group];
    await User.update(
      {"userid": {"$in": users}}, 
      {"$push": {"groups": group}}, {multi: true}
    );
  }
  
  //
  // Step #3 - Change all passwords
  //
  let users = await User.find();
  for(let i = 0; i < users.length; i++) {
    let user = users[i];
    user.setPassword(user.userid);
  }
  
  //
  // Step #4 - ... Done!
  //
  done();
  
};
