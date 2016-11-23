var express = require('express');
var router = express.Router();

router.route('/')
    //get all exercises from main exerciseLib
    .get(function(req,res,next){
      console.log('in yolo get');
      console.log(req.body);
    })
    //TODO: post a new exercise to the main exerciseLib
    //TODO: function should only be available to superusers
    .post(function(req,res,next){
      console.log('in yolo post');
      console.log(req.body);
    });


module.exports = router;
