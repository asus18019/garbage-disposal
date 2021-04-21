import React from "react";
import { garbageType } from "../../constants";

const ContainerRow = (props) => {
    const setGarbageTitle = (garbageID) => {
        switch (garbageID) {
            case garbageType.paper:
                return "Бумага";
            case garbageType.glass:
                return "Стекло";
            case garbageType.organic:
                return "Органические";
            default:
                return ;
        }
    }
    return(
        <tr className="UsersInHouseRow">
            <td>{props.container.garbage_houseID}</td>
            <td>{setGarbageTitle(props.container.garbageID)}</td>
            <td>{props.container.currentFullness} kg</td>
            <td>{props.container.maxFullness} kg</td>
            <td>{props.container.export_price} grn/kg</td>
            <td>{props.container.recycling_price} grn/kg</td>
        </tr>
    )
}

export default ContainerRow;