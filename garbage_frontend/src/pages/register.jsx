import React, {useState}from 'react';
import Error from "../components/error";
import  "./css files/register.css"
import {Link, Redirect} from "react-router-dom";

function Register(){
    const [first_name, setFirstName] = useState('');
    const [last_name, setLastName] = useState('');
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');

    const[redirect, setRedirect] = useState(false);

    const [error, setError] = useState([]);

    const submit = async (e) => {
        e.preventDefault();

        setError([]);

        const response = await fetch('http://127.0.0.1:8000/api/register', {
            method: 'POST',
            headers: {'Content-Type': 'application/json', 'X-Requested-With': 'XMLHttpRequest'},
            body: JSON.stringify({
                first_name,
                last_name,
                email,
                password,
            }),
        });
        const content = await response.json();


        if(response.status === 422){
            for (let key in content.errors) {
                setError(error => [...error, content.errors[key].toString()]);
            }
        } else {
            setRedirect(true);
        }
    }

    if(redirect){
        return <Redirect to='/login'/>
    }

    return(
        <div className="container">
            <div className="row">
                <div className="container col-sm-8 col-md-6 offset-sm-2 offset-md-3">
                    <form className="register-form regg" onSubmit={submit}>
                        <h2 className="text-center">Register Now</h2>
                        <hr/>
                        {
                            error.map((errorText) => <Error errorText = {errorText} />)
                        }
                        <div className="containerFLname">
                            <div className="form-group">
                                <label>First Name</label>
                                <input type="text" className="form-control" placeholder="First Name" onChange={e => setFirstName(e.target.value)}/>
                                <span className="hint alert-success">Password should be 8 or up chars </span>
                            </div>
                            <div className="form-group">
                                <label>Last Name</label>
                                <input type="text" className="form-control" placeholder="Last Name" onChange={e => setLastName(e.target.value)}/>
                                <span className="hint alert-success">Password should be 8 or up chars </span>
                            </div>
                        </div>

                        <div className="form-group">
                            <label>Email Address</label>
                            <input type="email" className="form-control" placeholder="Enter email" onChange={e => setEmail(e.target.value)}/>
                            <span className="hint alert-success">Enter you valid email id</span>
                        </div>
s
                        <div className="form-group">
                            <label>Password</label>
                            <input type="password" className="form-control" placeholder="Password" onChange={e => setPassword(e.target.value)}/>
                            <span className="hint alert-success">Password should be 8 or up chars </span>
                        </div>

                        <hr/>

                        <div className="form-group">
                            <div className="SubmitButtonDiv">
                                <button type="submit" className="btn1 btn-primary btn-lg">Sign in</button>
                            </div>
                            <div className="textReg">
                                <p className="text-center mb-0">Have an account? <Link to="/login" className="text text-success">Sign in</Link></p>
                            </div>
                        </div>

                    </form>
                </div>
            </div>
        </div>

    )
}

export default Register;