import React, {useState} from "react";

const ImportExport = () => {
    const [file, setFile] = useState(null);
    const onChangeHandler=event=>{
        setFile(event.target.files[0])
        console.log(file)
;    }
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
                <button type="button" className="btn btn-primary btn-lg" onClick={() => download()}>Export</button>
            </div>
            <div className="IEButton">
                <input type="file" onChange={onChangeHandler} />
                <button type="button" className="btn btn-primary btn-lg" onClick={onClickHandler}>Import</button>
            </div>
        </div>
    )
}

export default ImportExport;