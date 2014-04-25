module.exports = (grunt) ->
  path = require('path')
  appList = ''

  grunt.renameTask('requirejs', 'almond')

  grunt.registerMultiTask 'requirejs', 'generates almond', ->
    appList = ''

    for filePair in @files
      dest = filePair.dest

      for src in filePair.src
        configureAlmond(src, dest, @data.options)

      grunt.task.run(['almond'])
      grunt.log.writeln(appList)

  configureAlmond = (src, dest, options) ->
    fileBaseName = path.basename(src, '.js')
    appName = fileBaseName.replace('main-', '')
    appList += (if appList.length == 0 then 'building ' else ', ') + appName
    start = new Date()

    config = {
      options:
        mainConfigFile: src
        include: [ fileBaseName ]
        out:  dest + '/' + appName + '.js'
        optimize: options.optimize
        done: (done, output) ->
          time = (new Date() - start) / 1000
          start = new Date()
          grunt.log.writeln 'File ' + src + ' created in ' + time + 'ms.'
          done()
    }

    grunt.config.set('almond.' + appName, config)
