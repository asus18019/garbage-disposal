const initialState = {
    containers: [],
}

export const ADD_CONTAINERS = "ADD_CONTAINERS";
export const DELETE_CONTAINER = "DELETE_CONTAINER";

export const containersReducer = (state = initialState, action) => {
    switch (action.type){
        case ADD_CONTAINERS:
            return {...state, containers: action.payload}
        case DELETE_CONTAINER:
            return {...state, containers: state.containers.filter(container => container.garbage_houseID !== action.payload)}
        default:
            return state
    }
}

