module.exports =

  tableName: 'vm'

  schema: true

  attributes:

    name: 'string'

    # disk size in GB
    disk:
      type: 'integer'
      required: true
      defaultsTo: process.env.DISK
      min: process.env.DISK
      max: process.env.DISKMAX

    # memory size in MB
    memory:
      type: 'integer'
      required: true
      defaultsTo: process.env.MEMORY
      min: process.env.MEMORY
      max: process.env.MEMORYMAX

    port:
      type: 'json'
      required: true

    createdBy:
      model: 'user'
      required:  true
