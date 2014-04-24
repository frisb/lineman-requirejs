module.exports = (lineman) ->
  config:
    concat_sourcemap:
      js:
        src: lineman.config.application.concat_sourcemap.js.src.concat [
          '!<%= files.requirejs.app %>/**/*.*'
          '!<%= files.requirejs.generated %>/**/*.*'
        ]
