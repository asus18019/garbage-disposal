import React from "react";
import {SET_PAGE} from "../../../store/pageReducer";
import {useDispatch, useSelector} from "react-redux";
import HouseStatsRow from "./houseStatsRow";
import ContainerRow from "./containerRow";

const HouseStats = () => {
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
                        <h2 className="text-center">House Stats</h2>
                        <hr/>
                        <div className="containerFLname">
                            <div className="form-group">
                                <label>ID</label>
                                <input type="text" disabled="disabled" className="form-control" defaultValue={house.houseID} />
                            </div>
                            <div className="form-group">
                                <label>Title</label>
                                <input type="text" disabled="disabled" className="form-control" defaultValue={house.houseTitle} />
                            </div>

                            <div className="form-group">
                                <label>Location</label>
                                <textarea disabled="disabled" className="form-control" defaultValue={house.location} />
                            </div>
                        </div>

                        <div className="form-group">
                            <label>Description</label>
                            <textarea disabled="disabled" className="form-control" defaultValue={house.description} />
                        </div>

                        <hr/>

                        <div className="containerFLname">
                            <div className="form-group">
                                <label>Created</label>
                                <input type="text" disabled="disabled" className="form-control" defaultValue={house.created_at.substring(2, 16).replace('T',' ')} />
                            </div>
                            <div className="form-group">
                                <label>Updated</label>
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
                                        <th className="userRow1">Type<span className="resize-handle"/></th>
                                        <th className="userRow1">Current fullness<span className="resize-handle"/></th>
                                        <th className="userRow1">Max fullness<span className="resize-handle"/></th>
                                        <th className="userRow1">Export<span className="resize-handle"/></th>
                                        <th className="userRow1">Recycling<span className="resize-handle"/></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    {
                                        containers.map((container) => <ContainerRow container={container} />)
                                    }
                                    </tbody>
                                </table>
                                :
                                <div> There are not containers</div>

                        }

                        <hr />

                        {
                            users.length > 0 ?
                                <div>
                                    <div className="containerFLname">
                                        <div className="form-group">
                                            <label>Count of people</label>
                                            <input type="text" disabled="disabled" className="form-control" value={users.length} />
                                        </div>
                                    </div>
                                    <table className="UsersInHouseTable">
                                        <thead>
                                        <tr>
                                            <th className="userRow1">First Name<span className="resize-handle"/></th>
                                            <th className="userRow1">Last Name<span className="resize-handle"/></th>
                                            <th className="userRow1">Email<span className="resize-handle"/></th>
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
                                <div>no users in that house</div>
                        }
                        <hr/>

                        <div className="form-group">
                            <div className="textReg">
                                <p onClick={() => dispatch({type:SET_PAGE, payload: 'Houses'})} className="text-center mb-0 btu">Back to users</p>
                            </div>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    )
}

export default HouseStats;