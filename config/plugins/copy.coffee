module.exports = (lineman) ->
  copy = lineman.config.application.copy

  nonCoffeeFiles = [
    expand: true
    cwd: '<%= files.requirejs.app %>'
    src: [
      '**/*.*'
      '!**/*.coffee'
    ]
    dest: '<%= files.requirejs.generated %>'
  ]

  requireJsLib =
    src: 'node_modules/lineman-requirejs/lib/requirejs-min.js'
    dest: 'generated/js/requirejs-min.js'

  config:
    copy:
      dev:
        files: copy.dev.files.concat(nonCoffeeFiles).concat(requireJsLib)
      dist:
        files: copy.dist.files.concat(nonCoffeeFiles)
