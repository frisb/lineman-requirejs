module.exports = (lineman) ->
  baseConfig = lineman.config.application

  filesToCopy = [
    expand: true
    cwd: "app/requirejs"
    src: [
      "**/*.*"
      "!**/*.coffee"
    ]
    dest: 'generated/requirejs'
  ]

  config:
    loadNpmTasks: baseConfig.loadNpmTasks.concat('grunt-contrib-requirejs')

    prependTasks:
      dev: baseConfig.prependTasks.dev.concat('almond:dev')

    appendTasks:
      dist: baseConfig.appendTasks.dist.concat('almond:dist')

    watch:
      require:
        files: ["<%= files.almond.js %>"]
        tasks: ["almond"]

    copy:
      dev:
        files: baseConfig.copy.dev.files.concat(filesToCopy)
      dist:
        files: baseConfig.copy.dist.files.concat(filesToCopy)

    coffee:
      compile:
        options:
          bare: true
          join: false
        files: [
          expand: true
          cwd: "app/requirejs"
          src: "**/*.coffee"
          dest: 'generated/requirejs'
          ext: '.js'
          extDot: 'first'
        ]

    almond:
      dev:
        files:
          "generated/js": "<%= files.almond.src %>"
        context:
          optimize: "none"
      dist:
        files:
          "dist/js": "<%= files.almond.src %>"
        context:
          optimize: "uglify2"

    requirejs:
      options:
        baseUrl: "<%= files.almond.baseUrl %>"
        name: '../../node_modules/lineman-requirejs/lib/almond'
        paths:
            'config': 'configs/en'
        preserveLicenseComments: false,
        skipDirOptimize: true
        generateSourceMaps: true
        wrap: true
        findNestedDependencies: true
        logLevel: 2
        pragmas:
          stamp: true
