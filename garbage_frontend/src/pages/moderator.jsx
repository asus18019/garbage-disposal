import React, {useEffect} from 'react';
import {Link} from "react-router-dom";
import {SET_PAGE} from "../store/pageReducer";
import {useDispatch, useSelector} from "react-redux";
import AdminWelcome from "../components/admin_components/adminWelcome";
import {useTranslation} from "react-i18next";
import UsersTable from "../components/admin_components/users_table/usersTable";
import {GetHistory, GetUsersInHouse, GetModeratorHouse, GetContainers} from "../store/thunks";
import UserEdit from "../components/userEdit";
import UserStats from "../components/userStats";
import HouseTable from "../components/admin_components/houses_table/houseTable";
import HouseEdit from "../components/houseEdit";
import HouseStats from "../components/admin_components/houseStats/houseStats";
import ThrowOut from "../components/throwOutGarbage";

const Moderator = () => {
    const {t, i18n} = useTranslation();
    const dispatch = useDispatch();
    const user = useSelector(state => state.register);
    const page = useSelector(state => state.page.page);

    useEffect(() => {
        dispatch(GetUsersInHouse());
        dispatch(GetHistory());
        dispatch(GetModeratorHouse());
        dispatch(GetContainers());
    },[])

    const setContent = () => {
        switch (page) {
            case 'Home':
                return <AdminWelcome user = {user} />;
            case 'Users':
                return <UsersTable />;
            case 'UserEdit':
                return <UserEdit />;
            case 'UserStats':
                return <UserStats />;
            case 'Houses':
                return <HouseTable />;
            case 'HouseEdit':
                return <HouseEdit />;
            case 'HouseStats':
                return <HouseStats />
            case 'ThrowOut':
                return <ThrowOut />
            default:
                return;
       }
    }
    return(
        <div className="App">
            <div className="container11">
                <div className="div11">
                    <div id="menu" className="sidemenu">
                        <Link onClick={() => dispatch({type: SET_PAGE, payload: 'Home'})}>{t("admin.menu.home")}</Link>
                        <Link onClick={() => dispatch({type: SET_PAGE, payload: 'Users'})}>{t("admin.menu.users")}</Link>
                        <Link onClick={() => dispatch({type: SET_PAGE, payload: 'Houses'})}>{t("admin.menu.houses")}</Link>
                        <Link onClick={() => dispatch({type: SET_PAGE, payload: 'ThrowOut'})}>{t("thrownoutgarbage.title")}</Link>
                        {/*<Link onClick={() => dispatch({type: SET_PAGE, payload: 'ImportExport'})}>Import/Export</Link>*/}
                    </div>
                </div>
                <div className="content">
                    {
                        setContent()
                    }
                </div>
            </div>
        </div>
    )
}

export default Moderator;