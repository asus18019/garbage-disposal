import React from "react";
import {useTranslation} from "react-i18next";

const Success = (props) => {
    const {t, i18n} = useTranslation();
    return(
        <div className="form-group">
            <div className="alert alert-primary" role="alert">
                {t("success")} <br/>
                {t("price")} {props.price} {t("admin.users.edit.grn")}
            </div>
        </div>
    )
}

export default Success;