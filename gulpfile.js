const gulp = require('gulp')
const pug = require("gulp-pug")
const stylus = require('gulp-stylus')
const connect = require('gulp-connect')
const coffee = require('gulp-coffee')
const autoprefixer = require('gulp-autoprefixer');

gulp.task('build', function() {
  gulp.src([
    'node_modules/jquery/dist/jquery.min.js',
    'node_modules/echarts/dist/echarts.min.js',
    'node_modules/handlebars/dist/handlebars.min.js',
    'node_modules/clipboard/dist/clipboard.min.js',
    'node_modules/flatpickr/dist/flatpickr.min.js',
    'node_modules/flatpickr/dist/flatpickr.min.css',
  ]).pipe(gulp.dest('dist/lib'))

  gulp.src([
    'node_modules/flatpickr/dist/l10n/zh.js'
  ]).pipe(gulp.dest('dist/lib/l10n'))

  gulp.src([
    'node_modules/flatpickr/dist/themes/airbnb.css'
  ]).pipe(gulp.dest('dist/lib/themes'))

  gulp.src('src/tpl/*.pug')
    .pipe(pug({pretty: true}))
    .pipe(gulp.dest('dist'))
    .pipe(connect.reload())

  gulp.src('src/img/*')
    .pipe(gulp.dest('dist/img'))
    .pipe(connect.reload())

  gulp.src('src/css/*')
    .pipe(stylus())
		.pipe(autoprefixer({
			browsers: ['last 2 versions', '> 1%'],
			cascade: false
		}))
    .pipe(gulp.dest('dist/css'))
    .pipe(connect.reload())

  gulp.src('src/js/*')
    .pipe(coffee())
    .pipe(gulp.dest('dist/js'))
    .pipe(connect.reload())
})

gulp.task('connect', function() {
  connect.server({
    root: 'dist',
    port: 8888,
    livereload: true
  })
})

gulp.task('watch', function(){
  gulp.watch('src/**', ['build'])
})

gulp.task('dev', ['connect', 'watch'])