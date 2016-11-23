var express = require('express');
var https = require('https');
var router = express.Router();
var {token} = require('./token.js');

router.route('/')
    .get(function(req,res,next){
      //this.message(req.body);
      res.status(200).send('OK');
    })

    .post(function(req,res,next){
      message(req.body, function(err) {
        if(err) {
          next(err);
          //res.status(404).send('NOT OK');
        }
        else {
          res.status(200).send('OK');
        }
      });

    });


function message(body, callback) {
  console.log(body);
  var owner = body.repository.owner.name;
  var repo = body.repository.name;
  var commit_id =  body.commits[0].id;
  var body = JSON.stringify({
    body: "Great stuff"
  });
  var path = '/repos/'+ owner +'/'+ repo +'/commits/'+ commit_id +'/comments';

  var options = {
    hostname: 'api.github.com',
    port: 443,
    path: path,
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'token ' + token,
      'User-Agent': 'GitBot'
      //'Content-Length': Buffer.byteLength(content)
    }
  };

  var req = https.request(options, (res) => {
    var result = '';

    res.on('data', (chunk) => {
      result += chunk;
    });

    res.on('end', () => {
      console.log(result.toString());
      callback(undefined)
    });
  });

  req.on('error', (error) => {
    callback(error);
    console.log(error);
  })

  req.end(body);
}

module.exports = router;
