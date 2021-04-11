import './App.css';
import React, {useEffect} from 'react';
import {BrowserRouter, Route} from 'react-router-dom';
import Navbar from './components/navbar';
import Login from './pages/login';
import Home from './pages/home';
import Register from './pages/register';
import {useDispatch} from "react-redux";
import {GetUserByCookie} from "./store/userAC";
import Forbidden from "./pages/forbibben";

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
            <Route path='/login' component={Login}/>
            <Route path='/register' component={Register}/>
            <Route path='/home' component={Home}/>
            <Route path='/forbidden' component={Forbidden}/>
        </BrowserRouter>
    </div>
  );
}

export default App;
