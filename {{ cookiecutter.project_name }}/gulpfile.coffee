gulp = require('gulp')
concat = require('gulp-concat')
uglify = require('gulp-uglify')
coffee = require('gulp-coffee')
sass = require('gulp-sass')
connect = require('gulp-connect')
watch = require('gulp-watch')

gulp.task 'connect', ->
    connect.server
        root: '.',
        livereload: true

gulp.task 'compile_vendors', ->
  gulp.src(
    [
      'node_modules/jquery/dist/jquery.js',
      'node_modules/bootstrap/dist/js/bootstrap.js',
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

gulp.task 'compile_app', ->
  gulp.src(
    [
      # models
      'coffee/models/graphql.coffee',

      # controllers
      'coffee/controllers/base.coffee',
      'coffee/controllers/navbar.coffee',
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


gulp.task 'compile_sass', ->
  gulp.src(
    [
      'sass/main.scss',
    ]
  )
  .pipe(concat('styles.min.css'))
  .pipe(sass())
  .pipe(uglify())
  .pipe(gulp.dest('build/css'))
  .pipe(connect.reload())


gulp.task 'watch', ->
    gulp.watch(['coffee/*/*'], ['compile_app']);
    gulp.watch(['sass/*/*'], ['compile_sass']);

gulp.task 'ws', ['connect', 'watch']

gulp.task 'default', ['compile_vendors', 'compile_app', 'compile_sass', 'gulp',]
