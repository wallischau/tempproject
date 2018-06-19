/**
 * Initial instantiation
 * ---------------------
 * Hello!
 *
 * This is similar to a migration file on Django. The main difference being 
 * is that we are not dealing with schema changes, because MongoDB does not 
 * care about those(NoSQL for the win, anybody?)
 *
 * We may occasionally need to insert data into the database
 *
 * In this case, we need to port over all existing accounts from the old 
 * framework over to this new one
 *
 * The way these update files work is that the framework should read the 
 * 'updates' directory, sort the files by their update number, and determine
 * which updates must occur by checking it against what we have in the database
 *
 * In this aspect, it works the same as Django minus the dependencies
 *
 * Every update should export a function. This is the function that the 
 * framework will execute when applying an update
 *
 */
 
// Model imports
var User = require('../models/User.js');

// Update 
module.exports = function(done) {
  
  var defaultPassword = "changeme";
  
  var users = [
    {userid: "hwhitney", fname: "Holly", lname: "Whitney", email: "holly.whitney@charter.com", active: false},
    {userid: "mroeckel", fname: "Mark", lname: "Roeckel", email: "mark.roeckel@charter.com", active: true},
    {userid: "tmccullough", fname: "Taren", lname: "McCullough", email: "taren.mccullough@charter.com", active: true},
    {userid: "jperkins", fname: "Jason", lname: "Perkins", email: "jason.perkins@charter.com", active: true},
    {userid: "npatil", fname: "Nagendra", lname: "Patil", email: "nagendra.patil@charter.com", active: false},
    {userid: "jbodden", fname: "Jorge", lname: "Bodden", email: "jorge.bodden@charter.com", active: true},
    {userid: "bhodges", fname: "Brenden", lname: "Hodges", email: "brenden.hodges@charter.com", active: true},
    {userid: "pmalladi", fname: "Pratyusha", lname: "Malladi", email: "pratyusha.malladi@charter.com", active: false},
    {userid: "vfoss", fname: "Victor", lname: "Foss", email: "victor.foss@charter.com", active: false},
    {userid: "tbleidorn", fname: "Tim", lname: "Bleidorn", email: "tim.bleidorn@charter.com", active: false},
    {userid: "dwilliams", fname: "Daryl", lname: "Williams", email: "daryl.williams@charter.com", active: false},
    {userid: "mdillon", fname: "Matt", lname: "Dillon", email: "matt.dillon@charter.com", active: true},
    {userid: "cpatten", fname: "Craig", lname: "Patten", email: "craig.patten@charter.com", active: false},
    {userid: "tzatorski", fname: "Todd", lname: "Zatorski", email: "todd.zatorski@charter.com", active: false},
    {userid: "cthiret", fname: "Connor", lname: "Thiret", email: "connor.thiret@charter.com", active: false},
    {userid: "arris", fname: "Arris", lname: "Vendor", email: "arris@email.com", active: false},
    {userid: "askey", fname: "Askey", lname: "Vendor", email: "askey@email.com", active: false},
    {userid: "ubee", fname: "Ubee", lname: "Vendor", email: "ubee@email.com", active: false},
    {userid: "sagemcom", fname: "Sagemcom", lname: "Vendor", email: "sagemcom@email.com", active: false},
    {userid: "jsmith", fname: "Jay", lname: "Smith", email: "c-jay.smith2@charter.com", active: true},
    {userid: "jobrien", fname: "Jodi", lname: "O'Brien", email: "jodi.obrien@live.com", active: true},
    {userid: "moduwaiye", fname: "Muhib", lname: "Oduwaiye", email: "muhib.oduwaiye@charter.com", active: true},
    {userid: "carvelo", fname: "Carlos", lname: "Arvelo", email: "c-carlos.arvelo@charter.com", active: true},
    {userid: "jbenitez", fname: "Joel", lname: "Benitez", email: "c-joel.benitez@charter.com", active: true},
    {userid: "cwatson", fname: "Chris", lname: "Watson", email: "c-christopher.watson@charter.com", active: true},
    {userid: "cshaneyfelt", fname: "Crystal", lname: "Shaneyfelt", email: "c-crystal.shaneyfelt@charter.com", active: false},
    {userid: "dolding", fname: "Douglas", lname: "Olding", email: "douglas.olding@charter.com", active: true},
    {userid: "mcohen", fname: "Mikayla", lname: "Cohen", email: "mikayla.cohen@charter.com", active: true},
    {userid: "eschultz", fname: "Ed", lname: "Schultz", email: "c-ed.schultz@charter.com", active: true},
    {userid: "kzucker", fname: "Kyle", lname: "Zucker", email: "C-Kyle.Zucker@charter.com", active: true},
    {userid: "dgolke", fname: "David", lname: "Golke", email: "C-David.Golke@charter.com", active: true},
    {userid: "acrouch", fname: "Allison", lname: "Crouch", email: "C-Allison.Crouch@charter.com", active: true},
    {userid: "wcao", fname: "Weipeng", lname: "Cao", email: "C-Weipeng.Cao@charter.com", active: true},
    {userid: "lstankiewicz", fname: "Lukasz", lname: "Stankiewicz", email: "C-Lukasz.Stankiewicz@charter.com", active: true},
    {userid: "svenkatappagar", fname: "Sai", lname: "Venkatappagar", email: "C-Sai.Venkatappagar@charter.com", active: true},
    {userid: "dfriedman", fname: "Dan", lname: "Friedman", email: "Dan.Friedman@charter.com", active: true},
    {userid: "gveerepalli", fname: "Girish", lname: "Veerepalli", email: "C-Girish.Veerepalli@charter.com", active: true},
    {userid: "rlodwig", fname: "Richard", lname: "Lodwig", email: "Richard.Lodwig@charter.com", active: true},
    {userid: "runnerd", fname: "Runner", lname: "Daemon", email: "runner.daemon@charter.com", active: true},
    {userid: "reaperd", fname: "Reaper", lname: "Daemon", email: "reaper.daemon@charter.com", active: true}
  ];
  
  var popAndExec = function() {
    var user = users.splice(0, 1)[0];
    
    if (user) {
      
      User.register(
        user.email,
        defaultPassword,
        user.fname,
        user.lname,
        user.active,
      ).then(function(result){
        popAndExec();
      }).catch(function(err){
        // The user may exist. Keep going regardless
        popAndExec();
      });
      
    } else {
      done();
    }
    
  }
  
  popAndExec();
  
};
