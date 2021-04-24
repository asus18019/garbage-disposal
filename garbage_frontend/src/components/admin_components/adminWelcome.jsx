import React from "react";

const AdminWelcome = (props) => {
    return(
        <div className="welcome_admin">
            <div className="alert alert-info" role="alert">
                Hello {props.user.user.first_name}
            </div>
        </div>
    )
}

export default AdminWelcome;