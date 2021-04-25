import React, {useEffect, useState} from "react";
import {useDispatch, useSelector} from "react-redux";
import { garbageType } from "./constants";
import {SET_PAGE} from "../store/pageReducer";
import {useTranslation} from "react-i18next";

const UserStats = () => {
    const {t, i18n} = useTranslation();
    const dispatch = useDispatch();
    const users = useSelector(state => state.users.users);
    const index = useSelector(state => state.page.selectedIndex);
    const userArray = users.filter(word => word.userID || word.id === index);
    const user = userArray[0];
    const historyArray = useSelector(state => state.users.history);
    const history = historyArray.filter(record => record.userID === index);
    const authUser = useSelector(state => state.register.role)

    const [totalWeight, setTotalWeight] = useState(0);
    const [glass, setGlass] = useState(0);
    const [paper, setPaper] = useState(0);
    const [organic, setOrganic] = useState(0);
    const [unsorted, setUnsorted] = useState(0);
    const [sum, setSum] = useState(0);

    const SetPage = () => {
        if(authUser === 'user') {
            dispatch({type:SET_PAGE, payload: 'Home'})
        } else {
            dispatch({type:SET_PAGE, payload: 'Users'})
        }
    }

    useEffect(() => {
        let glass_l = 0, paper_l = 0, organic_l = 0, totalWeight_l = 0, unsorted_l = 0, sum_l = 0;
        for(let i = 0; i < history.length; i++) {
            sum_l += history[i].sum
            totalWeight_l += history[i].weight;
            if(history[i].garbageID === garbageType.glass){
                glass_l += history[i].weight;
            } else if (history[i].garbageID === garbageType.paper){
                paper_l += history[i].weight;
            } else if (history[i].garbageID === garbageType.organic){
                organic_l += history[i].weight;
            } else if (history[i].garbageID === garbageType.unsorted){
                unsorted_l += history[i].weight;
            }
        }
        setGlass(glass_l);
        setPaper(paper_l);
        setOrganic(organic_l);
        setUnsorted(unsorted_l);
        setTotalWeight(totalWeight_l);
        setSum(sum_l);
    })

    return (
        <div>
            <div className="row">
                <div className="container col-sm-8 col-md-6 offset-sm-2 offset-md-3">
                    <form className="register-form regg1">
                        <h2 className="text-center">{t("userStats.title")}</h2>
                        <hr/>
                        <div className="containerFLname">
                            <div className="form-group">
                                <label>{t("registerform.firstName")}</label>
                                <input id="input_f_n" type="text" disabled="disabled" className="form-control" defaultValue={user.first_name}/>
                            </div>
                            <div className="form-group">
                                <label>{t("registerform.lastName")}</label>
                                <input id="input_l_n" type="text" disabled="disabled" className="form-control" defaultValue={user.last_name}/>
                            </div>

                            <div className="form-group">
                                <label>{t("admin.users.table.role")}</label>
                                <input id="input_houseID" type="text" disabled="disabled" className="form-control" defaultValue={user.name}/>
                            </div>
                        </div>

                        <div className="containerFLname">
                            <div className="form-group">
                                <label>{t("loginform.email")}</label>
                                <textarea id="input_l_n" disabled="disabled" className="form-control" defaultValue={user.email}/>
                            </div>
                            <div className="form-group">
                                <label>{t("admin.users.table.created_at")}</label>
                                <input id="input_e" type="email" disabled="disabled" className="form-control" defaultValue={user.created_at.substring(2, 16).replace('T',' ')}/>
                            </div>
                            <div className="form-group">
                                <label>{t("admin.users.table.updated_at")}</label>
                                <input id="input_e" type="email" disabled="disabled" className="form-control" defaultValue={user.updated_at.substring(2, 16).replace('T',' ')}/>
                            </div>
                        </div>

                        <hr/>

                        <div className="containerFLname">
                            <div className="form-group">
                                <label>{t("admin.users.table.house")}</label>
                                <input id="input_f_n" type="text" disabled="disabled" className="form-control" defaultValue={user.houseTitle}/>
                            </div>
                            <div className="form-group">
                                <label>{t("admin.users.table.location")}</label>
                                <textarea id="input_l_n" disabled="disabled" className="form-control" defaultValue={user.location}/>
                            </div>

                            <div className="form-group">
                                <label>{t("admin.users.edit.houseID")}</label>
                                <input id="input_houseID" type="text" disabled="disabled" className="form-control" defaultValue={user.houseID}/>
                            </div>
                        </div>

                        <hr/>

                        <h5>{t("userStats.thrown")}</h5>
                        <div className="containerFLname">
                            <div className="form-group">
                                <label>{t("userStats.glass")}</label>
                                <input id="input_f_n" type="text" disabled="disabled" className="form-control" value={glass + " kg"}/>
                            </div>
                            <div className="form-group">
                                <label>{t("userStats.paper")}</label>
                                <input id="input_l_n" type="text" disabled="disabled" className="form-control" value={paper + " kg"}/>
                            </div>
                            <div className="form-group">
                                <label>{t("userStats.organic")}</label>
                                <input id="input_houseID" type="text" disabled="disabled" className="form-control" value={organic + " kg"}/>
                            </div>
                            <div className="form-group">
                                <label>{t("userStats.unsorted")}</label>
                                <input id="input_houseID" type="text" disabled="disabled" className="form-control"  value={unsorted + " kg"}/>
                            </div>
                        </div>
                        <div className="containerFLname">
                            <div className="form-group">
                                <label>{t("userStats.total")}</label>
                                <input id="input_f_n" type="text" disabled="disabled" className="form-control" value={totalWeight + " kg"}/>
                            </div>
                            <div className="form-group">
                            <label>Total SUM</label>
                            <input id="input_f_n" type="text" disabled="disabled" className="form-control" value={sum + " grn"}/>
                        </div>
                        </div>

                        <hr/>

                        <div className="form-group">
                            <div className="textReg">
                                <p onClick={SetPage} className="text-center mb-0 btu">{t("admin.backtousersButton")}</p>
                            </div>
                        </div>

                    </form>
                </div>
            </div>
            {/*<div className="container">*/}
            {/*    <div className="userStats">*/}
            {/*        <label>User</label>*/}
            {/*        <div className="Info">*/}
            {/*            <div className="result-block">*/}
            {/*                <span>User ID</span>*/}
            {/*                <h4>1.897</h4>*/}
            {/*            </div>*/}
            {/*            <div className="result-block">*/}
            {/*                <span>First Name</span>*/}
            {/*                <h4>Mike</h4>*/}
            {/*            </div>*/}
            {/*            <div className="result-block">*/}
            {/*                <span>Last Name</span>*/}
            {/*                <h4>Jefferson</h4>*/}
            {/*            </div>*/}
            {/*            <div className="result-block">*/}
            {/*                <span>Email</span>*/}
            {/*                <h4>mike.jf@gmail.com</h4>*/}
            {/*            </div>*/}
            {/*        </div>*/}
            {/*        <div className="Info userDates">*/}
            {/*            <div className="result-block">*/}
            {/*                <span>Registered at</span>*/}
            {/*                <h4>2021-04-14 16:44</h4>*/}
            {/*            </div>*/}
            {/*            <div className="result-block">*/}
            {/*                <span>Updated at</span>*/}
            {/*                <h4>2021-04-14 16:44</h4>*/}
            {/*            </div>*/}
            {/*        </div>*/}
            {/*        <hr></hr>*/}
            {/*        <label>Garbage</label>*/}
            {/*        <div className="Info userDates">*/}
            {/*            <div className="result-block">*/}
            {/*                <span>Registered at</span>*/}
            {/*                <h4>2021-04-14 16:44</h4>*/}
            {/*            </div>*/}
            {/*            <div className="result-block">*/}
            {/*                <span>Updated at</span>*/}
            {/*                <h4>2021-04-14 16:44</h4>*/}
            {/*            </div>*/}
            {/*        </div>*/}
            {/*    </div>*/}
            {/*</div>*/}
        </div>
    )
}

export default UserStats;