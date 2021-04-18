import React from 'react';
import './css files/home.css';
import {useSelector} from "react-redux";
import Admin from "./admin";
import Moderator from "../pages/moderator";
import User from "./user";

function Home(){
    const loading = useSelector(state => state.register);

    return(
        <div className="App">
            {
                loading.role === 'user' ? <User /> :
                loading.role === 'moderator' ? <Moderator /> :
                loading.role === 'admin' ? <Admin /> :
                <div className="loaderDiv">
                    <div className="loader"/>
                </div>
            }
        </div>
    )
}

export default Home;