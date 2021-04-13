import React from 'react';
import {Link} from 'react-router-dom';
import {useDispatch, useSelector} from "react-redux";
import {LOGOUT_USER} from "../store/userReducer";
import { useTranslation } from "react-i18next";
import { changeLanguage } from "../translation/i18n";

function Navbar(){
    const {t, i18n} = useTranslation();

    const user = useSelector(state => state.register);
    const dispatch = useDispatch();

    const Logout = async () => {
        const response = await fetch('http://127.0.0.1:8000/api/user/logout', {
            method: 'POST',
            headers: {'Content-Type': 'application/json', 'X-Requested-With': 'XMLHttpRequest', },
            credentials: 'include',
        });
        const content = await response.json();
        dispatch({type: LOGOUT_USER});
        console.log(content);
    }

    return(
        <div className='navbarApp'>
            <div className="navbar navbar-light bg-light">
                <div className="logoDiv">
                    <img src="https://www.logaster.ru/blog/wp-content/uploads/sites/2/2018/11/0077_t_keep-arkansas-natural-logo_4.png" alt="logo"></img>
                    <Link className="navbar-brand" to="/">{t("navbar.logo")}</Link>

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
                                        <Link to="/login" className="nav-link">{t("navbar.login")}</Link>
                                    </ul>
                                    <ul className="navbar-nav mr-auto">
                                        <Link to="/register" className="nav-link">{t("navbar.register")}</Link>
                                    </ul>
                                    <ul className="navbar-nav mr-auto">
                                        <select className="form-select" aria-label="Default select example">
                                            <option selected onClick={() => changeLanguage('en')}>English</option>
                                            <option onClick={() => changeLanguage('ua')}>Ukrainian</option>
                                        </select>
                                    </ul>
                                </div>
                    }
                </div>

            </div>

        </div>
    )
}

export default Navbar;