module.exports = (grunt) ->
  _ = require('lodash')
  path = require('path')
  appList = null
  start = null

  grunt.renameTask('requirejs', 'optimize')

  grunt.registerMultiTask 'requirejs', 'generates almond', ->
    appList = ''
    start = new Date()

    common = @data.options

    optimize = (target, src, dest) ->
      fileBaseName = path.basename(src, '.js')
      appName = fileBaseName.replace('main-', '')
      appList += (if appList.length == 0 then '' else ', ') + appName

      config =
        options: extend
          mainConfigFile: src
          include: [ fileBaseName ]
          out:  dest + '/' + appName + '.js'
          done: (done, output) ->
            time = (new Date() - start) / 1000
            grunt.log.writeln('File ' + src + ' created in ' + time + 's.')
            start = new Date()
            done()

      grunt.config.set('optimize.' + appName, config)

    extend = (custom) ->
      _.extend({}, common, custom)

    for filePair in @files
      dest = filePair.dest

      for src in filePair.src
        optimize(@target, src, dest, @data.options)

      grunt.log.writeln('Generating ' + appList)
      grunt.task.run(['optimize'])
