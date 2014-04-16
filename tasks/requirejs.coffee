module.exports = (grunt) ->
  path = require('path')

  grunt.registerMultiTask "almond", "generates almond", ->
    context = @data.context

    for filePair in @files
      dest = filePair.dest
      appList = ''

      for src in filePair.src
        fileBaseName = path.basename(src, '.js')
        appName = fileBaseName.replace('main-', '')
        appList += (if appList.length == 0 then 'building ' else ', ') + appName
        start = new Date()

        config = {
          options:
            mainConfigFile: src
            include: [ fileBaseName ]
            out:  dest + '/' + appName + '.js'
            optimize: context.optimize
            done: (done, output) ->
              time = (new Date() - start) / 1000
              start = new Date()
              grunt.log.writeln 'File "' + src + '" created in ' + time + 'ms.'
              done()
        }

        grunt.config.set('requirejs.' + appName, config)
		    grunt.task.run(['requirejs'])

      grunt.log.writeln(appList)
