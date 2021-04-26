import React, {useState} from 'react';
import Error from "./error";
import {SET_PAGE} from "../store/pageReducer";
import {useDispatch, useSelector} from "react-redux";
import ContainerEditRow from "./containerEditRow";
import CreateContainer from "./createContainer";
import {GetHouses} from "../store/thunks";
import {useTranslation} from "react-i18next";

const HouseEdit = () => {
    const {t, i18n} = useTranslation();
    const [modalActive, setModalActive] = useState(false);
    const [errors, setErrors] = useState([]);
    const dispatch = useDispatch();
    const index = useSelector(state => state.page.selectedIndex);
    const house = useSelector(state => state.houses.houses.filter(house => house.houseID === index)[0]);
    const containers = useSelector(state => state.containers.containers.filter(container => container.houseID === index));

    const UpdateHouseWithParams = async () => {
        let houseID = document.getElementById("house_id").value;
        let houseTitle = document.getElementById("house_title").value;
        let location = document.getElementById("house_location").value;
        let description = document.getElementById("house_desc").value;

        const response = await fetch('http://127.0.0.1:8000/api/house/update', {
            method: 'PUT',
            headers: {'Content-Type': 'application/json', 'X-Requested-With': 'XMLHttpRequest',},
            credentials: 'include',
            body: JSON.stringify(
                {
                    houseID,
                    houseTitle,
                    location,
                    description
                }
            ),
        });
        const content = await response.json();
        if(response.status === 200){
            dispatch(GetHouses());
            dispatch({type:SET_PAGE, payload: 'Houses'});
        }
        else {
            for (let key in content.errors) {
                setErrors(error => [...error, content.errors[key].toString()]);
            }
        }
    }

    return(
        <div className="App">
            <CreateContainer active={modalActive} setActive={setModalActive} />
            <div className="row">
                <div className="container col-sm-8 col-md-6 offset-sm-2 offset-md-3">
                    <form className="register-form regg">
                        <h2 className="text-center">{t("admin.houses.edit.title1")}</h2>
                        <hr/>
                        {
                            errors.map((errorText) => <Error errorText = {errorText} />)
                        }
                        <button type="button" className="btn btn-primary" onClick={() => setModalActive(true)}>{t("admin.houses.edit.add_container")}</button>
                        <div className="containerFLname">
                            <div className="form-group">
                                <label>{t("admin.houses.edit.house_id")}</label>
                                <input disabled="disabled" id="house_id" type="text" className="form-control" defaultValue={house.houseID} />
                            </div>
                            <div className="form-group">
                                <label>{t("admin.houses.edit.title")}</label>
                                <input id="house_title" type="text" className="form-control" defaultValue={house.houseTitle} />
                            </div>
                        </div>

                        <div className="form-group">
                            <label>{t("admin.houses.edit.location")}</label>
                            <textarea id="house_location" type="text" className="form-control" defaultValue={house.location} />
                        </div>

                        <div className="form-group">
                            <label>{t("admin.houses.edit.description")}</label>
                            <textarea id="house_desc" type="email" className="form-control" defaultValue={house.description} />
                        </div>

                        <hr/>
                        {
                            containers.map((container) => <ContainerEditRow container={container} />)
                        }

                        <div className="form-group">
                            <div className="SubmitButtonDiv">
                                <button onClick={UpdateHouseWithParams} type="button" className="btn1 btn-primary btn-lg">{t("admin.houses.edit.submit")}</button>
                            </div>
                            <div className="textReg">
                                <p onClick={() => dispatch({type: SET_PAGE, payload: 'Houses'})} className="text-center mb-0 btu">{t("admin.houses.edit.back")}</p>
                            </div>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    )
}

export default HouseEdit;