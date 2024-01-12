import React, { useState } from "react";
import s8 from '../images/s8.JPG';

function TwoApp(props) {
    //함수형에서 state 변수 선언하는 방법
    const [number,setNumber]=useState(0);

    return (
        <div className="box">
                <h3 className="alert alert-success">TwoApp
                    <img alt="" src={s8} 
                    style={{width:'60px',float:'right'}}/>
                </h3>
                <div style={{fontSize:'40px', color:'red',marginLeft:'200px'}}>
                    {number}
                </div>
                <div style={{marginLeft:'130px'}}>
                    <button type="button" className="btn btn-outline-success"
                    onClick={()=>{
                        if(number===0){
                            alert("0 아래로 감소할 수 없습니다");
                            return; //함수 종료
                        }
                        setNumber(number-1);
                    }}>숫자감소</button>

                    <button type="button" className="btn btn-outline-success"
                    style={{marginLeft:'10px'}}
                    onClick={()=>{
                        if(number===10){ //==값만 비교, ===값과 타입까지 비교
                            alert("10 이상 증가할 수 없습니다");
                            return;//함수 종료
                        }
                        setNumber(number+1);
                    }}>숫자증가</button>
                </div>
        </div>
    );
}

export default TwoApp;