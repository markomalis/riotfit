var http = require('http');
const webpush = require('web-push');
const vapidKeys = webpush.generateVAPIDKeys();

webpush.setGCMAPIKey('AIzaSyBpfUhNyhyoVSW4QI4-RaFbcv-V5BkCEj4');

var options = {
  host: 'localhost',
  port: '5984',
  path: '/push_test/_all_docs?include_docs=true',
  method: 'GET'
}

exports.notifyAll = function(payload) {
  http.request(options, function(res) {
    resp = ''
    res.on('data', function(data) {
      resp = resp + data
    })

    res.on('end', function() {
      json_data = JSON.parse(resp)
      for(var i = 0; i<json_data.rows.length; i++){
        var doc = json_data.rows[i].doc;
        var subObj = {
          endpoint: doc.endpoint,
          keys: {
            auth: doc.auth,
            p256dh: doc.p256dh
          }
        }
        webpush.sendNotification(subObj, JSON.stringify(payload));
      }
    })
  }).end();
}
