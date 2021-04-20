import React, {useEffect} from 'react';
import UsersTable from "../components/admin components/usersTable";
import {useDispatch, useSelector} from "react-redux";
import HouseTable from "../components/admin components/houseTable";
import {GetHistory, GetHouses, GetUsers} from "../store/thunks";
import {SET_PAGE} from "../store/pageReducer";
import UserEdit from "../components/userEdit";
import UserStats from "../components/userStats";
import {useTranslation} from "react-i18next";
import {Link} from 'react-router-dom';
import HouseEdit from "../components/houseEdit";

const Admin = () => {
    const {t, i18n} = useTranslation();
    const dispatch = useDispatch();
    const user = useSelector(state => state.register);
    const page = useSelector(state => state.page);

    useEffect(() => {
            dispatch(GetUsers());
            dispatch(GetHouses());
            dispatch(GetHistory());
            }, []
    )

    const setContent = () => {
        switch (page.page) {
            case 'Home':
                return <div>Hello {user.user.first_name}</div>;
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