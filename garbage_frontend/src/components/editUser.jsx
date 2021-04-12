import React, {useState} from 'react';
import {SET_PAGE} from "../store/pageReducer";
import {useDispatch, useSelector} from "react-redux";
import Error from "./error";

const EditUser = () => {
    const [errors, setErrors] = useState([]);

    const x = async () => {
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
                    <form className="register-form regg" onSubmit={() => x()}>
                        <h2 className="text-center">User editing</h2>
                        <hr></hr>
                        {
                            errors.map((errorText) => <Error errorText = {errorText} />)
                        }
                        <div className="containerFLname">
                            <div className="form-group">
                                <label>First Name</label>
                                <input id="input_f_n" type="text" className="form-control" placeholder="First Name" defaultValue={
                                    (users.filter(word => word.userID === index))[0].first_name
                                } ></input>
                                <span className="hint alert-success">Password should be 8 or up chars </span>
                            </div>
                            <div className="form-group">
                                <label>Last Name</label>
                                <input id="input_l_n" type="text" className="form-control" placeholder="Last Name" defaultValue={
                                    (users.filter(word => word.userID === index))[0].last_name
                                }></input>
                                <span className="hint alert-success">Password should be 8 or up chars </span>
                            </div>

                            <div className="form-group">
                                <label>House ID</label>
                                <input id="input_houseID" type="text" className="form-control" placeholder="Last Name" defaultValue={
                                    (users.filter(word => word.userID === index))[0].houseID
                                }></input>
                                <span className="hint alert-success">Password should be 8 or up chars </span>
                            </div>
                        </div>

                        <div className="form-group">
                            <label>Email Address</label>
                            <input id="input_e" type="email" className="form-control" placeholder="Enter email" defaultValue={
                                (users.filter(word => word.userID === index))[0].email
                            }></input>
                            <span className="hint alert-success">Enter you valid email id</span>
                        </div>

                        <div className="form-group">
                            <label>Password</label>
                            <input type="password" className="form-control" placeholder="Password"></input>
                            <span className="hint alert-success">Password should be 8 or up chars </span>
                        </div>

                        <hr></hr>

                        <div className="form-group">
                            <div className="SubmitButtonDiv">
                                <button type="submit" className="btn1 btn-primary btn-lg">Submit changes</button>
                            </div>
                            <div className="textReg">
                                <p onClick={() => dispatch({type:SET_PAGE, payload: 'Users'})}s className="text-center mb-0 btu">Back to users</p>
                            </div>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    )
}

export default EditUser;