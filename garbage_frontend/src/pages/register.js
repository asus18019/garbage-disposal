import React, {useState}from 'react';
import axios from 'axios';
import Error from "../components/error";

function Register(){

    const [first_name, setFirstName] = useState('');
    const [last_name, setLastName] = useState('');
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');

    const [error, setError] = useState([]);

    const submit = async (e) => {
        e.preventDefault();

        setError([])

        const response = await fetch('http://127.0.0.1:8000/api/register', {
            method: 'POST',
            headers: {'Content-Type': 'application/json'},
            body: JSON.stringify({
                first_name,
                last_name,
                email,
                password,
            }),
        });

        const content = await response.json();

        // setError(oldArray => [...oldArray, content[0].last_name.toString()]);

        if(content[0].first_name){
            setError(error => [...error, content[0].last_name.toString()]);
        }
        if(content[0].last_name){
            setError(error => [...error, content[0].last_name.toString()]);
            // setError(...error, (content[0].last_name.toString()));
        }
        if(content[0].email) {
            setError(error => [...error, content[0].email.toString()]);
            // setError(...error, (content[0].email.toString()));
        }
        if(content[0].password){
            setError(error => [...error, content[0].password.toString()]);
            // setError(...error, (content[0].password.toString()));
        }



        console.log(error);



        // const data = {
        //     first_name,
        //     last_name,
        //     email,
        //     password,
        // }

        // axios.post('http://127.0.0.1:8000/api/register', data).then(
        //     res => {
        //         console.log(res);
        //     }
        // ).catch(
        //     err => {
        //         console.log(err);
        //     }
        // )

    }

    return(
        <div className="App">
            Register
            <div className="form">
                <form className="form-horizontal" onSubmit={submit}>
                    {

                        error.map((errorText) => <Error errorText = {errorText} />)
                    }
                    <div className="form-group">
                            <label for="inputPassword3" className="col-sm-2 control-label">FirstName</label>
                            <div className="col-sm-10">
                                <input type="text" className="form-control" placeholder="First Name" onChange={e => setFirstName(e.target.value)}/>
                            </div>
                        </div>
                        <div className="form-group">
                            <label for="inputPassword3" className="col-sm-2 control-label" required>LastName</label>
                            <div className="col-sm-10">
                                <input type="text" className="form-control" placeholder="Last Name" onChange={e => setLastName(e.target.value)}/>
                            </div>
                        </div>
                        <div className="form-group">
                            <label for="inputPassword3" className="col-sm-2 control-label" required>Email</label>
                            <div className="col-sm-10">
                                <input type="text" className="form-control" placeholder="Email" onChange={e => setEmail(e.target.value)}/>
                            </div>
                        </div>
                        <div className="form-group">
                            <label for="inputPassword3" className="col-sm-2 control-label" required>Password</label>
                            <div className="col-sm-10">
                                <input type="text" className="form-control" placeholder="Password" onChange={e => setPassword(e.target.value)}/>
                            </div>
                        </div>
                        <div className="form-group">
                            <div className="col-sm-offset-2 col-sm-10">
                                <button type="submit" className="btn btn-default btn-sm btn btn-success">Регистрация</button>
                            </div>
                        </div>
                </form>
            </div>
        </div>
    )
}

export default Register;