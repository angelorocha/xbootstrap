'use strict';

const {series} = require('gulp');
const {parallel} = require('gulp');
const gulp = require('gulp');
const sass = require('gulp-sass')(require('node-sass'));
const uglifycss = require('gulp-uglifycss');
const uglifyjs = require('gulp-uglify');
const concat = require('gulp-concat');
const cleancss = require('gulp-clean-css');
const sourcemaps = require('gulp-sourcemaps');
const autoprefixer = require('gulp-autoprefixer');
const imagemin = require('gulp-imagemin');
const webp = require('gulp-webp');

/** Sass task */
function xoops_sass() {
    return gulp.src('./assets/src/scss/*.scss')
        .pipe(sourcemaps.init())
        .pipe(sass().on('error', sass.logError))
        .pipe(uglifycss({"uglyComments": true}))
        .pipe(cleancss())
        .pipe(autoprefixer({
            cascade: false
        }))
        .pipe(concat('main.min.css'))
        .pipe(sourcemaps.write('./',{addComment: true}))
        .pipe(gulp.dest('./assets/css'))
}

/** JS task */
function xoops_jsmin() {
    return gulp.src('./assets/src/js/*.js')
        .pipe(sourcemaps.init())
        .pipe(uglifyjs())
        .pipe(concat('js.min.js'))
        .pipe(sourcemaps.write('./',{addComment: true}))
        .pipe(gulp.dest('./assets/js'))
}

/** Image compress task */
function xoops_imagemin() {
    return gulp.src('./assets/src/images/*')
        .pipe(imagemin())
        .pipe(gulp.dest('./assets/images'))
}

/** Image to Webp convert */
function xoops_imagewebp(){
    return gulp.src('./assets/src/images/*')
        .pipe(webp())
        .pipe(gulp.dest('./assets/images'))
}

/** Watch tasks */
function xoops_watch_css() {
    return gulp.watch('./assets/src/scss/*.scss', xoops_sass);
}

function xoops_watch_js() {
    return gulp.watch('./assets/src/js/*.js', xoops_jsmin);
}

/** Default tasks */
exports.watch = parallel(xoops_watch_css, xoops_watch_js);
