module.exports = (lineman) ->
  _ = require('lodash')
  baseConfig = lineman.config.application

  common =
    baseUrl: '<%= files.requirejs.generated %>'
    name: '<%= files.requirejs.almond %>'
    preserveLicenseComments: false
    skipDirOptimize: true
    wrap: true
    findNestedDependencies: true
    logLevel: 2
    pragmas:
      stamp: true

  extend = (custom) ->
    _.extend({}, common, custom)

  config:
    loadNpmTasks: baseConfig.loadNpmTasks.concat('grunt-contrib-requirejs')

    prependTasks:
      dev: ['requirejs:dev'].concat(baseConfig.prependTasks.dev)
      dist: ['requirejs:dist'].concat(baseConfig.prependTasks.dist)
    requirejs:
      dev:
        files:
          'generated/js': '<%= files.requirejs.src %>'
        options: extend
            optimize: 'none'
            generateSourceMaps: true
      dist:
        files:
          'dist/js': '<%= files.requirejs.src %>'
        options: extend
          optimize: 'uglify2'
          generateSourceMaps: false
