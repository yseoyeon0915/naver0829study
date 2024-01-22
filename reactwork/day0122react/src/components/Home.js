import React from 'react';
import img1 from '../image/s3.JPG';

const Home = () => {
    return (
        <div>
            <img alt='' src={img1}/>
            <h4 className='alert alert-danger'>
                오늘(2024-01-22) 공부할 내용<br/>
                1.useCallback
                2.useMemo
                3.useReducer
                4.useContext
                5.SweetAlert
            </h4>
        </div>
    );
};

export default Home;