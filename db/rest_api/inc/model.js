/**
 * MongoDB Models with Mongoose
 * -----------------------------
 * The models in this framework will be instantiated with $ which will parse 
 * fields and methods. This reduces the amount of boilerplate code
 */ 
 
 var path = require('path');
 var mongoose = require('mongoose');

// Gets the calling file
function getCallerFile() {
  
  try {
    // Create a new `Error`, which automatically gets `stack`
    var err = new Error();
    var callerfile;
    var currentfile;

    // Evaluate `err.stack`, which calls our new `Error.prepareStackTrace`
    Error.prepareStackTrace = function (err, stack) { return stack; };

    currentfile = err.stack.shift().getFileName();

    while (err.stack.length) {
        callerfile = err.stack.shift().getFileName();

        if(currentfile !== callerfile) return callerfile;
    } 
  } catch (err) {}
  
  return undefined;
}

// Create model
function createModel(collectionName, modelSchema){

    // These are var type names
    const SCHEMA_TYPES = [
      'String', 
      'Number', 
      'Date', 
      'Buffer',
      'Boolean', 
      'Mixed',
      'ObjectId',
      'Array',
      'Object'
    ];
    
    var modelName = path.basename(getCallerFile(), '.js');
    var methodsSchema = {};
    
    // Can take 1 or 2 parameters
    if (!modelSchema) {
      // Assume we took only one parameter
      modelSchema = collectionName;
      collectionName = (modelName + 's').toLowerCase();
    }
    
    // Iterate through the keys, check types, delete function keys
    Object.entries(modelSchema).forEach( ([k, o]) => {
      if (typeof(o) == 'function' && !SCHEMA_TYPES.includes(o.name)) {
        
        if (o.name == 'model' && o.$init) {
          
          // This is a model("related" field)
          modelSchema[k] = {
            "type": mongoose.Schema.Types.ObjectId,
            "ref": o.modelName
          };
          
        } else {
          
          // This is a method
          methodsSchema[k] = o;
          delete modelSchema[k];
          
        }
        
      }
      
    });
    
    // modelSchema now has a Mongoose schema. Let's create it!
    var schema = mongoose.Schema(modelSchema, {strict: false});
    
    // Let's add in the methods now!
    Object.entries(methodsSchema).forEach( ([k, o]) => {
      var type = k[0];
      var name = k.substr(1);
      
      switch(type) {
        
        case '@':
          // Static method
          schema.statics[name] = o;
          break;
          
        case '#':
          // Getter method
          schema.virtual(name).get(o);
          break;
          
        default:
          // Instance method
          schema.methods[k] = o;
          
      }
    });
    
    // Compile and return the model
    return mongoose.model(modelName, schema, collectionName);
};

module.exports = {
  ObjectId: mongoose.Schema.Types.ObjectId,
  Mixed: mongoose.Schema.Types.Mixed,
  create: createModel
}