import React from 'react';
import { OneApp } from './OneApp';//default 없이 export한경우
import TwoApp from './TwoApp';
import ThreeApp from './ThreeApp';
import FourApp from './FourApp';
import FiveApp from './FiveApp';
//import OneApp from './OneApp';//default 로 export 한경우

function MainApp(props) {
    return (
        <div>
           {/* <OneApp/> */}
           {/* <TwoApp/> */}
           {/* <ThreeApp/> */}
           {/* <FourApp/> */}
           <FiveApp/>
        </div>
    );
}

export default MainApp;