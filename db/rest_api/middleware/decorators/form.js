module.exports = function(args, req, res, next) {
  
  // "args" is an array of args fed into the decorator
  // Ex: if you used .form(LoginForm)
  // You will get permissions = [LoginForm]
  
  // Thus, we can unpack this the following way:
  let [ formObj ] = args;
  
  if (!formObj) {
    // Error if the developer did not supply a form
    res.status(500).send({success: false, errors: "No form in URL handler"});
    return;
  }
  
  // Where to look for form data
  const METHOD_FORMDATA = {
    "GET": "query",
    "PUT": "body",
    "POST": "body",
    "PATCH": "body",
    "DELETE": "query"
  }
  
  let formProp = METHOD_FORMDATA[req.method];
  
  // Now load up form data
  let formData = req[formProp];
  
  // Validate the form
  let formResult = formObj.validate(formData);
  
  if (formResult.errors) {
    res.error(formResult.errors);
    return;
  }
  
  // Add into "req" so that our Route handlers may access form
  if (!req.form) {
    req.form = [];
  }
  
  req.form.push(formResult);
  
  next();
  
}
