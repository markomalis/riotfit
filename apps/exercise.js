var redux = require('redux')
var riot = require('riot')
var sortByName = require('../public/js/js_helpers.js').sortListByName
var exs = require('../test_data/exercise_test_data.js').data
require('../exercise/tags/exercise-add.tag')
require('../exercise/tags/exercise-app.tag')
require('../exercise/tags/exercise-detail.tag')
require('../exercise/tags/exercise-edit.tag')
require('../exercise/tags/exercise-list.tag')
require('../exercise/tags/search.tag')

exs = exs.map(function(e){
    e.visible= true
    return e
})
var store = redux.createStore(require('../exercise/reducers/exercise.js'),{exercises: exs.sort(sortByName)})

document.addEventListener('DOMContentLoaded', function(){
    riot.mount('div#main', 'exercise-app', {store : store})
})
