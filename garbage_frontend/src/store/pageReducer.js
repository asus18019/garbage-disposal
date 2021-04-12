const initialState = {
    page: 'Home',
    selectedIndex: {},
}

export const SET_PAGE = "SET_PAGE";
export const SET_INDEX = "SET_INDEX";

export const pageReducer = (state = initialState, action) => {
    switch (action.type){
        case SET_PAGE: {
            return {...state, page: action.payload}
        }
        case SET_INDEX: {
            return {...state, selectedIndex: action.payload}
        }
        default:
            return state
    }
}

