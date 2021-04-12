import React, {useState} from 'react';
import {Link, Redirect} from 'react-router-dom';
import Error from "../components/error";
import {useDispatch, useSelector} from "react-redux";
import {FETCH_USER, FETCH_USER_FAILURE} from "../store/userReducer";
import  "./css files/login.css"
import {GetUserByCookie} from "../store/userAC";

const Login = () => {
    const loading = useSelector(state => state.register);
    const dispatch = useDispatch();

    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    const[redirect, setRedirect] = useState(false);
    const [error, setError] = useState([]);

    const submit = async (e) => {
        e.preventDefault();
        setError([]);

        dispatch({type: FETCH_USER});
        const response = await fetch('http://127.0.0.1:8000/api/login', {
            method: 'POST',
            headers: {'Content-Type': 'application/json', 'X-Requested-With': 'XMLHttpRequest'},
            credentials: 'include',
            body: JSON.stringify({
                email,
                password,
            }),
        });

        const content = await response.json();
        if(response.status === 401){
            dispatch({type: FETCH_USER_FAILURE, payload: content.message});
            setError(content.message.toString());
        } else {
            // fetchUser();
            dispatch(GetUserByCookie());
            setRedirect(true);
        }

        // if(content.message) {
        //     setError(error.error=true, content.message);
        //     console.log(error.text, content.message)
        // }

    }

    if(redirect){
        return <Redirect to='/home'/>
    }

    return(
        <div className="container">
            <div className="row">
                <div className="container col-sm-8 col-md-6 offset-sm-2 offset-md-3">
                    <form className="register-form" onSubmit={submit}>
                        <h2 className="text-center">Login Now</h2>
                        {
                            loading.loading
                                ?
                                <div className="loaderDiv">
                                    <div className="loader"></div>
                                </div>
                                :
                                <div></div>
                        }

                        <hr></hr>
                        {
                            error.length > 0 ?
                                <Error errorText={error}/> :
                                <div></div>
                        }
                        <div className="form-group">
                            <label>Email Address</label>
                            <input type="email" className="form-control" placeholder="Enter email" onChange={e => setEmail(e.target.value)} required></input>
                                <span className="hint alert-success">Enter you valid email id</span>
                        </div>

                        <div className="form-group">
                            <label>Password</label>
                            <input type="password" className="form-control" placeholder="Password" onChange={e => setPassword(e.target.value)} required></input>
                                <span className="hint alert-success">Password should be 8 or up chars </span>
                        </div>

                        <hr></hr>
                        <div className="form-group">
                            <div className="SubmitButtonDiv">
                                <button type="submit" className="btn btn-primary btn-lg">Sign in</button>
                            </div>
                            <div className="textReg">
                                <p className="text-center mb-0">If you dont have account <Link to="/register" className="text text-success">Sign up</Link></p>
                            </div>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    )
}

export default Login;