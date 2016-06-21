//Helper vars
var root_dir = '../../'

//Dependecies import
var redux = require('redux')
var riot = require('riot')
var sortByName = require('../public/js/js_helpers.js').sortListByName
var exs = require('../test_data/exercise_test_data.js').data

//Tags import
require('../track/tags/track-app.tag')

/*
exs = exs.map(function(e){
    e.visible= true
    return e
})
var store = redux.createStore(require('../workout/reducers/workout.js'),{exercises: exs.sort(sortByName)})
*/

document.addEventListener('DOMContentLoaded', function(){
    riot.mount('track-app')
})
