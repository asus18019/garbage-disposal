const initialState = {
    containers: [],
}

export const ADD_CONTAINERS = "ADD_CONTAINERS";

export const containersReducer = (state = initialState, action) => {
    switch (action.type){
        case ADD_CONTAINERS:
            return {...state, containers: action.payload}
        default:
            return state
    }
}

