import React, {useState} from "react";
import Error from "./error";
import {garbageType, setGarbageTitle} from "./constants";
import {GetContainers, GetHistory, GetHistoryForUser} from "../store/thunks";
import {useDispatch} from "react-redux";
import Success from "./success";

const ThrowOut = () => {
    const dispatch = useDispatch();
    const [garbageID, setGarbageID] = useState(garbageType.glass);
    const [errors, setErrors] = useState([]);
    const [success, setSuccess] = useState(false);
    const [price, setPrice] = useState(0);

    const AddRecord = async () => {
        setErrors([]);
        setSuccess(false);
        let weight = document.getElementById("weight").value;

        const body = {garbageID, weight};
        const response = await fetch('http://127.0.0.1:8000/api/history/create', {
            method: 'POST',
            headers: {'Content-Type': 'application/json', 'X-Requested-With': 'XMLHttpRequest',},
            credentials: 'include',
            body: JSON.stringify(body),
        });
        const content = await response.json();
        if(response.status === 200){
            setSuccess(true);
            setPrice(content.message.sum);
            dispatch(GetHistoryForUser());
        } else if(response.status === 422){
            for (let key in content.errors) {
                setErrors(error => [...error, content.errors[key].toString()]);
            }
        } else if(response.status === 400){
            setErrors(error => [...error, content.errors.toString()]);
        }
    }
    return(
        <div className="ThrowWrapper">
            <div className="modal__content ThrowWindow">
                <h3>Thow out garbage</h3>
                {
                    errors.map((errorText) => <Error errorText = {errorText} />)
                }
                {
                    success ? <Success price={price} /> : false
                }
                <hr/>
                <div className="form-group-container">
                    <label>Garbage</label>
                    <select className="form-select" aria-label="Default select example">
                        <option selected onClick={() => setGarbageID(garbageType.glass)}>{setGarbageTitle(garbageType.glass)}</option>
                        <option onClick={() => setGarbageID(garbageType.paper)}>{setGarbageTitle(garbageType.paper)}</option>
                        <option onClick={() => setGarbageID(garbageType.organic)}>{setGarbageTitle(garbageType.organic)}</option>
                    </select>
                </div>
                <div className="form-group-container">
                    <label>weight</label>
                    <input id="weight" type="number" className="form-control" />
                </div>
                <hr/>
                <button type="button" className="btn btn-primary" onClick={AddRecord}>Save</button>
            </div>
        </div>
    )
}

export default ThrowOut;