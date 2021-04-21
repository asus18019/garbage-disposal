import React from 'react';
import {useDispatch} from "react-redux";
import {SET_INDEX, SET_PAGE} from "../../../store/pageReducer";

const HouseStatsRow = (props) => {
    const dispatch = useDispatch();

    const OpenUserInfo = () => {
        dispatch({type: SET_INDEX, payload: props.user.userID});
        dispatch({type: SET_PAGE, payload: 'UserStats'});
    }

    return(
        <tr className="UsersInHouseRow" onClick={OpenUserInfo} key={props.user.userID}>
            <td>{props.user.first_name}</td>
            <td>{props.user.last_name}</td>
            <td>{props.user.email}</td>
        </tr>
    )
}

export default HouseStatsRow;