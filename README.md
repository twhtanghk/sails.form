# sails.form
Create HTML form based on sailsjs model

## Installation
```
npm install sails.form
```

## Function
. [Caolan Form](https://github.com/caolan/forms) object
```
sailsForm.form(attributes, exlcude = null, include = '__all__'): return caolan form object
```

. Default HTML form
```
sailsForm.html(attributes, exclude = null, include = '__all__'): return default html form

. Bootstrap form
```
sailsForm.form(model.attributes, exclude = null, include = '__all__').toHTML(iterator): iterate attributes to render HTML form
```

### Sample
```
sailsForm = require 'sails.form'

console.log sailsForm.html sails.models.user.attributes
```
