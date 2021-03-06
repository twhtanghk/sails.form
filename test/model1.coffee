module.exports =

  tableName: 'vm'

  schema: true

  attributes:

    name:
      type: 'string'
      required: true
      unique: true

    # disk size in GB
    disk:
      type: 'integer'
      required: true
      defaultsTo: process.env.DISK

    # memory size in MB
    memory:
      type: 'integer'
      required: true
      defaultsTo: process.env.MEMORY

    port:
      type: 'json'
      required: true

    createdBy:
      model: 'user'
      required:  true
