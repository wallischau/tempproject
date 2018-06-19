var Model = require('../inc/model.js');

/**
 * REST APIs can be a pain. 
 * This simplifies the process for you!
 *
 * For REST API info, see: 
 *  - https://goo.gl/zpMhw5
 *  - https://goo.gl/67diyx
 */

 function REST_appendId(url) {
  if (url[url.length - 1] != '/') {
    url += '/';
  }
  return url + ':_id';
 }

/**
 * RESTful insert. This is a POST request. The body is what will be passed to
 * Model.create() and will return the newly created object
 *
 * @param {String} url - URL pattern for the handler
 * @param {Object} model - Mongoose Model to use
 * @param {Boolean} [allow_bulk] - Allow bulk insert. Disabled by default
 *
 * @return Does not return a value
 *
 * @alias REST_insert
 * @alias REST_create
 * @alias REST_post
 * @alias REST_add
 */
function REST_insert(url, model, allow_bulk) {
  
  // Disallow bulk insertion by default
  allow_bulk = allow_bulk || false;
  
  return this.post(url, async function(req, res, next){
    
    let data = req.body;
    
    try{
      
      let result = null;
      
      if (data instanceof Array) {
        if (!allow_bulk) {
          res.error("Method does not allow bulk insert");
          return;
        }
        
        result = await model.insertMany(data);
      } else if (data instanceof Object) {
        result = await model.create(data);
      } else {
        // Code will never reach here; We use the JSON middleware and 
        // will throw its own error at the client if it's not valid JSON
      }
      
      res.success(result);
      
    } catch(e) {
      res.error(e.toString());
    }
    
  });
}

/**
 * RESTful fetch. This is a GET request. If variables are not found in 
 * req.params, the URL pattern variables(Ex: '/user/junk/1'), then it will look 
 * at the req.query(Ex: /user/junk?_id=1) 
 *
 * @param {String} url - URL pattern for the handler
 * @param {Object} model - Mongoose Model to use
 * @param {Boolean} [allow_bulk] - Allow bulk fetch. Disabled by default
 *
 * @return Does not return a value
 *
 * @alias REST_fetch
 * @alias REST_get
 * @alias REST_find
 * @alias REST_read
 */
function REST_fetch(url, model, options) {
  let allow_bulk = options.allow_bulk || false;

  let populations = [];
  if (options.populations) {
    populations = options.populations;
  }
  this.get(REST_appendId(url), async function(req, res, next){
      
      try {
        let result = model.findOne(req.params);
        for (let i in populations) {
          field = populations[i];
          result = result.populate(field);
        }
        result = await result.exec();
        res.success(result);
      } catch(e) {
        res.error(e.toString());
      }
  });
  
  if (allow_bulk) {
    this.get(url, async function(req, res, next){
      
      try {
        let result = model.find(req.query);
        for (let i in populations) {
          field = populations[i];
          result = result.populate(field);
        }
        result = await result.exec();
        res.success(result);
      } catch(e) {
        res.error(e.toString());
      }
      
    });
  }
  
  return this;
}

/**
 * RESTful update. This is a PUT request. If variables are not found in 
 * req.params, the URL pattern variables(Ex: '/user/junk/1'), then it will look 
 * at the req.query(Ex: /user/junk?_id=1) 
 *
 * NOTE: This only works on a SINGLE resource
 *
 * @param {String} url - URL pattern for the handler
 * @param {Object} model - Mongoose Model to use
 * @param {Boolean} [upsert] - Allow insert if id doesn't exist
 *
 * @return Does not return a value
 *
 * @alias REST_update
 * @alias REST_put
 * @alias REST_upsert
 */
