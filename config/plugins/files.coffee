module.exports =
  files:
    almond:
      js: "requirejs/**/*.js"
      coffee: "requirejs/**/*.coffee"
      baseUrl: "generated/requirejs"
      src: "<%= files.almond.baseUrl %>/main*.js"
