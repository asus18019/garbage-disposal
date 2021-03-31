import React, {useState} from 'react';
import {Link, Redirect} from 'react-router-dom';
import Error from "../components/error";
import {useDispatch, useSelector} from "react-redux";
import {ADD_ERROR, ADD_TEXT, REMOVE_ERROR, REMOVE_USER} from "../store/registerReducer";
import  "./css files/login.css"

const Login = () => {
    const dispatch = useDispatch();
    const users = useSelector(state => state.register.users)


    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    const [redirect, setRedirect] = useState(false);
    const [error, setError] = useState({error: false, text: 'some message'});

    const submit = async (e) => {
        e.preventDefault();
        const response = await fetch('http://127.0.0.1:8000/api/login', {
            method: 'POST',
            headers: {'Content-Type': 'application/json',
                    'X-Requested-With': 'XMLHttpRequest',},
            credentials: 'include',
            body: JSON.stringify({
                email,
                password,
            }),
        });

        const content = await response.json();

        if(content.message) {
            setError(error.error=true, content.message);
            console.log(error.text, content.message)
        }

        setRedirect(true);

        if(redirect){
            return <Redirect to="/home"/>
        }

        //const content = await response.json();
        // console.log(content);
    }

    const ChT = () => dispatch({type: ADD_ERROR})

    const ChF = () => dispatch({type: REMOVE_ERROR})

    const NewUser = (name) => {
        const user = {
            name: name,
            id: Date.now(),
        }
        dispatch({type: ADD_TEXT, payload: user})
    }

    const RemoveUSER = (user) => {
        dispatch({type: REMOVE_USER, payload: user.id})
    }

    return(
        <div className="container">
            <div className="row">
                <div className="container col-sm-8 col-md-6 offset-sm-2 offset-md-3">
                    <form className="register-form">
                        <h2 className="text-center">Login Now</h2>
                        <hr></hr>
                        <div className="form-group">
                            <label>Email Address</label>
                            <input type="email" className="form-control" placeholder="Enter email"></input>
                                <span className="hint alert-success">Enter you valid email id</span>
                        </div>

                        <div className="form-group">
                            <label>Password</label>
                            <input type="password" className="form-control" placeholder="Password"></input>
                                <span className="hint alert-success">Password should be 8 or up chars </span>
                        </div>
                        <div className="form-group">
                            <div className="alert alert-danger" role="alert">
                                A simple danger alert—check it out!
                            </div>
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

        // <div className="App">
        //     <div className="form">
        //         <form className="form-horizontal" onSubmit={submit}>
        //             <div className="form-group">
        //                 <div className="form-group">
        //                     <Error problems ={error} />
        //                     <label className="col-sm-2 control-label">Email</label>
        //                     <div className="col-sm-10">
        //                         <input type="text" className="form-control" placeholder="Логин" name="login" required
        //                                onChange={e => setEmail(e.target.value)}/>
        //                     </div>
        //                 </div>
        //             <div className="form-group">
        //                     <label className="col-sm-2 control-label">Пароль</label>
        //                     <div className="col-sm-10">
        //                         <input type="password" className="form-control" placeholder="Пароль" name="password"
        //                                onChange={e => setPassword(e.target.value)}/>
        //                     </div>
        //                 </div>
        //                 <div className="form-group">
        //                     <div className="col-sm-offset-2 col-sm-10">
        //                         <button type="submit" className="btn btn-default btn-sm btn btn-success">Войти</button>
        //                     </div>
        //                 </div>
        //             </div>
        //         </form>
        //
        //         <button onClick={ChT} type="submit" className="btn btn-default">Make TRUE</button>
        //         <button onClick={ChF} type="submit" className="btn btn-default">Make FALSE</button>
        //         <hr/>
        //         <button onClick={() => NewUser(prompt())} type="submit" className="btn btn-default">New User</button>
        //         <hr/>
        //         <div>
        //             {
        //                 users.length > 0 ?
        //                     <div>
        //                         {users.map(user => <div onClick={() => RemoveUSER(user)}>{user.name} + {user.id}</div>)}
        //                     </div> :
        //                     <div>Нет пользователей</div>
        //             }
        //         </div>
        //     </div>
        // </div>
    )
}

export default Login;