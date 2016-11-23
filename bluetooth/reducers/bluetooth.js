var redux = require('redux')
var actions = require('../actions/bluetooth.js')
var sortByName = require('../../public/js/js_helpers.js').sortListByName

function connected(state=false, action) {
  return state
}

module.exports = redux.combineReducers({
  connected
})
