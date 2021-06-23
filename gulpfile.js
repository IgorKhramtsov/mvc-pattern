let gulp = require('gulp'),
    uglify = require('gulp-uglify-es').default;
    less = require('gulp-less');
    prefix = require('gulp-autoprefixer');
    csso = require('gulp-csso');
    reload = require('gulp-livereload');
    concat = require('gulp-concat');

gulp.task('js', function () {
    const priority_files = ['jquery-3.3.1.min'];
    let files = [];
    let ignore = priority_files.join('|');
    for(let i = 0; i < priority_files.length; i++)
        files.push('src/js/libs/' + priority_files[i] + '.js');
    files.push('src/js/libs/!(' + ignore + ')*.js');

    gulp.src(files)
        .pipe(uglify())
        .pipe(concat('libs.js'))
        .pipe(gulp.dest('build/js/'));

    gulp.src('src/js/*.js')
        .pipe(uglify())
        .pipe(gulp.dest('build/js/'));
});
gulp.task('less', function () {
    gulp.src('src/css/app.less')
        .pipe(less())
        .pipe(prefix('last 3 version'))
        .pipe(csso())
        .pipe(gulp.dest('build/css/'))
        .pipe(reload({start: true}));
});

gulp.task('watch', function () {
   reload.listen();
   gulp.watch('src/css/*.less', ['less']);
   gulp.watch('src/js/*.js', ['js']);
});

gulp.task('default', ['js', 'less', 'watch']);