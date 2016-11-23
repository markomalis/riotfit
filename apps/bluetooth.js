var redux = require('redux')
var riot = require('riot')
var sortByName = require('../public/js/js_helpers.js').sortListByName
require('../bluetooth/tags/bluetooth-app.tag')

var store = redux.createStore(require('../bluetooth/reducers/bluetooth.js'))

document.addEventListener('DOMContentLoaded', function(){
    riot.mount('div#main', 'bluetooth-app', {store : store})
})
