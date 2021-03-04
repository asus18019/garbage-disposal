import React from 'react';
import {Link} from 'react-router-dom';

function Navbar(){
    return(
        <div>
            <div className="navbar navbar-light bg-light">
                <a className="navbar-brand" href="/">Garbage disposal</a>

                <div className="AuthContainer navbar-brand">
                    <div className="d-flex justify-content-end bd-highlight">
                        <ul className="navbar-nav mr-auto">
                            <Link to="/login" className="nav-link">Login</Link>
                        </ul>
                        <ul className="navbar-nav mr-auto">
                            <Link to="/register" className="nav-link">Register</Link>
                        </ul>
                    </div>
                </div>
            </div>


        </div>
    )
}

export default Navbar;