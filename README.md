# sails.form
Create HTML form based on sailsjs model

## Installation
```
npm install sails.form
```

## Extend renderer to generate html for different front end platform
see [ionic1.coffee](ionic1.coffee) to implement formTemplate, fieldTemplate, and fsTemplate

## Sample
```
Form = require 'sails.form'
form = new Form
  model: sails.models.vm
  include: ['name', 'disk', 'size']
console.log form.html values
```
