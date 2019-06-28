gulp = require('gulp')
concat = require('gulp-concat')
uglify = require('gulp-uglify')
coffee = require('gulp-coffee')
sass = require('gulp-sass')
connect = require('gulp-connect')
watch = require('gulp-watch')
{ series } = require('gulp')

connect_ = (cb) ->
    connect.server
        root: '.',
        livereload: true,
        ->
          cb()

compile_vendors_js = (cb) ->
  gulp.src(
      [
        'node_modules/jquery/dist/jquery.js',
        'node_modules/bootstrap/dist/js/bootstrap.js',
        'node_modules/vue-i18n/dist/vue-i18n.js',
        'node_modules/vue/dist/vue.js',
        'node_modules/vuex/dist/vuex.js',
        'node_modules/vue-router/dist/vue-router.js',
        'node_modules/cookies-js/dist/cookies.js',
      ]
    )
    .pipe(concat('vendors.min.js'))
    .pipe(uglify())
    .pipe(gulp.dest('build/js'))
    .pipe(connect.reload())

  cb()

compile_vendors_css = (cb) ->
  gulp.src(
      [
        'node_modules/bootstrap/dist/css/bootstrap.css',
      ]
    )
    .pipe(concat('vendors.min.css'))
    .pipe(gulp.dest('build/css'))
    .pipe(connect.reload())

  cb()

compile_app = (cb) ->
  gulp.src(
      [
        # models
        'coffee/models/graphql.coffee',

        # controllers
        'coffee/controllers/base.coffee',
        'coffee/controllers/navbar.coffee',
        'coffee/controllers/cookies.coffee',
        'coffee/controllers/home.coffee',

        # generals
        'coffee/filters.coffee',
        'coffee/settings.coffee',
  #      'coffee/store.coffee',
        'coffee/main.coffee',
      ]
    )
    .pipe(concat('app.min.js'))
    .pipe(coffee(bare: true))
  #  .pipe(uglify())
    .pipe(gulp.dest('build/js'))
    .pipe(connect.reload())

  cb()


compile_sass = (cb) ->
  gulp.src('sass/**/*.scss')
    .pipe(concat('app.min.css'))
    .pipe(sass().on('error', sass.logError))
    .pipe(gulp.dest('build/css'))
    .pipe(connect.reload())

  cb()


watch_ = (cb) ->
    watch('coffee/*/*.coffee', -> compile_app(cb));
    watch(['sass/*/*.scss'], -> compile_sass(cb));
    cb()

ws = (cb) ->
  series(connect_, watch_)

  cb()

exports.ws = series(connect_, watch_)
exports.default = series(
  compile_vendors_js,
  compile_vendors_css,
  compile_app,
  compile_sass,
  ws
)