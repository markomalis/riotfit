var express = require('express');
var router = express.Router();

var su_name = "Marko";

router.route('/')
    //get all exercises from main exerciseLib
    .get(function(req,res,next){
            res.render('index', { 
		test: 'test'
        });
    })
    //TODO: post a new exercise to the main exerciseLib
    //TODO: function should only be available to superusers
    //.post(function(req,res,next){
    //});

router.route('/app')
    .get(function(req,res,next) {
            res.render('index',
                {
                    js: "exercise"
                }
            );
    })
    .post(function(req,res,next){
        res.json([{"test":"testPOST", "body":req.body.yolo}]);
    })

module.exports = router;
