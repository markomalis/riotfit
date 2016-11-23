var express = require('express');
var router = express.Router();
var {token} = require('./token.js');

router.route('/')
    .get(function(req,res,next){
      console.log("in GH GET");
      this.message(req.body);
      res.status(200).send('OK');
    })

    .post(function(req,res,next){
      console.log("in GH POST");
      this.message(req.body);
      res.status(200).send('OK');
    });


function message(body) {
  var owner = body.repository.owner.name;
  var repo = body.repository.name;
  var commit_id =  commits[0].id;
  var content = {
    "content": "heart"
  };
  var path = '/repos/'+ owner +'/'+ repo +'/comments/'+ commit_id +'/reactions';

  console.log(path);

  var options = {
    hostname: 'https://api.github.com',
    port: 443,
    path: path,
    method: 'POST',
    headers: {
      //'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': 'token ' + token,
      'Content-Length': Buffer.byteLength(_wh)
    }
  };

  var req = http.request(options, (res) => {
    var result = '';

    res.on('data', (chunk) => {
      result += chunk;
    });

    res.on('end', () => {
      console.log(result);
    });
  });

  req.on('errror', (error) => {
    console.log(error);
  })

  req.write(JSON.stringify(content));
  req.end();
}

module.exports = router;
