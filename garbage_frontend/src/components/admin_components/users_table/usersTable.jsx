import React from 'react';
import {useDispatch, useSelector} from "react-redux";
import UserTableRow from "./usersTableRow";
import {FILTER_USERS_BY_ROLE, SELECT_USERS} from "../../../store/usersDataReducer";
import {useTranslation} from "react-i18next";

const UsersTable = () => {
    const {t, i18n} = useTranslation();
    const dispatch = useDispatch();
    const users = useSelector(state => state.users.selectedUsers);

    const min = 150;
    const columnTypeToRatioMap = {
        numeric: 1,
        'text-short': 1.67,
        'text-long': 3.33,
    };

    const table = document.querySelector('table');
    const columns = [];
    let headerBeingResized;

    const onMouseMove = (e) => requestAnimationFrame(() => {

        // Calculate the desired width
        let horizontalScrollOffset = document.documentElement.scrollLeft;
        const width = (horizontalScrollOffset + e.clientX) - headerBeingResized.offsetLeft;

        // Update the column object with the new size value
        const column = columns.find(({ header }) => header === headerBeingResized);
        column.size = Math.max(min, width) + 'px'; // Enforce our minimum

        // For the other headers which don't have a set width, fix it to their computed width
        columns.forEach((column) => {
            if(column.size.startsWith('minmax')){ // isn't fixed yet (it would be a pixel value otherwise)
                column.size = parseInt(column.header.clientWidth, 10) + 'px';
            }
        });

        /*
          Update the column sizes
          Reminder: grid-template-columns sets the width for all columns in one value
        */
        table.style.gridTemplateColumns = columns
            .map(({ header, size }) => size)
            .join(' ');
    });

    const onMouseUp = () => {

        window.removeEventListener('mousemove', onMouseMove);
        window.removeEventListener('mouseup', onMouseUp);
        headerBeingResized.classList.remove('header--being-resized');
        headerBeingResized = null;
    };

    const initResize = ({ target }) => {

        headerBeingResized = target.parentNode;
        window.addEventListener('mousemove', onMouseMove);
        window.addEventListener('mouseup', onMouseUp);
        headerBeingResized.classList.add('header--being-resized');
    };

    document.querySelectorAll('th').forEach((header) => {
        const max = columnTypeToRatioMap[header.dataset.type] + 'fr';
        columns.push({
            header,
            size: `minmax(${min}px, ${max})`,
        });
        header.querySelector('.resize-handle').addEventListener('mousedown', initResize);
    });

    return(
        <div className="App">
            <button onClick={() => dispatch({type: SELECT_USERS})}>{t("admin.users.filer.all")}</button>
            <button onClick={() => dispatch({type:FILTER_USERS_BY_ROLE, payload: 'user'})}>{t("admin.users.filer.users")}</button>
            <button onClick={() => dispatch({type:FILTER_USERS_BY_ROLE, payload: 'moderator'})}>{t("admin.users.filer.moderators")}</button>
            <button onClick={() => dispatch({type:FILTER_USERS_BY_ROLE, payload: 'admin'})}>{t("admin.users.filer.admins")}</button>
            <table>
                <thead>
                <tr>
                    <th>{t("admin.users.table.id")}<span className="resize-handle"/></th>
                    <th>{t("admin.users.table.firstName")}<span className="resize-handle"/></th>
                    <th>{t("admin.users.table.lastName")}<span className="resize-handle"/></th>
                    <th>{t("admin.users.table.email")}<span className="resize-handle">/</span></th>
                    <th>{t("admin.users.table.created_at")}<span className="resize-handle"/></th>
                    <th>{t("admin.users.table.updated_at")}<span className="resize-handle"/></th>
                    <th>{t("admin.users.table.house")}<span className="resize-handle"/></th>
                    <th>{t("admin.users.table.location")}<span className="resize-handle"/></th>
                    <th>{t("admin.users.table.role")}<span className="resize-handle"/></th>
                    <th>{t("admin.users.table.edit")}<span className="resize-handle"/></th>
                    <th>{t("admin.users.table.stats")}<span className="resize-handle"/></th>
                    <th>{t("admin.users.table.delete")}<span className="resize-handle"/></th>
                </tr>
                </thead>
                <tbody>
                {
                    users.map((users) => <UserTableRow users = {users} />)
                }
                </tbody>
            </table>
        </div>
    )
}

export default UsersTable;