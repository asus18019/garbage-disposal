const initialState = {
    status: false,
    users: [],
}

export const ADD_ERROR = "ADD_ERROR";
export const REMOVE_ERROR = "REMOVE_ERROR";
export const ADD_TEXT = "ADD_TEXT";
export const REMOVE_USER = "REMOVE_USER";

export const ErrorReducer = (state = initialState, action) => {
    switch (action.type){
        case ADD_ERROR:
            return {...state,  status: true }
        case REMOVE_ERROR:
            return {...state, status: false}
        case ADD_TEXT:
            return {...state, users: [...state.users, action.payload]}
        case REMOVE_USER:
            return {...state, users: state.users.filter(user => user.id !== action.payload)}
        default:
            return state
    }
}

