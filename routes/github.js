var express = require('express');
var router = express.Router();

router.route('/')
    .get(function(req,res,next){
      message(body);
      res.status(200).send('OK');
    })

    .post(function(req,res,next){
      message(body);
      res.status(200).send('OK');
    });


function message(body) {
  var owner = body.repository.owner.name;
  var repo = body.repository.name;
  var comment_id =  commits[0].id;
  var content = {
    "content": "heart"
  };
  var path = '/repos/'+ owner +'/'+ repo +'/comments/'+ comment_id +'/reactions';

  var options = {
    hostname: 'https://api.github.com',
    port: 443,
    path: path,
    method: 'POST',
    headers: {
      //'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': 'token 3cedfaef5c458347de0e0b7f306b2de0f36d4f51',
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
