import React from "react";
import {useTranslation} from "react-i18next";

const AdminWelcome = (props) => {
    const {t, i18n} = useTranslation();
    return(
        <div className="welcome_admin">
            <div className="alert alert-info" role="alert">
                <h4>{t("hello")} {props.user.user.first_name} {props.user.user.last_name}</h4>
            </div>
        </div>
    )
}

export default AdminWelcome;