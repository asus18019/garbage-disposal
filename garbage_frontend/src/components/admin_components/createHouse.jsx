import React, {useState} from "react";
import {GetHouses} from "../../store/thunks";
import {useDispatch} from "react-redux";
import Error from "../error";
import {useTranslation} from "react-i18next";

const CreateHouse = ({active, setActive}) => {
    const {t, i18n} = useTranslation();
    const dispatch = useDispatch();
    const [errors, setErrors] = useState([]);

    const AddHouse = async () => {
        let houseTitle = document.getElementById("houseTitle").value;
        let location = document.getElementById("location").value;
        let description = document.getElementById("description").value;

        const body = {houseTitle, location, description}
        const response = await fetch('http://127.0.0.1:8000/api/house/create', {
            method: 'POST',
            headers: {'Content-Type': 'application/json', 'X-Requested-With': 'XMLHttpRequest',},
            credentials: 'include',
            body: JSON.stringify(body),
        });
        const content = await response.json();
        if(response.status === 200){
            setActive(false);
            dispatch(GetHouses());
        } else if(response.status === 422) {
            for (let key in content.errors) {
                setErrors(error => [...error, content.errors[key].toString()]);
            }
        }
    }
    return(
        <div className={active ? "modalWindow active" : "modalWindow"} onClick={() => setActive(false)}>
            <div className="modal__content" onClick={e => e.stopPropagation()}>
                <h3>{t("user.houses.create.title")}</h3>
                {
                    errors.map((errorText) => <Error errorText = {errorText} />)
                }
                <hr/>
                <div className="form-group-container">
                    <label>{t("user.houses.create.title_house")}</label>
                    <input id="houseTitle" type="text" className="form-control" />
                </div>
                <div className="form-group-container">
                    <label>{t("user.houses.create.location")}</label>
                    <textarea id="location" type="text" className="form-control" />
                </div>
                <div className="form-group-container">
                    <label>{t("user.houses.create.description")}</label>
                    <textarea id="description" type="text" className="form-control" />
                </div>
                <hr/>
                <button type="button" className="btn btn-primary" onClick={AddHouse}>{t("thrownoutgarbage.submit")}</button>
            </div>
        </div>
    )
}

export default CreateHouse;