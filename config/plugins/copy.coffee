module.exports = (lineman) ->
  baseConfig = lineman.config.application

  nonCoffeeFiles = [
    expand: true
    cwd: '<%= files.requirejs.app %>'
    src: [
      '**/*.*'
      '!**/*.coffee'
    ]
    dest: '<%= files.requirejs.generated %>'
  ]

  config:
    copy:
      dev:
        files: baseConfig.copy.dev.files.concat(nonCoffeeFiles)
      dist:
        files: baseConfig.copy.dist.files.concat(nonCoffeeFiles)
