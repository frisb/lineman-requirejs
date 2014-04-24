module.exports = (lineman) ->
  baseConfig = lineman.config.application

  config:
    loadNpmTasks: baseConfig.loadNpmTasks.concat('grunt-contrib-requirejs')

    prependTasks:
      dev: ['requirejs:dev'].concat(baseConfig.prependTasks.dev)
      dist: ['requirejs:dist'].concat(baseConfig.prependTasks.dist)

    requirejs:
      dev:
        files:
          'generated/js': '<%= files.requirejs.src %>'
        context:
          optimize: 'none'
      dist:
        files:
          'dist/js': '<%= files.requirejs.src %>'
        context:
          optimize: 'uglify2'
