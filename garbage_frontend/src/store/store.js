import {createStore} from 'redux';
import {userReducer} from './userReducer';
import {combineReducers, applyMiddleware} from 'redux';
import { composeWithDevTools } from 'redux-devtools-extension';
import thunk from 'redux-thunk';

export const rootReducer = combineReducers({
    register: userReducer,
});

export const store = createStore(rootReducer, composeWithDevTools(applyMiddleware(thunk)));