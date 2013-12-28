// Karma configuration
// http://karma-runner.github.io/0.10/config/configuration-file.html

module.exports = function(config) {
  config.set({
    // base path, that will be used to resolve files and exclude
    basePath: '',

    // testing framework to use (jasmine/mocha/qunit/...)
    frameworks: ['jasmine'],

    // list of files / patterns to load in the browser
    files: [
      'app/bower_components/angular/angular.js',
      'app/bower_components/ace-builds/src-min-noconflict/ace.js',
      'app/bower_components/prelude-browser/index.js',
      'app/bower_components/angular-ui-bootstrap-bower/ui-bootstrap-tpls.js',
      'app/bower_components/angular-route/angular-route.js',
      'app/bower_components/angular-mocks/angular-mocks.js',
      'app/bower_components/marked/lib/marked.js',
      'app/bower_components/angular-md5/angular-md5.js',
      'app/bower_components/angular-ui-ace/ui-ace.js',
      'app/scripts/app.js',
      'app/scripts/templates.js">',
      'app/scripts/controllers/main.js',
      'app/scripts/controllers/comments.js',
      'app/scripts/controllers/comment.js',
      'app/scripts/services/markedFactory.js',
      '.tmp/scripts/*.js',
      '.tmp/scripts/**/*.js',
      '.tmp/mock/**/*.js',
      '.tmp/spec/**/*.js'
    ],

    // list of files / patterns to exclude
    exclude: [],

    // web server port
    port: 8080,

    // level of logging
    // possible values: LOG_DISABLE || LOG_ERROR || LOG_WARN || LOG_INFO || LOG_DEBUG
    logLevel: config.LOG_INFO,


    // enable / disable watching file and executing tests whenever any file changes
    autoWatch: false,


    // Start these browsers, currently available:
    // - Chrome
    // - ChromeCanary
    // - Firefox
    // - Opera
    // - Safari (only Mac)
    // - PhantomJS
    // - IE (only Windows)
    browsers: ['Chrome'],


    // Continuous Integration mode
    // if true, it capture browsers, run tests and exit
    singleRun: false
  });
};
