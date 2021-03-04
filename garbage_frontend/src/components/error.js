import React from "react";

function Error (props){

        return(
            <div className="App">
                {
                    [props.errorText]
                }
            </div>
        )
}

export  default  Error;