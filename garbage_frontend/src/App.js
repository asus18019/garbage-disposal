import './App.css';
import React, {useEffect} from 'react';
import {BrowserRouter, Route} from 'react-router-dom';
import Navbar from './components/navbar';
import Login from './pages/login';
import Home from './pages/home';
import Register from './pages/register';
import {useDispatch} from "react-redux";
import {GetUserByCookie} from "./store/thunks";
import Forbidden from "./pages/forbibben";
import Main from "./pages/main";

function App() {
    const dispatch = useDispatch();

    useEffect(() => {
            dispatch(GetUserByCookie());
        }, []
    )

  return (
    <div className="App">
        <BrowserRouter>
            <Navbar/>
            <Route exact path='/login' component={Login}/>
            <Route exact path='/register' component={Register}/>
            <Route exact path='/home' component={Home}/>
            <Route exact path='/forbidden' component={Forbidden}/>
            <Route exact path='/' component={Main}/>
        </BrowserRouter>
        {/*<Main />*/}
    </div>
  );
}

export default App;
