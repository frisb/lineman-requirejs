module.exports = (grunt) ->
  path = require('path')
  
  grunt.registerMultiTask "require", "generates almond", ->
    config = grunt.config.get('require.' + @target)
    
    context = this.data.context
    
    for filePair in @files
      dest = filePair.dest
      
      for src in filePair.src
        fileBaseName = path.basename src, '.js'
        appName = fileBaseName.replace 'main-', ''
            
        grunt.config.set 'requirejs.' + appName,
          options:
            mainConfigFile: src
            include: [ fileBaseName ]
            out:  dest + '/' + appName + '.js'
            optimize: context.optimize
        
		    grunt.task.run(['requirejs'])