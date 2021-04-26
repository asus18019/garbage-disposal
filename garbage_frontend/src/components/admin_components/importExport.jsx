import React, {useState} from "react";
import {useTranslation} from "react-i18next";

const ImportExport = () => {
    const {t, i18n} = useTranslation();
    const [file, setFile] = useState(null);
    const onChangeHandler=event=>{
        setFile(event.target.files[0])
        console.log(file);
    }

    const download1 = () => {
        const url = window.URL.createObjectURL(new Blob(['127.0.0.1:8000/api/export/users']));
        const link = document.createElement("a");
        link.href = url;
        link.setAttribute("download", 'users-collection.xlsx');
        document.body.appendChild(link);
        link.click();
    }
    const onClickHandler = async () => {
        const response = await fetch('http://127.0.0.1:8000/api/import/users', {
            method: 'post',
            headers: {'Content-Type': 'multipart/form-data', 'X-Requested-With': 'XMLHttpRequest',},
            credentials: 'include',
            body: file,
        });
        const content = await response.json();
        console.log(content);
    }
    const download = async () => {
        const response = await fetch('http://127.0.0.1:8000/api/export/users', {
            method: 'GET',
            headers: {'Content-Type': 'application/json', 'X-Requested-With': 'XMLHttpRequest',},
            credentials: 'include',
        });
        // const content = await response.json();
        // console.log(content)
    }
    return(
        <div className="ImportExportComponent">
            <div className="IEButton">
                <button type="button" className="btn btn-primary btn-lg" onClick={download1}>{t("export")}</button>
            </div>
            <div className="IEButton">
                <input type="file" onChange={onChangeHandler} />
                <button type="button" className="btn btn-primary btn-lg" onClick={onClickHandler}>{t("import")}</button>
            </div>
        </div>
    )
}

export default ImportExport;