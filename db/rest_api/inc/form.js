/**
 * Defines a form for validation
 */
class FormResult {
  
  addError(field, msg) {
    
    if (this.errors == null) {
      // Create the errors object
      this.errors = {};
    }
    
    if (!this.errors[field]) {
      // Create the array of errors for the field
      this.errors[field] = [];
    }
    
    this.errors[field].push(msg);
    
  }
  
  get(field) {
    return this.values[field];
  }
  
  set(field, value) {
    this.values[field] = value;
  }
  
  processSingleField(options, fieldName, requirement) {
    
    // This must be assigned per iteration. It may have been changed
    var fieldValue = this.get(fieldName);
    
    var fieldIsset = !!(
      
      // If string, may not be empty
      (typeof(fieldValue) === 'string' && fieldValue.length) || 
      
      // If not string, may not be NULL or undefined
      (typeof(fieldValue) !== 'string' && fieldValue !== null 
      && fieldValue !== undefined)
      
    );
    
    if (requirement instanceof Function) {
      
      if (options.required == false && !fieldIsset) {
        // Field is not required, and is empty. We don't have to check it
        return true;
      }
      
      // Requirement is a function(Ex: Validators.pattern)
      var fieldErr = requirement(this, fieldName, fieldValue);
      
      if (fieldErr) {
        this.addError(fieldName, fieldErr);
        return true;
      }
      
    } else {
      // Requirement is an option(Ex: Validators.required)
      Object.assign(options, requirement);
    }
    
    if (options.required && !fieldIsset) {
      // Breaks out of the some() loop
      this.addError(fieldName, 'This field is required');
      return true;
    }
    
    return false;
    
  }
  
  processAllFields() {
    
    /*
     * Data may look like:
     *
     * this.schema = {
     *   first_name: [Validators.required, Validators.pattern(...)],
     *   last_name: [Validators.required, Validators.pattern(...)]
     * }
     *
     * This loop will iterate through each key-value pair on this.schema   
     *
     */
    Object.entries(this.schema).forEach( ([fieldName, reqs]) => {
      
      /*
       * Using the example above:
       *
       * fieldName = 'first_name'
       * reqs = [Validators.required, Validators.pattern(...)]
       */
      
      var options = {
        required: false
      };
      
      /*
       * Iterate through the requirements
       * That is, using the example above:
       *
       * reqs = [Validators.required, Validators.pattern(...)]
       *
       * The difference between forEach() versus some() is that some() can
       * break out of the loop with a 'return true'
       */
      reqs.some(requirement => {
        
        /*
         * Using the example above:
         * 
         * requirement = Validators.required
         */
        return this.processSingleField(options, fieldName, requirement);
        
      });
    
    });
  }
  
  prepareForm(inputForm) {    
    Object.keys(this.schema).forEach( k => {
      this.values[k] = inputForm[k];
    });
  }
  
  constructor(inputForm, formSchema, afterValidator) {
    
    this.values = {};
    this.schema = formSchema;
    this.afterValidator = afterValidator;
    this.errors = null;
    
    this.prepareForm(inputForm);
    this.processAllFields();
    
  }
  
}
 
/**
 * Defines a form group, schema and validation
 */
function FormGroup(formSchema, validateAfter) {
  return {
    formSchema,
    validateAfter,
    
    validate: function(form) {
      return new FormResult(form, this.formSchema, this.validateAfter);
    }  
  }  
}

/**
 * This is the default Validators class. The purpose of this class is to 
 * provide a basic set of validators
 */
class Validators {
  
  static default(val) {
    return {default: val};
  }
  
  static trim(formObj, field, value) {
    if (typeof(value) === 'string') {
      formObj.set(field, value.trim());
    }
    return null;
  }
  
  static equal(compareWithField, caseInsensitive) {
    return (formObj, field, value) => {
      
      var a = caseInsensitive ? value.toLowerCase() : value;
      
      var b = formObj.get(compareWithField);
      b = caseInsensitive ? b.toLowerCase() : b;
      
      if (a != b) {
        // Returns the field with error, along with error message
        return `Does not match field ${compareWithField}`;
      }
      
      // No error
      return null;
      
    }
  }
  
  static pattern(exp, err) {
    return (formObj, field, value) => {
      
      if (exp.test(value) == false) {
        // Field value does not match regular expression
        return err || 'Field is not in correct format';
      }
      
      // No error
      return null;
      
    }
  }
  
}

// Validators fields
Validators.required = {required: true};
Validators.notRequired = {required: false};

module.exports = {
  Form: {
    create: FormGroup,
    FormResult
  },
  Validators
}
