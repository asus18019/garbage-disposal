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
import AdminWelcome from "../components/admin_components/adminWelcome";
import ImportExport from "../components/admin_components/importExport";

const Admin = () => {
    const {t, i18n} = useTranslation();
    const dispatch = useDispatch();
    const user = useSelector(state => state.register);
    const page = useSelector(state => state.page.page);

    useEffect(() => {
            dispatch(GetUsers());
            dispatch(GetHouses());
            dispatch(GetHistory());
            dispatch(GetContainers());
            }, []
    )

    const setContent = () => {
        switch (page) {
            case 'Home':
                return <AdminWelcome user = {user} />;
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
            case 'ImportExport':
                return <ImportExport />
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
                        <Link onClick={() => dispatch({type: SET_PAGE, payload: 'ImportExport'})}>Import/Export</Link>
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