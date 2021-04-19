import React, {useState}from 'react';
import Error from "../components/error";
import  "./css files/register.css"
import {Link, Redirect} from "react-router-dom";
import {useTranslation} from "react-i18next";

const Register = () => {
    const {t, i18n} = useTranslation();
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
                        <h2 className="text-center">{t("registerform.title")}</h2>
                        <hr/>
                        {
                            error.map((errorText) => <Error errorText = {errorText} />)
                        }
                        <div className="containerFLname">
                            <div className="form-group">
                                <label>{t("registerform.firstName")}</label>
                                <input type="text" className="form-control" placeholder={t("registerform.enter.firstName")} onChange={e => setFirstName(e.target.value)} required/>
                                <span className="hint alert-success">Password should be 8 or up chars </span>
                            </div>
                            <div className="form-group">
                                <label>{t("registerform.lastName")}</label>
                                <input type="text" className="form-control" placeholder={t("registerform.enter.lastName")} onChange={e => setLastName(e.target.value)} required/>
                                <span className="hint alert-success">Password should be 8 or up chars </span>
                            </div>
                        </div>

                        <div className="form-group">
                            <label>{t("loginform.email")}</label>
                            <input type="email" className="form-control" placeholder={t("loginform.enter.email")} onChange={e => setEmail(e.target.value)} required/>
                            <span className="hint alert-success">Enter you valid email id</span>
                        </div>

                        <div className="form-group">
                            <label>{t("loginform.password")}</label>
                            <input type="password" className="form-control" placeholder={t("loginform.enter.password")} onChange={e => setPassword(e.target.value)} required/>
                            <span className="hint alert-success">Password should be 8 or up chars </span>
                        </div>

                        <hr/>

                        <div className="form-group">
                            <div className="SubmitButtonDiv">
                                <button type="submit" className="btn1 btn-primary btn-lg">{t("registerform.signup")}</button>
                            </div>
                            <div className="textReg">
                                <p className="text-center mb-0">{t("registerform.message")}<Link to="/login" className="text text-success">{t("registerform.link")}</Link></p>
                            </div>
                        </div>

                    </form>
                </div>
            </div>
        </div>

    )
}

export default Register;