module.exports = (lineman) ->
  config:
    coffee:
      compile:
        files:
          '<%= files.coffee.generated %>': [
            lineman.config.application.coffee.compile.files['<%= files.coffee.generated %>']
            '!<%= files.requirejs.app %>/**/*.coffee'
          ]
      require:
        options:
          bare: true
          join: false
        files: [
          {
            expand: true
            cwd: '<%= files.requirejs.app %>'
            src: '**/*.coffee'
            dest: '<%= files.requirejs.generated %>'
            ext: '.js'
          }
        ]
