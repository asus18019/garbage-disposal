import {createStore} from 'redux';
import {userReducer} from './userReducer';
import {usersReducer} from "./usersDataReducer";
import {housesReducer} from "./housesReducer";
import {containersReducer} from "./containersReducer";
import {pageReducer} from "./pageReducer";
import {combineReducers, applyMiddleware} from 'redux';
import { composeWithDevTools } from 'redux-devtools-extension';
import thunk from 'redux-thunk';

export const rootReducer = combineReducers({
    register: userReducer,
    users: usersReducer,
    houses: housesReducer,
    page: pageReducer,
    containers: containersReducer
});

export const store = createStore(rootReducer, composeWithDevTools(applyMiddleware(thunk)));