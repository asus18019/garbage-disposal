const initialState = {
    loading: false,
    houses: [],
    errors: [],
}

export const FETCH_HOUSES = "FETCH_HOUSES";
export const FETCH_HOUSES_FAILURE = "FETCH_HOUSES_FAILURE";
export const ADD_HOUSES = "ADD_HOUSES";

export const housesReducer = (state = initialState, action) => {
    switch (action.type){
        case FETCH_HOUSES:
            return {...state, houses: [], loading: true, errors: {}}
        case ADD_HOUSES:
            return {...state, houses: action.payload, loading: false}
        case FETCH_HOUSES_FAILURE:
            return {...state, errors: [...state.errors, action.payload]}
        default:
            return state
    }
}

