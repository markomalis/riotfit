var express = require('express');
var notify = require('../pushnotifications/push.js');
var router = express.Router();

router.route('/new_record')
    //get all exercises from main exerciseLib
    .get(function(req,res,next){
      notify.notifyAll({
        title: 'New record set!',
        body: 'The current record has been set to: alot',
        icon: 'https://web-push-book.gaunt.io/notification-icon.png'
      })
      res.status(200).json({
        status: 'ok'
      })
    })
    //TODO: post a new exercise to the main exerciseLib
    //TODO: function should only be available to superusers
    //.post(function(req,res,next){
    //});

module.exports = router;
