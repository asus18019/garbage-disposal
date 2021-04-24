import React, {useState} from 'react';
import {useDispatch} from "react-redux";
import {GetContainers} from "../store/thunks";
import Error from "./error";

const CreateContainer = ({active, setActive}) => {
    const dispatch = useDispatch();
    const [errors, setErrors] = useState([]);

    const AddContainer = async () => {
        setErrors([]);
        let garbageID = document.getElementById("garbage_id").value;
        let maxFullness = document.getElementById("max_f").value;
        let export_price = document.getElementById("export_p").value;
        let recycling_price = document.getElementById("recycling_p").value;

        const body = {garbageID, maxFullness, export_price, recycling_price}
        const response = await fetch('http://127.0.0.1:8000/api/container/create', {
            method: 'POST',
            headers: {'Content-Type': 'application/json', 'X-Requested-With': 'XMLHttpRequest',},
            credentials: 'include',
            body: JSON.stringify(body),
        });
        const content = await response.json();
        if(response.status === 200){
            setActive(false);
            dispatch(GetContainers());
        } else if(response.status === 422){
            for (let key in content.errors) {
                setErrors(error => [...error, content.errors[key].toString()]);
            }
        } else if(response.status === 400){
            setErrors(error => [...error, content.errors.toString()]);
        }
    }
    return(
        <div className={active ? "modalWindow active" : "modalWindow"} onClick={() => setActive(false)}>
            <div className="modal__content" onClick={e => e.stopPropagation()}>
                <h3>Add a new container</h3>
                {
                    errors.map((errorText) => <Error errorText = {errorText} />)
                }
                <hr/>
                <div className="form-group-container">
                    <label>Garbage ID</label>
                    <input id="garbage_id" type="text" className="form-control" />
                </div>
                <div className="form-group-container">
                    <label>Max Fullness</label>
                    <input id="max_f" type="text" className="form-control" />
                </div>
                <div className="form-group-container">
                    <label>Export price</label>
                    <input id="export_p" type="text" className="form-control" />
                </div>
                <div className="form-group-container">
                    <label>Recycling price</label>
                    <input id="recycling_p" type="text" className="form-control" />
                </div>
                <hr/>
                <button type="button" className="btn btn-primary" onClick={AddContainer}>Save</button>
            </div>
        </div>
    )
}

export default CreateContainer;