import React, { useEffect, useState } from 'react';
import s1 from '../images/s1.JPG';
import s4 from '../images/s4.JPG';

function TwoApp(props) {
    const [show,setShow]=useState(true);
    const [count,setCount]=useState(1);

    const clickButtonEvent=()=>{
        setCount(count+1);
        //비동기처리라 아래 코드가 먼저 호출될 수 있다
        //setShow(count%3===0? true:false);
    }

    useEffect(()=>{
        setShow(count%3===0?true:false);
    },[count]); //count 변경시 자동호출

    return (
        <div>
            <h3 className='alert alert-danger'>TwoApp-3의 배수마다 이미지 보이기/안보이기</h3>
            <button type='button' className='btn btn-danger'
            onClick={clickButtonEvent}>숫자증가</button>
            <b style={{fontSize:'4em', color:'red',marginLeft:'50px'}}>{count}</b>
            <br></br>
            {
                //show가 true이때 보이는 이미지
                show &&
                <img alt="" src={s1}/>
            }

            {
                //show가 false이때 보이는 이미지
                !show &&
                <img alt="" src={s4}/>
            }
            {/* src의 이미지를 import 없이 출력하는 방법 */}
            <img alt='' src={require('../images/s2.JPG')}/>
        </div>
    );
}

export default TwoApp;