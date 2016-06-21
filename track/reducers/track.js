var redux = require('redux')
var actions = require('../actions/workout.js')
var sortByName = require('../public/js/js_helpers.js').sortListByName
//Action variables
var ADD_EXERCISE = actions.ADD_EXERCISE
var ADD_TAG = actions.ADD_TAG
var ADD_VIEW = actions.ADD_VIEW
var DELETE_TAG = actions.DELETE_TAG
var DETAIL_VIEW = actions.DETAIL_VIEW
var EXERCISE_VIEW = actions.EXERCISE_VIEW
var LIST_VIEW = actions.LIST_VIEW
var SEARCH = actions.SEARCH
var SELECT_EXERCISE = actions.SELECT_EXERCISE
var SET_DETAIL_VIEW = actions.SET_DETAIL_VIEW
var SET_PANEL_VIEW = actions.SET_PANEL_VIEW


function addView(state=false, action) {
    switch(action.type) {
        case ADD_EXERCISE:
            return false
        case ADD_VIEW:
            return action.show
        default:
            return state
    }
} 

function exercises(state=[], action) {
    switch(action.type) {
        case SEARCH:
            return state.map(function(exercise, index) {
                if(!action.text) {
                    return Object.assign({}, exercise, {visible: true})
                }else {
                    return Object.assign({}, exercise, {visible: (exercise.name.toLowerCase().indexOf(action.text.toLowerCase()) > -1 ? true : false )})
                }
            }).sort(sortByName)
        default:
            return state
    }
}

function exerciseList(state=[], action) {
    switch(action.type) {
        case ADD_EXERCISE:
            return state.concat({[action.exercise]}).sort(sortByName)
        case DELETE_EXERCISE:
            
        case 
        default:
            return state
    }
}


function tags(state=[], action){
    switch(action.type){
        case ADD_EXERCISE:
            return []
        case ADD_TAG:
            return state.concat([action.tag])
        case DELETE_TAG:
            var newState = Object.assign([], state)
            newState.splice(action.index,1)
            return newState
        default:
            return state
    }
}






function detail(state=false, action) {
    switch(action.type) {
        case SELECT_EXERCISE:
            return action.index
        default:
            return state
    }
}

function exercises(state=[], action) {
    switch(action.type) {
        case ADD_EXERCISE:
            return state.concat([action.exercise]).sort(sortByName)
        case SEARCH:
            return state.map(function(exercise, index) {
                if(!action.text) {
                    return Object.assign({}, exercise, {visible: true})
                }else {
                    return Object.assign({}, exercise, {visible: (exercise.name.toLowerCase().indexOf(action.text.toLowerCase()) > -1 ? true : false )})
                }
            }).sort(sortByName)
        default:
            return state
    }
}

function detailView(state=EXERCISE_VIEW, action){
    switch(action.type) {
        case SELECT_EXERCISE:
            return EXERCISE_VIEW
        case SET_DETAIL_VIEW:
            return action.view
        default:
            return state
    }
}

function panelView(state=LIST_VIEW, action){
    switch(action.type) {
        case SELECT_EXERCISE:
            return DETAIL_VIEW
        case SET_PANEL_VIEW:
            return action.view
        default:
            return state
    }
}

/*
function search(state='', action){
    switch(action.type) {
        case SEARCH:
            return action.text
        default:
            return state
    }
}
*/

module.exports = redux.combineReducers({
  addView,
  detail,
  exercises,
  exerciseList,
  detailView,
  panelView,
  tags
})

