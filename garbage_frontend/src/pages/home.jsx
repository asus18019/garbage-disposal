import React from 'react';
import './css files/home.css';
import {useSelector} from "react-redux";
import User from "../pages/user";
import Moderator from "../pages/moderator";
import Admin from "../pages/admin";

function Home(){
    const loading = useSelector(state => state.register);

    const func = () => console.log('some text')

    return(
        <div className="App">
            <h3>Hello</h3>
            {
                loading.role == 'user' ? <User />
                : loading.role == 'moderator' ? <Moderator />
                : loading.role == 'admin' ? <Admin />
                :
                    <div className="loaderDiv">
                        <div className="loader"></div>
                    </div>
            }
        </div>
    )
}

export default Home;