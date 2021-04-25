import React from "react";

const Success = (props) => {
    return(
        <div className="form-group">
            <div className="alert alert-primary" role="alert">
                Threw out successfully <br/>
                Price: {props.price}
            </div>
        </div>
    )
}

export default Success;