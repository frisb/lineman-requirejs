module.exports = (lineman) ->
  config:
    almond:
      options:
        baseUrl: '<%= files.requirejs.generated %>'
        name: '<%= files.requirejs.almond %>'
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
