import {FETCH_USER, FETCH_USER_FAILURE, LOGIN_USER} from "./userReducer";

export const GetUserByCookie = () => async (dispatch) => {
    dispatch({type: FETCH_USER})
    const response = await fetch('http://127.0.0.1:8000/api/user/user', {
        method: 'GET',
        headers: {'Content-Type': 'application/json', 'X-Requested-With': 'XMLHttpRequest',},
        credentials: 'include',
    });
    const content = await response.json();
    if(response.status === 401){
        dispatch({type: FETCH_USER_FAILURE, payload: content.message});
        return
    }
    dispatch({type: LOGIN_USER, payload: content});
}