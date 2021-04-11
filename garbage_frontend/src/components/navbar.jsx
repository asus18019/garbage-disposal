import React from 'react';
import {Link} from 'react-router-dom';
import {useDispatch, useSelector} from "react-redux";
import {LOGOUT_USER} from "../store/userReducer";

function Navbar(){
    const user = useSelector(state => state.register);
    const dispatch = useDispatch();

    function CookiesDelete() {
        let cookies = document.cookie.split(";");
        for (let i = 0; i < cookies.length; i++) {
            let cookie = cookies[i];
            let eqPos = cookie.indexOf("=");
            let name = eqPos > -1 ? cookie.substr(0, eqPos) : cookie;
            document.cookie = name + "=;expires=Thu, 01 Jan 1970 00:00:00 GMT;";
            document.cookie = name + '=; path=/; expires=Thu, 01 Jan 1970 00:00:01 GMT;';
            console.log('asdd');
        }
    }

    const Logout = async () => {
        const response = await fetch('http://127.0.0.1:8000/api/user/logout', {
            method: 'POST',
            headers: {'Content-Type': 'application/json', 'X-Requested-With': 'XMLHttpRequest', },
            credentials: 'include',
        });
        const content = await response.json();
        dispatch({type: LOGOUT_USER});
        CookiesDelete();
        console.log(content);
    }

    return(
        <div className='navbarApp'>
            <div className="navbar navbar-light bg-light">
                <div className="logoDiv">
                    <img src="https://www.logaster.ru/blog/wp-content/uploads/sites/2/2018/11/0077_t_keep-arkansas-natural-logo_4.png" alt="logo"></img>
                    <Link className="navbar-brand" to="/">Garbage disposal</Link>
                </div>

                <div className="AuthContainer navbar-brand">
                    {
                        user.isLoggedIn
                            ?
                                <div className="d-flex justify-content-end bd-highlight">
                                    <ul className="navbar-nav mr-auto">
                                        <Link to="/home" className="nav-link">Dashboard</Link>
                                    </ul>
                                    <ul className="navbar-nav mr-auto">
                                        <Link to="/login" onClick={Logout} className="nav-link">Logout</Link>
                                    </ul>
                                </div>
                            :
                                <div className="d-flex justify-content-end bd-highlight">
                                    <ul className="navbar-nav mr-auto">
                                        <Link to="/login" className="nav-link">Login</Link>
                                    </ul>
                                    <ul className="navbar-nav mr-auto">
                                        <Link to="/register" className="nav-link">Register</Link>
                                    </ul>
                                    <ul className="navbar-nav mr-auto">
                                        <Link to="/login" className="nav-link" onClick={Logout}>Logout</Link>
                                    </ul>
                                </div>
                    }
                </div>
            </div>

        </div>
    )
}

export default Navbar;