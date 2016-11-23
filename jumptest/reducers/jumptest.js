var redux = require('redux')
var actions = require('../actions/jumptest.js')

var initialMaxValues = {
  x_a : 0,
  y_a : 0,
  z_a : 0
}

var initialOrientation = {
  a : 0,
  b : 0,
  g : 0
}

function maxValues(state=initialMaxValues, action) {
  switch (action.type) {
    case actions.UPDATE_MAX_VALUES:
      return action.values
    default:
      return state
  }
}

function orientation(state=initialOrientation, action) {
  switch (action.type) {
    case actions.UPDATE_ORIENTATION:
      return action.orientation
    default:
      return state
  }
}

function testState(state=actions.INITIAL, action) {
  switch (action.type) {
    case actions.CHANGE_TEST_STATE:
      return action.test_state
    default:
      return state
  }
}

module.exports = redux.combineReducers({
  maxValues,
  orientation,
  testState
})
