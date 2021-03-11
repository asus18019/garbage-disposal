import {createStore} from 'redux';
import {ErrorReducer} from './registerReducer';
import {combineReducers} from 'redux';
import { composeWithDevTools } from 'redux-devtools-extension';

export const rootReducer = combineReducers({
    register: ErrorReducer,
});

export const store = createStore(rootReducer, composeWithDevTools());