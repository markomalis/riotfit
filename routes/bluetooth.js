var express = require('express');
var router = express.Router();

router.route('/')
    //get all exercises from main exerciseLib
    .get(function(req,res,next){
        res.render('index',
            {
		        js: 'bluetooth'
            }
        )
    })
    //TODO: post a new exercise to the main exerciseLib
    //TODO: function should only be available to superusers
    //.post(function(req,res,next){
    //});

module.exports = router;
