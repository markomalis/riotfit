//Actions
export const CHANGE_TEST_STATE = 'CHANGE_STATE'
export const UPDATE_ACCELERATION = 'UPDATE_ACCELERATION'
export const UPDATE_MAX_VALUES = 'UPDATE_MAX_VALUES'
export const UPDATE_ORIENTATION = 'UPDATE_ORIENTATION'
//STATE constants
export const INITIAL = 'INITIAL'
export const RUNNING = 'RUNNING'
export const STOPPED = 'STOPPED'


export const setTestState = function(test_state) {
  return {
    type: CHANGE_TEST_STATE,
    test_state: test_state
  }
}

export const updateMaxValues = function(values) {
  return {
    type: UPDATE_MAX_VALUES,
    values: values
  }
}

export const updateOrientation = function(orientation) {
  return {
    type: UPDATE_ORIENTATION,
    orientation: orientation
  }
}
