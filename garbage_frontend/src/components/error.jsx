import React from "react";
import {connect} from 'react-redux';

const Error = (props) => {
        return(
            <div className="form-group">
                <div className="alert alert-danger" role="alert">
                    <li key={props.errorText}>{[props.errorText]}</li>
                </div>
            </div>
        )
}

// const mapStateToProps = state => {
//     console.log(state);
//     return {
//         syncError: state.error.er
//     };
// }

export  default connect(null, null)(Error);