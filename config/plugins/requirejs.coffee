module.exports = (lineman) ->
  baseConfig = lineman.config.application
  
  delete baseConfig.watch.js
  delete baseConfig.watch.coffee
  
  files:
    require:
      baseUrl: "generated/js"
      src: "<%= files.require.baseUrl %>/main-*.js"
  
  config:
    loadNpmTasks: baseConfig.loadNpmTasks.concat('grunt-contrib-requirejs')
    
    removeTasks:
      common: baseConfig.removeTasks.common.concat('concat_sourcemap')
      dist: baseConfig.removeTasks.dist.concat('uglify')
      
    watch: baseConfig
      
    copy:
      dev: 
        files: baseConfig.copy.dev.files.concat [
          expand: true
          cwd: "app/js"
          src: [
            "**/*.*"
            "!**/*.coffee"
          ]
          dest: 'generated/js'
        ]
      
    coffee:
      compile:
        options:
          bare: true
          join: false
        files: [
          expand: true
          cwd: "app/js"
          src: "**/*.coffee"
          dest: 'generated/js'
          ext: '.js'
          extDot: 'first'
        ]
  
    require:
      dev:
        files:
          "generated/js": "<%= files.require.src %>"
        context:
          optimize: "none"
      dist:
        files:
          "dist/js": "<%= files.require.src %>"
        context:
          optimize: "uglify2"
      
    requirejs:
      options:
        baseUrl: "<%= files.require.baseUrl %>"
        name: '../../node_modules/lineman-requirejs/lib/almond'
        paths:
            'config': 'configs/en'
        preserveLicenseComments: false,
        skipDirOptimize: true
        generateSourceMaps: true
        wrap: true 
        findNestedDependencies: true
        logLevel: 0
        pragmas:
          stamp: true
        done: (done, output) ->
          #lineman.grunt.log.subhead 'done <%= files.require.mainConfigFile %>'
            #done(new Error('r.js built duplicate modules, please check the excludes option.'));
          
          done()