module.exports = (opts) => {
    var spawner = opts.spawner;
    var spawn = opts.spawn;
    var gulp = opts.gulp;
    var babel = opts.gulpBabel;
    var runSequence = opts.runSequence;
    var del = opts.del;

    // default task
    gulp.task('default', ['start']);

    // watch to restart
    gulp.watch([
        'src/**/*.js',
        'test/src/**/*.js',
        'index.js'
    ], ['restart']);

    gulp.task('start', (cb) => {
        runSequence('stop', 'init', 'clean', 'build', 'test', cb);
    });

    gulp.task('restart', (cb) => runSequence('stop', 'clean', 'build', 'test', cb));

    gulp.task('init', () => spawn('npm', ['i']));

    gulp.task('stop', () => spawner.killAll());

    gulp.task('test', () => spawn('npm', ['test']));

    gulp.task('test-cover', () => spawn('npm', ['run', 'cover']));

    gulp.task('clean', () => del([
        'lib',
        'test/lib'
    ]));

    /**
     * We will build src and test/src directory, so we can write ES6/7 in both src and test/src.
     */
    gulp.task('build', ['build-src', 'build-test']);

    gulp.task('build-src', () =>
        gulp.src('src/**/*.js')
        .pipe(babel({
            presets: ['es2015', 'stage-0']
        }))
        .pipe(gulp.dest('lib'))
    );

    gulp.task('build-test', () =>
        gulp.src('test/src/**/*.js')
        .pipe(babel({
            presets: ['es2015', 'stage-0']
        }))
        .pipe(gulp.dest('test/lib')));
};
