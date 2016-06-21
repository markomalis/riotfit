var express = require('express');
var router = express.Router();

var su_name = "Marko";

router.route('/')
    //get all exercises from main exerciseLib
    .get(function(req,res,next){
	res.render('index', {test:'test'})
    })
    //post a new exercise to the main exerciseLib
    //TODO: function should only be available to superusers
    //.post(function(req,res,next){
    //});

router.route('/app')
//get all exercises from main exerciseLib
    .get(function(req,res,next){
        res.render('index', {test:'test'})
    })
    //post a new exercise to the main exerciseLib
    //TODO: function should only be available to superusers
    //.post(function(req,res,next){
    //});

module.exports = router;
