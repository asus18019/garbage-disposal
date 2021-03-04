import React, {useState} from 'react';
import {Redirect} from 'react-router-dom';
import Error from "../components/error";

const Login = () => {


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

    return(
        <div className="App">
            <div className="form">
                <form className="form-horizontal" onSubmit={submit}>
                    <div className="form-group">
                        <div className="form-group">
                            <Error problems ={error} />
                            <label for="inputEmail3" className="col-sm-2 control-label">Email</label>
                            <div className="col-sm-10">
                                <input type="text" className="form-control" placeholder="Логин" name="login" required
                                       onChange={e => setEmail(e.target.value)}/>
                            </div>
                        </div>    
                    <div className="form-group">
                            <label for="inputPassword3" className="col-sm-2 control-label">Пароль</label>
                            <div className="col-sm-10">
                                <input type="password" className="form-control" placeholder="Пароль" name="password"
                                       onChange={e => setPassword(e.target.value)}/>
                            </div>
                        </div>
                        <div className="form-group">
                            <div className="col-sm-offset-2 col-sm-10">
                                <button type="submit" className="btn btn-default btn-sm btn btn-success">Войти</button>
                            </div>
                        </div>
                    </div>  
                </form>
            </div>
        </div>
    )
}

export default Login;