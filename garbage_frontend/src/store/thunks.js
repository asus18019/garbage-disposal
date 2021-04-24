import {FETCH_USER, FETCH_USER_FAILURE, LOGIN_USER} from "./userReducer";
import {ADD_USERS, ADD_HISTORY} from "./usersDataReducer";
import {ADD_HOUSES} from "./housesReducer";
import {ADD_CONTAINERS} from "./containersReducer";

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

export const GetUsers = () => async (dispatch) => {
    const response = await fetch('http://127.0.0.1:8000/api/users', {
        method: 'GET',
        headers: {'Content-Type': 'application/json', 'X-Requested-With': 'XMLHttpRequest',},
        credentials: 'include',
    });
    const content = await response.json();
    if(response.status === 401){
        return
    }
    dispatch({type: ADD_USERS, payload: content});
}

export const GetHouses = () => async (dispatch) => {
    const response = await fetch('http://127.0.0.1:8000/api/house/houses', {
        method: 'GET',
        headers: {'Content-Type': 'application/json', 'X-Requested-With': 'XMLHttpRequest',},
        credentials: 'include',
    });
    const content = await response.json();
    if(response.status === 401){
        return
    }
    dispatch({type: ADD_HOUSES, payload: content.all_houses});
}

export const GetHistory = () => async (dispatch) => {
    const response = await fetch('http://127.0.0.1:8000/api/history', {
        method: 'GET',
        headers: {'Content-Type': 'application/json', 'X-Requested-With': 'XMLHttpRequest',},
        credentials: 'include',
    });
    const content = await response.json();
    if(response.status === 401){
        return
    }
    dispatch({type: ADD_HISTORY, payload: content});
}

export const DeleteUser = (userID) => async (dispatch) => {
    const response = await fetch('http://127.0.0.1:8000/api/users/user/delete', {
        method: 'DELETE',
        headers: {'Content-Type': 'application/json', 'X-Requested-With': 'XMLHttpRequest',},
        credentials: 'include',
        body: JSON.stringify({
            userID,
        }),
    });
}

export const GetContainers = () => async (dispatch) => {
    const response = await fetch('http://127.0.0.1:8000/api/house/containers', {
        method: 'GET',
        headers: {'Content-Type': 'application/json', 'X-Requested-With': 'XMLHttpRequest',},
        credentials: 'include',
    });
    const content = await response.json();
    if(response.status === 200){
        dispatch({type:ADD_CONTAINERS, payload: content.containers});
    }
}

export const GetUsersInHouse = () => async (dispatch) => {
    const response = await fetch('http://127.0.0.1:8000/api/house/users', {
        method: 'GET',
        headers: {'Content-Type': 'application/json', 'X-Requested-With': 'XMLHttpRequest',},
        credentials: 'include',
    });
    const content = await response.json();
    if(response.status === 200){
        dispatch({type: ADD_USERS, payload: content.users});
    }
}

export const GetModeratorHouse = () => async (dispatch) => {
    const response = await fetch('http://127.0.0.1:8000/api/moderator/house', {
        method: 'GET',
        headers: {'Content-Type': 'application/json', 'X-Requested-With': 'XMLHttpRequest',},
        credentials: 'include',
    });
    const content = await response.json();
    if(response.status === 200){
        dispatch({type: ADD_HOUSES, payload: content.house});
    }
}