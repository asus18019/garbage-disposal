import React, {useEffect} from 'react';
import UsersTable from "../components/admin_components/users_table/usersTable";
import {useDispatch, useSelector} from "react-redux";
import HouseTable from "../components/admin_components/houses_table/houseTable";
import {GetHistory, GetHouses, GetUsers, GetContainers} from "../store/thunks";
import {SET_PAGE} from "../store/pageReducer";
import UserEdit from "../components/userEdit";
import UserStats from "../components/userStats";
import {useTranslation} from "react-i18next";
import {Link} from 'react-router-dom';
import HouseEdit from "../components/houseEdit";
import HouseStats from "../components/admin_components/houseStats/houseStats";

const Admin = () => {
    const {t, i18n} = useTranslation();
    const dispatch = useDispatch();
    const user = useSelector(state => state.register);
    const page = useSelector(state => state.page);

    useEffect(() => {
            dispatch(GetUsers());
            dispatch(GetHouses());
            dispatch(GetHistory());
            dispatch(GetContainers());
            }, []
    )

    const setContent = () => {
        switch (page.page) {
            case 'Home':
                return <div className="welcome_admin">
                    <div className="alert alert-info" role="alert">
                        Hello {user.user.first_name}
                    </div></div>;
            case 'Users':
                return <UsersTable />;
            case 'Houses':
                return <HouseTable />;
            case 'UserEdit':
                return <UserEdit />;
            case 'UserStats':
                return <UserStats />;
            case 'HouseEdit':
                return <HouseEdit />;
            case 'HouseStats':
                return <HouseStats />
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
                        <Link onClick={() => dispatch({type: SET_PAGE, payload: 'Home'})}>{t("admin.menu.home")}</Link>
                        <Link onClick={() => dispatch({type: SET_PAGE, payload: 'Users'})}>{t("admin.menu.users")}</Link>
                        <Link onClick={() => dispatch({type: SET_PAGE, payload: 'Houses'})}>{t("admin.menu.houses")}</Link>
                        <Link onClick={() => console.log('LOGIN')}>Login</Link>
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