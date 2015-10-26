module.exports =
  files:
    requirejs:
      app: 'app/amd'
      generated: 'generated/js'
      src: '<%= files.requirejs.generated %>/main-*.js'
      almond: '../../node_modules/lineman-requirejs/lib/almond'
