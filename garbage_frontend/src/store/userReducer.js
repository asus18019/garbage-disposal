const initialState = {
    loading: false,
    isLoggedIn: false,
    user: {},
    errors: {},
    role: 0
}

export const FETCH_USER = "FETCH_USER";
export const FETCH_USER_FAILURE = "FETCH_USER_FAILURE";
export const LOGIN_USER = "LOGIN_USER";
export const LOGOUT_USER = "LOGOUT_USER";

export const userReducer = (state = initialState, action) => {
    switch (action.type){
        case FETCH_USER:
            return {...state, user: {}, isLoggedIn: false, loading: true, errors: {}, role: 0}
        case LOGIN_USER:
            return {...state, user: action.payload, isLoggedIn: true, loading: false, role: action.payload.roles[0].name}
        case LOGOUT_USER:
            return {...state, user: {}, isLoggedIn: false, role: 0}
        case FETCH_USER_FAILURE:
            return {...state, user: {}, isLoggedIn: false, loading: false, errors: action.payload}


        // case ADD_ERROR:
        //     return {...state,  status: true }
        // case REMOVE_ERROR:
        //     return {...state, status: false}
        // case ADD_TEXT:
        //     return {...state, users: [...state.users, action.payload]}

        // case REMOVE_USER:
        //     return {...state, users: state.users.filter(user => user.id !== action.payload)}
        default:
            return state
    }
}

