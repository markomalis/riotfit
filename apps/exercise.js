var redux = require('redux')
var riot = require('riot')
var sortByName = require('../public/js/js_helpers.js').sortListByName
var exs = require('../test_data/exercise_test_data.js').data
require('../tags/exercise-add.tag')
require('../tags/exercise-app.tag')
require('../tags/exercise-detail.tag')
require('../tags/exercise-edit.tag')
require('../tags/exercise-list.tag')
require('../tags/search.tag')

exs = exs.map(function(e){
    e.visible= true
    return e
})
var store = redux.createStore(require('../reducers/exercise.js'),{exercises: exs.sort(sortByName)})

document.addEventListener('DOMContentLoaded', function(){
    riot.mount('exercise-app', {store : store})
})
