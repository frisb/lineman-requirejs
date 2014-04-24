module.exports =
  files:
    requirejs:
      app: 'app/js/require'
      generated: 'generated/js/require'
      src: '<%= files.requirejs.generated %>/main*.js'
      almond: '../../../node_modules/lineman-requirejs/lib/almond'
