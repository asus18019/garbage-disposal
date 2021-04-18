import React, {useEffect, useState} from "react";
import {useDispatch, useSelector} from "react-redux";
import { garbageType } from "./constants";
import {SET_PAGE} from "../store/pageReducer";

const UserStats = () => {
    const dispatch = useDispatch();
    const users = useSelector(state => state.users.users);
    const index = useSelector(state => state.page.selectedIndex);
    const userArray = users.filter(word => word.userID === index);
    const user = userArray[0];
    const historyArray = useSelector(state => state.users.history);
    const history = historyArray.filter(record => record.userID === index);

    const [totalWeight, setTotalWeight] = useState(0);
    const [glass, setGlass] = useState(0);
    const [paper, setPaper] = useState(0);
    const [organic, setOrganic] = useState(0);
    const [unsorted, setUnsorted] = useState(0);

    useEffect(() => {
        let glass_l = 0, paper_l = 0, organic_l = 0, totalWeight_l = 0, unsorted_l = 0;
        for(let i = 0; i < history.length; i++) {
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
    }, [])

    return (
        <div>
            <div className="row">
                <div className="container col-sm-8 col-md-6 offset-sm-2 offset-md-3">
                    <form className="register-form regg1">
                        <h2 className="text-center">User stats</h2>
                        <hr/>
                        <div className="containerFLname">
                            <div className="form-group">
                                <label>First Name</label>
                                <input id="input_f_n" type="text" disabled="disabled" className="form-control" defaultValue={user.first_name}/>
                            </div>
                            <div className="form-group">
                                <label>Last Name</label>
                                <input id="input_l_n" type="text" disabled="disabled" className="form-control" defaultValue={user.last_name}/>
                            </div>

                            <div className="form-group">
                                <label>Role</label>
                                <input id="input_houseID" type="text" disabled="disabled" className="form-control" defaultValue={user.name}/>
                            </div>
                        </div>

                        <div className="containerFLname">
                            <div className="form-group">
                                <label>Email Address</label>
                                <textarea id="input_l_n" disabled="disabled" className="form-control" defaultValue={user.email}/>
                            </div>
                            <div className="form-group">
                                <label>Registered</label>
                                <input id="input_e" type="email" disabled="disabled" className="form-control" defaultValue={user.created_at.substring(2, 16).replace('T',' ')}/>
                            </div>
                            <div className="form-group">
                                <label>Updated</label>
                                <input id="input_e" type="email" disabled="disabled" className="form-control" defaultValue={user.updated_at.substring(2, 16).replace('T',' ')}/>
                            </div>
                        </div>

                        <hr/>

                        <div className="containerFLname">
                            <div className="form-group">
                                <label>House</label>
                                <input id="input_f_n" type="text" disabled="disabled" className="form-control" defaultValue={user.houseTitle}/>
                            </div>
                            <div className="form-group">
                                <label>Location</label>
                                <textarea id="input_l_n" disabled="disabled" className="form-control" defaultValue={user.location}/>
                            </div>

                            <div className="form-group">
                                <label>House ID</label>
                                <input id="input_houseID" type="text" disabled="disabled" className="form-control" defaultValue={user.houseID}/>
                            </div>
                        </div>

                        <hr/>

                        <h5>Выброшено за все время</h5>
                        <div className="containerFLname">
                            <div className="form-group">
                                <label>Glass</label>
                                <input id="input_f_n" type="text" disabled="disabled" className="form-control" value={glass + " kg"}/>
                            </div>
                            <div className="form-group">
                                <label>Paper</label>
                                <input id="input_l_n" type="text" disabled="disabled" className="form-control" value={paper + " kg"}/>
                            </div>
                            <div className="form-group">
                                <label>Organic</label>
                                <input id="input_houseID" type="text" disabled="disabled" className="form-control" value={organic + " kg"}/>
                            </div>
                            <div className="form-group">
                                <label>Unsorted</label>
                                <input id="input_houseID" type="text" disabled="disabled" className="form-control"  value={unsorted + " kg"}/>
                            </div>
                        </div>
                        <div className="containerFLname">
                            <div className="form-group">
                                <label>Total</label>
                                <input id="input_f_n" type="text" disabled="disabled" className="form-control" value={totalWeight + " kg"}/>
                            </div>
                        </div>

                        <hr/>

                        <div className="form-group">
                            <div className="textReg">
                                <p onClick={() => dispatch({type:SET_PAGE, payload: 'Users'})} className="text-center mb-0 btu">Back to users</p>
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