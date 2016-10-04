//Helper vars
var root_dir = '../../'

//Dependecies import
var PouchDB = require('pouchdb')
var redux = require('redux')
var riot = require('riot')
var sortByName = require('../public/js/js_helpers.js').sortListByName
var exs = require('../test_data/exercise_test_data.js').data

//Tags import
require('../calendar/tags/calendar-app.tag')
require('../calendar/tags/planned-list.tag')
require('../calendar/tags/planned-workout.tag')


/*
exs = exs.map(function(e){
    e.visible= true
    return e
})
var store = redux.createStore(require('../workout/reducers/workout.js'),{ exercises: exs.sort(sortByName) })
*/

//DB test
var db = new PouchDB('calendar');

db.info().then(function (info) {
  console.log(JSON.stringify(info));
})

var doc = {
  "_id": Date.today().add(-3).day().toString(),
  "date": Date.today().add(-3).day(),
  "workouts": [
            { 
                name: 'Leg Blaster', 
                exercises: [
                    'Deadlift',
                    'Jumping lunges',
                    'Jump squat',
                    'Hill sprints',
                    'Kettlebel swing',
                    'Hill sprints',
                    'Broad jumps'
                ]
            },
            { 
                name: 'Butt Booster', 
                exercises: [
                    'Deadlift',
                    'Glute bridge',
                    'Squat',
                    'Kettlebel swing',
                    'Kickbacks'
                ]
            }
        ]
}

var doc2 = {
  "_id": Date.today().add(-8).day().toString(),
  "date": Date.today().add(-8).day(),
  "workouts": [
            { 
                name: 'Leg Blaster', 
                exercises: [
                    'Deadlift',
                    'Jumping lunges',
                    'Jump squat',
                    'Hill sprints',
                    'Kettlebel swing',
                    'Hill sprints',
                    'Broad jumps'
                ]
            },
            { 
                name: 'Butt Booster', 
                exercises: [
                    'Deadlift',
                    'Glute bridge',
                    'Squat',
                    'Kettlebel swing',
                    'Kickbacks'
                ]
            }
        ]
}

db.put(doc)
db.put(doc2)

db.allDocs({include_docs: true}).then(function (docs){
    var cals = docs
    var wos = cals.rows[0].doc.workouts
    console.log(wos)
    console.log(document)
    var tags = riot.mount('div#main', 'calendar-app', {workouts: wos})
})



