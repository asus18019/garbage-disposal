import React, {useEffect} from 'react';
import UsersTable from "../components/admin components/usersTable";
import {useDispatch, useSelector} from "react-redux";
import HouseTable from "../components/admin components/houseTable";
import {GetHouses, GetUsers} from "../store/userAC";
import {SET_PAGE} from "../store/pageReducer";
import EditUser from "../components/editUser";

const Admin = () => {

    const dispatch = useDispatch();
    const user = useSelector(state => state.register);
    const page = useSelector(state => state.page);

    useEffect(() => {
            dispatch(GetUsers());
            dispatch(GetHouses());
            }, []
    )

    const setContent = () => {
        switch (page.page) {
            case 'Home':
                return <div>Hello {user.user.first_name}</div>;
            case 'Users' || 'Admins':
                return <UsersTable page = {page} />;
            case 'Houses':
                return <HouseTable />;
            case 'UserEdit':
                return <EditUser />;
            default:
                return ;
        }
    }

    const content = setContent();

    return(
        <div className="App">
            <div className="container11">
                <div className="div11">
                    <div id="menu" className="sidemenu">
                        <a href='#' onClick={() => dispatch({type: SET_PAGE, payload: 'Home'})}>Home</a>
                        <a href='#' onClick={() => dispatch({type: SET_PAGE, payload: 'Users'})}>Users</a>
                        <a href='#' onClick={() => dispatch({type: SET_PAGE, payload: 'Houses'})}>Houses</a>
                        <a href='#' onClick={() => console.log('LOGIN')}>Login</a>
                    </div>
                </div>
                <div className="content">
                    {
                        content
                    }
                </div>
            </div>
        </div>
    )
}

export default Admin;