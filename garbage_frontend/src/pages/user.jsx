import React, {useEffect} from 'react';
import {Link} from "react-router-dom";
import {SET_INDEX, SET_PAGE} from "../store/pageReducer";
import {useDispatch, useSelector} from "react-redux";
import AdminWelcome from "../components/admin_components/adminWelcome";
import UsersTable from "../components/admin_components/users_table/usersTable";
import UserEdit from "../components/userEdit";
import UserStats from "../components/userStats";
import {useTranslation} from "react-i18next";
import {GetHistoryForUser, GetAuthUser} from "../store/thunks";
import ThrowOut from "../components/throwOutGarbage";


const User = () => {
    const {t, i18n} = useTranslation();
    const dispatch = useDispatch();
    const user = useSelector(state => state.register);
    const page = useSelector(state => state.page.page);

    useEffect(() => {
        dispatch(GetHistoryForUser());
        dispatch(GetAuthUser());
    })

    const setContent = () => {
        switch (page) {
            case 'Home':
                return <AdminWelcome user = {user} />;
            case 'UserEdit':
                return <UserEdit />;
            case 'UserStats':
                return <UserStats />;
            case 'ThrowOut':
                return <ThrowOut />
            default:
                return;
        }
    }

    const setUser = () => {
        dispatch({type: SET_PAGE, payload: 'UserStats'});
        dispatch({type: SET_INDEX, payload: user.user.id});
    }
    return(
        <div className="App">
            <div className="container11">
                <div className="div11">
                    <div id="menu" className="sidemenu">
                        <Link onClick={() => dispatch({type: SET_PAGE, payload: 'Home'})}>{t("admin.menu.home")}</Link>
                        <Link onClick={setUser}>{t("user.mystats")}</Link>
                        <Link onClick={() => dispatch({type: SET_PAGE, payload: 'ThrowOut'})}>{t("thrownoutgarbage.title")}</Link>
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

export default User;