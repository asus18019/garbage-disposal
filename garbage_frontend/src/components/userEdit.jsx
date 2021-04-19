import React, {useState} from 'react';
import {SET_PAGE} from "../store/pageReducer";
import {useDispatch, useSelector} from "react-redux";
import Error from "./error";
import {useTranslation} from "react-i18next";

const UserEdit = () => {
    const {t, i18n} = useTranslation();
    const [errors, setErrors] = useState([]);

    const deleteUser = async () => {
        setErrors([]);
        const first_name = document.getElementById("input_f_n").value;
        const last_name = document.getElementById("input_l_n").value;
        const email = document.getElementById("input_e").value;
        const houseID = document.getElementById("input_houseID").value;
        const userID = (users.filter(word => word.userID === index))[0].userID;

            const response = await fetch('http://127.0.0.1:8000/api/users/user/update', {
                method: 'PUT',
                headers: {'Content-Type': 'application/json', 'X-Requested-With': 'XMLHttpRequest',},
                credentials: 'include',
                body: JSON.stringify({
                    userID,
                    first_name,
                    last_name,
                    houseID,
                    email,
                }),
            });
            const content = await response.json();
            if(response.status === 200){
                dispatch({type:SET_PAGE, payload: 'Users'})
            } else {
                for (let key in content.errors) {
                    setErrors(error => [...error, content.errors[key].toString()]);
                }
            }

    }
    const dispatch = useDispatch();
    const users = useSelector(state => state.users.users);
    const index = useSelector(state => state.page.selectedIndex);

    return(
        <div className="App">{}
            <div className="row">
                <div className="container col-sm-8 col-md-6 offset-sm-2 offset-md-3">
                    <form className="register-form regg">
                        <h2 className="text-center">{t("admin.users.edit.title")}</h2>
                        <hr/>
                        {
                            errors.map((errorText) => <Error errorText = {errorText} />)
                        }
                        <div className="containerFLname">
                            <div className="form-group">
                                <label>{t("registerform.firstName")}</label>
                                <input id="input_f_n" type="text" className="form-control" placeholder={t("registerform.firstName")} defaultValue={
                                    (users.filter(word => word.userID === index))[0].first_name
                                }/>
                                <span className="hint alert-success">Password should be 8 or up chars </span>
                            </div>
                            <div className="form-group">
                                <label>{t("registerform.lastName")}</label>
                                <input id="input_l_n" type="text" className="form-control" placeholder={t("registerform.lastName")} defaultValue={
                                    (users.filter(word => word.userID === index))[0].last_name
                                }/>
                                <span className="hint alert-success">Password should be 8 or up chars </span>
                            </div>

                            <div className="form-group">
                                <label>{t("admin.users.edit.houseID")}</label>
                                <input id="input_houseID" type="text" className="form-control" placeholder="Last Name" defaultValue={
                                    (users.filter(word => word.userID === index))[0].houseID
                                }/>
                                <span className="hint alert-success">Password should be 8 or up chars </span>
                            </div>
                        </div>

                        <div className="form-group">
                            <label>{t("loginform.email")}</label>
                            <input id="input_e" type="email" className="form-control" placeholder="Enter email" defaultValue={
                                (users.filter(word => word.userID === index))[0].email
                            }/>
                            <span className="hint alert-success">Enter you valid email id</span>
                        </div>

                        <div className="form-group">
                            <label>{t("loginform.password")}</label>
                            <input type="password" className="form-control" placeholder={t("loginform.enter.email")}/>
                            <span className="hint alert-success">Password should be 8 or up chars </span>
                        </div>

                        <hr/>

                        <div className="form-group">
                            <div className="SubmitButtonDiv">
                                <button onClick={deleteUser} type="submit" className="btn1 btn-primary btn-lg">{t("admin.users.edit.submit")}</button>
                            </div>
                            <div className="textReg">
                                <p onClick={() => dispatch({type:SET_PAGE, payload: 'Users'})} className="text-center mb-0 btu">{t("admin.backtousersButton")}</p>
                            </div>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    )
}

export default UserEdit;