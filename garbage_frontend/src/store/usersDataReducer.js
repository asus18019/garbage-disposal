const initialState = {
    loading: false,
    selectedUsers: [],
    users: [],
    history: [],
    errors: {}
}

export const FETCH_USER = "FETCH_USER";
export const FETCH_USER_FAILURE = "FETCH_USER_FAILURE";
export const ADD_USERS = "ADD_USERS";
export const SELECT_USERS = "SELECT_USERS";
export const FILTER_USERS_BY_ROLE = "FILTER_USERS_BY_ROLE";
export const ADD_HISTORY = "ADD_HISTORY";
export const DELETE_USER = "DELETE_USER";

export const usersReducer = (state = initialState, action) => {
    switch (action.type){
        case FETCH_USER:
            return {...state, users: [], loading: true, errors: {}}
        case ADD_USERS:
            return {...state, users: action.payload, loading: false, selectedUsers: action.payload}
        case SELECT_USERS:
            return {...state, selectedUsers: [...state.users]}
        case FETCH_USER_FAILURE:
            return {...state, users: {}, loading: false, errors: action.payload}
        case FILTER_USERS_BY_ROLE:
            return {...state, selectedUsers: [...state.users].filter(user => user.name === action.payload)}
        case ADD_HISTORY:
            return {...state, history: action.payload}
        case DELETE_USER:
        return {...state, users: state.users.filter(user => user.userID !== action.payload), selectedUsers: state.selectedUsers.filter(user => user.userID !== action.payload)}
        default:
            return state
    }
}

