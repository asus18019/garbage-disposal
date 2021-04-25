import React, {useState} from "react";
import { setGarbageTitle } from "./constants"
import Error from "./error";
import {useDispatch} from "react-redux";
import {DELETE_CONTAINER} from "../store/containersReducer";
import {GetContainers} from "../store/thunks";
import {useTranslation} from "react-i18next";

const ContainerEditRow = (props) => {
    const {t, i18n} = useTranslation();
    const dispatch = useDispatch();
    const id = props.container.garbage_houseID;
    const [errors, setErrors] = useState([]);

    const DeleteContainer = async () => {
        const garbageID = props.container.garbageID;
        const body = {garbageID};
        const response = await fetch('http://127.0.0.1:8000/api/container/remove', {
            method: 'DELETE',
            headers: {'Content-Type': 'application/json', 'X-Requested-With': 'XMLHttpRequest',},
            credentials: 'include',
            body: JSON.stringify(body),
        });
        const content = await response.json();
        if(response.status === 200){
            dispatch({type:DELETE_CONTAINER, payload: props.container.garbage_houseID}) //todo needs fixes
            alert('deleted');
            // dispatch(GetContainers());
        } else {
            for (let key in content.errors) {
                setErrors(error => [...error, content.errors[key].toString()]);
            }
        }
    }

    const EditContainer = async () => {
        setErrors([]);
        const garbageID = props.container.garbageID;
        const currentFullness = document.getElementById("container_current_f" + id).value;
        const maxFullness = document.getElementById("container_max_f" + id).value;
        const export_price = document.getElementById("container_export_p" + id).value;
        const recycling_price = document.getElementById("container_recycling_p" + id).value;
        const houseID = props.container.houseID;

        const body = {garbageID, currentFullness, maxFullness, export_price, recycling_price, houseID};

        Object.keys(body).forEach(key => {
            if (body[key] === '' || key[key] === null) {
                delete body[key];
            }
        });

        const response = await fetch('http://127.0.0.1:8000/api/house/containers/update', {
            method: 'PUT',
            headers: {'Content-Type': 'application/json', 'X-Requested-With': 'XMLHttpRequest',},
            credentials: 'include',
            body: JSON.stringify(body),
        });
        const content = await response.json();
        if(response.status === 200){
            alert('updated')
            dispatch(GetContainers());
        } else {
            for (let key in content.errors) {
                setErrors(error => [...error, content.errors[key].toString()]);
            }
        }
    }
    return(
        <div>
            {
                errors.map((errorText) => <Error errorText = {errorText} />)
            }
            <div className="ContainerToContainer">
                <div className="containerFLname houseEdit">
                    <div className="form-group">
                        <label>ID</label>
                        <input disabled="disabled" id={"container_id" + id} type="text" className="form-control" defaultValue={props.container.garbage_houseID} />
                    </div>
                    <div className="form-group">
                        <label>{t("admin.houses.stats.container.type")}</label>
                        <input disabled="disabled" id={"container_type" + id} type="text" className="form-control" defaultValue={setGarbageTitle(props.container.garbageID)} />
                    </div>
                    <div className="form-group">
                        <label>{t("admin.houses.stats.container.current_fullness")} {t("admin.users.edit.kg")}</label>
                        <input id={"container_current_f" + id} type="text" className="form-control" defaultValue={props.container.currentFullness} />
                    </div>
                    <div className="form-group">
                        <label>{t("admin.houses.stats.container.max_fullness")} {t("admin.users.edit.kg")}</label>
                        <input id={"container_max_f" + id} type="text" className="form-control" defaultValue={props.container.maxFullness} />
                    </div>
                </div>

                <div className="containerFLname houseEdit">
                    <div className="form-group">
                        <label>{t("admin.houses.stats.container.export_price")} {t("admin.users.edit.grn.kg")}</label>
                        <input id={"container_export_p" + id} type="text" className="form-control" defaultValue={props.container.export_price} />
                    </div>
                    <div className="form-group">
                        <label>{t("admin.houses.stats.container.recycling_price")} {t("admin.users.edit.grn.kg")}</label>
                        <input id={"container_recycling_p" + id} type="text" className="form-control" defaultValue={props.container.recycling_price} />
                    </div>
                    <div className="form-group">
                        <br/>
                        <button onClick={EditContainer} type="button" className="btn btn-success btnChangeContainer">Save</button>
                    </div>
                    <div className="form-group">
                        <br/>
                        <button type="button" className="btn btn-success btnChangeContainer" onClick={DeleteContainer}>Delete</button>
                    </div>
                </div>
            </div>
            <hr />
        </div>
    )
}

export default ContainerEditRow;