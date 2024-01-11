import React from "react";
import './MyStyle.css';
import s5 from './s5.JPG';
import s10 from './s10.JPG';

let FirstComponent=()=>{

    return (
        <div className="box">
            <h3 className="alert alert-danger">FirstComponent 컴포넌트</h3>
            <h6>public의 이미지 나타내기</h6>
            {/*public 이미지는 직접 경로로 지정해야함-권장안함*/}
            <img alt="" src="./s3.JPG" 
            style={{border:'3px solid pink',width:'100px'}}/>
            <h6>src의 이미지 나타내기</h6>
            <img alt="" src={s5}
            style={{border:'3px solid pink',width:'100px'}}/>

            <img alt="" src={s10}
            style={{border:'3px solid pink',width:'100px',marginLeft:'10px'}}/>
        </div>
    )
}

export default FirstComponent;