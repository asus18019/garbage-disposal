import React from 'react';
import {useTranslation} from "react-i18next";

const Main = () => {
    const {t, i18n} = useTranslation();
    return (
        <div className="App_a">
            <div className="img_wrapper">
                <div className="content_w">
                    <div className="text1">
                        <h2>Garbage disposal</h2>
                        <h5>{t("main.text")}</h5>
                    </div>
                </div>
            </div>
        </div>
    )
}

export default Main;