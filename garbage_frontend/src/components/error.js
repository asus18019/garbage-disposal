import React from "react";
import {connect} from 'react-redux';

const Error = (props) => {

        return(
            <div className="App">
                {
                    [props.errorText]
                }
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