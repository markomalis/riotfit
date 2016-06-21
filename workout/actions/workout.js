// Action type constants
export const ADD_EXERCISE = 'ADD_EXERCISE'
export const ADD_ENTRY = 'ADD_ENTRY'
export const ADD_SET = 'ADD_SET'
export const ADD_TAG = 'ADD_TAG'
export const ADD_VIEW = 'ADD_VIEW'
export const COPY_SET = 'COPY_SET'
export const DELETE_EXERCISE = 'DELETE_EXERCISE'
export const DELETE_SET = 'DELETE_SET'
export const DELETE_TAG = 'DELETE_TAG'
export const SELECT_EXERCISE = 'SELECT_EXERCISE'
export const SEARCH = 'SEARCH'
export const SET_DETAIL_VIEW = 'SET_DETAIL_VIEW'
export const SET_PANEL_VIEW = 'SET_PANEL_VIEW'

// Panel-View type constants
export const DETAIL_VIEW = 'DETAIL_PANEL'
export const LIST_VIEW = 'LIST_PANEL'

// Detail-View type constants
export const EDIT_VIEW = 'CALENDAR_VIEW'
export const WORKOUT_VIEW = 'WORKOUT_VIEW'

// Action creators
export const addEntry = function(index, set, entry) {
    return {
        type: ADD_ENTRY,
        index: index,
        set: set,
        entry: entry
    }
}

export const addExercise = function(index, name) {
    return {
        type: ADD_EXERCISE,
        index: index,
        name: name
    }
}

export const addSet = function(index) {
    return {
        type: ADD_SET,
        index: index,
    }
}

export const addTag = function(tag) {
    return {
        type: ADD_TAG,
        tag: tag
    }
}

export const copySet = function(index, set) {
    return {
        type: COPY_SET,
        index: index,
        set: set
    }
}

export const deleteExercise = function(index) {
    return {
        type: DELETE_EXERCISE,
        index: index
    }
}

export const deleteSet = function(index, set) {
    return {
        type: DELETE_SET,
        index: index,
        set: set
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
