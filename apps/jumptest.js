var redux = require('redux')
var riot = require('riot')
var sortByName = require('../public/js/js_helpers.js').sortListByName
require('../jumptest/tags/jumptest-app.tag')

var store = redux.createStore(require('../jumptest/reducers/jumptest.js'))

document.addEventListener('DOMContentLoaded', function(){
    riot.mount('div#main', 'jumptest-app', {store : store})
})
