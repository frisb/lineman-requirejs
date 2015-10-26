module.exports = (lineman) ->
  _ = require('lodash')
  baseConfig = lineman.config.application

  config:
    loadNpmTasks: baseConfig.loadNpmTasks.concat('grunt-contrib-requirejs')

#    prependTasks:
#      dev: ['requirejs:dev'].concat(baseConfig.prependTasks.dev)
#      dist: ['requirejs:dist'].concat(baseConfig.prependTasks.dist)
      
    requirejs:
      options:
        baseUrl: '<%= files.requirejs.generated %>'
        name: '<%= files.requirejs.almond %>'
        preserveLicenseComments: false
        skipDirOptimize: true
        wrap: true
        findNestedDependencies: true
        logLevel: 2
        pragmas:
          stamp: true

      dev:
        files:
          'generated/js': '<%= files.requirejs.src %>'
        options:
            optimize: 'none'
            generateSourceMaps: true
      dist:
        files:
          'dist/js': '<%= files.requirejs.src %>'
        options:
          optimize: 'uglify2'
          generateSourceMaps: false
