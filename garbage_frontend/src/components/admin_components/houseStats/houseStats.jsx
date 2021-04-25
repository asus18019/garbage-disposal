import React from "react";
import {SET_PAGE} from "../../../store/pageReducer";
import {useDispatch, useSelector} from "react-redux";
import HouseStatsRow from "./houseStatsRow";
import ContainerRow from "./containerRow";
import {useTranslation} from "react-i18next";

const HouseStats = () => {
    const {t, i18n} = useTranslation();
    const index = useSelector(state => state.page.selectedIndex);
    const house = useSelector(state => state.houses.houses.filter(house => house.houseID === index)[0]);
    const users = useSelector(state => state.users.users.filter(user => user.houseID === index));
    const containers = useSelector(state => state.containers.containers.filter(container => container.houseID === index));
    const dispatch = useDispatch();
    return(
        <div className="App">
            <div className="row">
                <div className="container col-sm-8 col-md-6 offset-sm-2 offset-md-3">
                    <form className="register-form regg1">
                        <h2 className="text-center">{t("admin.houses.stats.title")}</h2>
                        <hr/>
                        <div className="containerFLname">
                            <div className="form-group">
                                <label>{t("admin.houses.stats.house_id")}</label>
                                <input type="text" disabled="disabled" className="form-control" defaultValue={house.houseID} />
                            </div>
                            <div className="form-group">
                                <label>{t("admin.houses.stats.house_title")}</label>
                                <input type="text" disabled="disabled" className="form-control" defaultValue={house.houseTitle} />
                            </div>

                            <div className="form-group">
                                <label>{t("admin.houses.stats.location")}</label>
                                <textarea disabled="disabled" className="form-control" defaultValue={house.location} />
                            </div>
                        </div>

                        <div className="form-group">
                            <label>{t("admin.houses.stats.description")}</label>
                            <textarea disabled="disabled" className="form-control" defaultValue={house.description} />
                        </div>

                        <hr/>

                        <div className="containerFLname">
                            <div className="form-group">
                                <label>{t("admin.houses.stats.created_at")}</label>
                                <input type="text" disabled="disabled" className="form-control" defaultValue={house.created_at.substring(2, 16).replace('T',' ')} />
                            </div>
                            <div className="form-group">
                                <label>{t("admin.houses.stats.updated_at")}</label>
                                <input disabled="disabled" className="form-control" defaultValue={house.updated_at.substring(2, 16).replace('T',  ' ')} />
                            </div>
                        </div>

                        <hr/>
                        {
                            containers.length > 0 ?
                                <table className="ContainerInHouse">
                                    <thead>
                                    <tr>
                                        <th className="userRow1">ID<span className="resize-handle"/></th>
                                        <th className="userRow1">{t("admin.houses.stats.container.type")}<span className="resize-handle"/></th>
                                        <th className="userRow1">{t("admin.houses.stats.container.current_fullness")}<span className="resize-handle"/></th>
                                        <th className="userRow1">{t("admin.houses.stats.container.max_fullness")}<span className="resize-handle"/></th>
                                        <th className="userRow1">{t("admin.houses.stats.container.export_price")}<span className="resize-handle"/></th>
                                        <th className="userRow1">{t("admin.houses.stats.container.recycling_price")}<span className="resize-handle"/></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    {
                                        containers.map((container) => <ContainerRow container={container} />)
                                    }
                                    </tbody>
                                </table>
                                :
                                <div>{t("admin.houses.stats.no_container")}</div>

                        }

                        <hr />

                        {
                            users.length > 0 ?
                                <div>
                                    <div className="containerFLname">
                                        <div className="form-group">
                                            <label>{t("admin.houses.stats.countofpeope")}</label>
                                            <input type="text" disabled="disabled" className="form-control" value={users.length} />
                                        </div>
                                    </div>
                                    <table className="UsersInHouseTable">
                                        <thead>
                                        <tr>
                                            <th className="userRow1">{t("registerform.firstName")}<span className="resize-handle"/></th>
                                            <th className="userRow1">{t("registerform.lastName")}<span className="resize-handle"/></th>
                                            <th className="userRow1">{t("admin.users.table.email")}<span className="resize-handle"/></th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        {
                                            users.map((users) => <HouseStatsRow user = {users} />)
                                        }
                                        </tbody>
                                    </table>
                                </div>
                                :
                                <div>{t("admin.houses.stats.no_users")}</div>
                        }
                        <hr/>

                        <div className="form-group">
                            <div className="textReg">
                                <p onClick={() => dispatch({type:SET_PAGE, payload: 'Houses'})} className="text-center mb-0 btu">{t("admin.houses.edit.back")}</p>
                            </div>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    )
}

export default HouseStats;