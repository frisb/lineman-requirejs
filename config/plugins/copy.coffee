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
    src: 'node_modules/lineman-requirejs/lib/require-min.js'
    dest: 'generated/js/require-min.js'

  config:
    copy:
      dev:
        files: copy.dev.files.concat(nonCoffeeFiles).concat(requireJsLib)
      dist:
        files: copy.dist.files.concat(nonCoffeeFiles)
