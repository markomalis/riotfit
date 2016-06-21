// Action type constants
export const ADD_EXERCISE = 'ADD_EXERCISE'
export const ADD_TAG = 'ADD_TAG'
export const ADD_VIEW = 'ADD_VIEW'
export const DELETE_TAG = 'DELETE_TAG'
export const SELECT_EXERCISE = 'SELECT_EXERCISE'
export const SEARCH = 'SEARCH'
export const SET_DETAIL_VIEW = 'SET_DETAIL_VIEW'
export const SET_PANEL_VIEW = 'SET_PANEL_VIEW'

// Panel-View type constants
export const DETAIL_VIEW = 'DETAIL_VIEW'
export const LIST_VIEW = 'LIST_VIEW'

// Detail-View type constants
export const EDIT_VIEW = 'EDIT_VIEW'
export const EXERCISE_VIEW = 'EXERCISE_VIEW'

// Action creators
export const addExercise = function(exercise) {
    return {
        type: ADD_EXERCISE,
        exercise: exercise
    }
}

export const addTag = function(tag) {
    return {
        type: ADD_TAG,
        tag: tag
    }
}

export const addView = function(show) {
    return {
        type: ADD_VIEW,
        show: show
    }
}

export const deleteTag = function(index) {
    return {
        type: DELETE_TAG,
        index: index
    }
}

export const selectExercise = function(index) {
    return {
        type: SELECT_EXERCISE,
        index: index
    }
}

export const search = function(text) {
    return {
        type: SEARCH,
        text: text
    }
}

export const detailView = function(view) {
    return {
        type: SET_DETAIL_VIEW,
        view: view
    }
}

export const panelView = function(view) {
    return {
        type: SET_PANEL_VIEW,
        view: view
    }
}
