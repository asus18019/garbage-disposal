import React from "react";
import { setGarbageTitle } from "../../constants";
import {useTranslation} from "react-i18next";

const ContainerRow = (props) => {
    const {t, i18n} = useTranslation();
    return(
        <tr className="UsersInHouseRow">
            <td>{props.container.garbage_houseID}</td>
            <td>{setGarbageTitle(props.container.garbageID)}</td>
            <td>{props.container.currentFullness} {t("admin.users.edit.kg")}</td>
            <td>{props.container.maxFullness} {t("admin.users.edit.kg")}</td>
            <td>{props.container.export_price} {t("admin.users.edit.grn.kg")}</td>
            <td>{props.container.recycling_price} {t("admin.users.edit.grn.kg")}</td>
        </tr>
    )
}

export default ContainerRow;