function REST_update(url, model, options) {
  
  let upsert = options.upsert || false;
  let notify = options.notify || null;
  let allow_bulk = options.allow_bulk || false;

  let populations = [];
  if (options.populations) {
    populations = options.populations;
  }
  
  this.put(REST_appendId(url), async function(req, res, next) {
    try {
      
      let result = model.findOneAndUpdate(
        req.params, 
        req.body, 
        { new: true, upsert }
      );

      for (let i in populations) {
          let field = populations[i];
          result = result.populate(field);
        }
        result = await result.exec();
        
      if (result) {
        if (notify) {
          notify.emit(model.modelName, result);
        }
        res.success(result);

      } else {
        res.error("Upsert is disallowed");
      }
        
    } catch(e) {
      res.error(e.toString());
    }
    
  });

  if (allow_bulk) {
    this.put(url, async function(req, res, next) {
      try {
        let docsToUpdate = await model.find(req.query);

        if (docsToUpdate.length == 0) {
          return res.success([]);
        }

        let resultingDocs = [];
        for (let i in docsToUpdate) {
          let currentDoc = docsToUpdate[i];

          let result = model.findOneAndUpdate(
            {_id: currentDoc._id},
            req.body,
            { new: true, upsert }
          )
          for (let j in populations) {
            let field = populations[j];
            result = result.populate(field);
          }
          result = await result.exec();

          if (result) {
            resultingDocs.push(result);
            if (notify) {
              notify.emit(model.modelName, result);
            }
          } else {
            return res.error('Error updating ' +
                             currentDoc._id +
                             ' in ' +
                             model.modelName)
          }
        }
        res.success(resultingDocs);
      } catch (e) {
        res.error(e.toString());
      }
    });
  }

  return this;
}

/**
 * RESTful delete. This is a DELETE request
 *
 * NOTE: This only works on a SINGLE resource
 *
 * @param {String} url - URL pattern for the handler
 * @param {Object} model - Mongoose Model to use
 * @param {Boolean} [upsert] - Allow insert if id doesn't exist
 *
 * @return Does not return a value
 *
 * @alias REST_delete
 * @alias REST_remove
 * @alias REST_drop
 * @alias REST_erase
 */
function REST_delete(url, model, allow_bulk) {
  allow_bulk = allow_bulk || false;
  
  this.delete(REST_appendId(url), async function(req, res, next){
    
    try {
      
      let result = await model.findOneAndRemove(req.params);
        
      if (result) {
        res.success(result);
      } else {
        res.error("Could not find object");
      }
        
    } catch(e) {
      res.error(e.toString());
    }
    
  });

  if (allow_bulk) {
    this.delete(url, async function(req, res, next){
      
      try {
        let result = await model.deleteMany(req.body);

        if (result && result.ok) {
          res.success("Deleted " + result.n + " documents");
        }

      } catch(e) {
        res.error(e.toString());
      }
      
    });
  }

  return this;
}

module.exports = function(app) {
  
  // This is the initialization code
  
  // Add REST_insert() method by modify __proto__(vTable)
  app.__proto__.REST_insert = REST_insert;
  app.__proto__.REST_add = REST_insert;
  app.__proto__.REST_create = REST_insert;
  app.__proto__.REST_post = REST_insert;
  
  // Add REST_fetch() method by modify __proto__(vTable)
  app.__proto__.REST_find = REST_fetch;
  app.__proto__.REST_fetch = REST_fetch;
  app.__proto__.REST_get = REST_fetch;
  app.__proto__.REST_read = REST_fetch;
  
  // Add REST_update() method by modify __proto__(vTable)
  app.__proto__.REST_update = REST_update;
  app.__proto__.REST_upsert = REST_update;
  app.__proto__.REST_put = REST_update;
  
  // Add REST_delete() method by modify __proto__(vTable)
  app.__proto__.REST_delete = REST_delete;
  app.__proto__.REST_erase = REST_delete;
  app.__proto__.REST_drop = REST_delete;
  app.__proto__.REST_remove = REST_delete;
  
  
  // This is the actual middleware
  return async function(req, res, next) {
    
    // Add success() method
    res.success = function(data) {
      this.json({success: true, data});
    };
    
    // Add error() method
    res.error = function(errors) {
      this.status(400).json({success: false, errors});
    }
    
    next();
  }
  
}
