module.exports = (lineman) ->
  baseConfig = lineman.config.application

  config:
    watch:
      coffee:
        files: baseConfig.watch.coffee.files.concat('!<%= files.requirejs.app %>')
      requirejs:
        files: ['<%= files.requirejs.app %>/**/*.*']
        tasks: ['coffee', 'jshint', 'copy:dev', 'requirejs:dev']
