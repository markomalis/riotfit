var express = require('express');
var exphbs  = require('express-handlebars');
var path = require('path');
var favicon = require('serve-favicon');
var logger = require('morgan');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');

var bluetooth = require('./routes/bluetooth');
var calendar = require('./routes/calendar');
var exercises = require('./routes/exercises');
var github = require('./routes/github');
var jumptest = require('./routes/jumptest');
var notify = require('./routes/notify');
var workouts = require('./routes/workouts');

var routes = require('./routes/index');
var users = require('./routes/users');

var app = express();

// view engine setup
app.engine('html', exphbs({}));
app.set('view engine', 'html');

// uncomment after placing your favicon in /public
//app.use(favicon(path.join(__dirname, 'public', 'favicon.ico')));
app.use(logger('dev'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(cookieParser());
app.use('/sw.js', express.static(path.join(__dirname, 'public/js/sw.js')));
app.use(express.static(path.join(__dirname, 'public')));

app.use('/', routes)
app.use('/bluetooth', bluetooth)
app.use('/calendar', calendar)
app.use('/exercises', exercises)
app.use('/github', github)
app.use('/jumptest', jumptest)
app.use('/notify', notify)
app.use('/workouts', workouts)
app.use('/users', users);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  var err = new Error('Not Found');
  err.status = 404;
  next(err);
});

// error handlers

// development error handler
// will print stacktrace
if (app.get('env') === 'development') {
  app.use(function(err, req, res, next) {
    res.status(err.status || 500);
    res.render('error', {
      message: err.message,
      error: err
    });
  });
}

// production error handler
// no stacktraces leaked to user
app.use(function(err, req, res, next) {
  res.status(err.status || 500);
  res.render('error', {
    message: err.message,
    error: {}
  });
});


module.exports = app;
