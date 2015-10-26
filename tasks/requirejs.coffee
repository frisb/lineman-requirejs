module.exports = (grunt) ->
  chalk = require('chalk')
  path = require('path')

  grunt.renameTask('requirejs', 'optimize')

  grunt.registerMultiTask 'requirejs', 'generates almond', ->
    appList = ''
    start = new Date()

    optimize = (src, dest) =>
      fileBaseName = path.basename(src, '.js')
      appName = fileBaseName.replace('main-', '')
      destFile = dest + '/' + appName + '.js'
      appList += (if appList.length == 0 then '' else ', ') + appName

      config =
        options: @options
          mainConfigFile: src
          include: [ fileBaseName ]
          out:  destFile
          done: (done, output) ->
            time = (new Date() - start) / 1000
            grunt.log.writeln('File ' + chalk.magenta(destFile) + ' created in ' + time + 's.')
            start = new Date()
            done()

      grunt.config.set('optimize.' + appName, config)

    for filePair in @files
      dest = filePair.dest

      for src in filePair.src
        optimize(src, dest)

      grunt.log.writeln('Generating ' + appList)
      grunt.task.run(['optimize'])
