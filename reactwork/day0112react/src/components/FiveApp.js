import React, { useState } from 'react';
import s1 from '../images/s1.JPG';
import s2 from '../images/s2.JPG';
import s3 from '../images/s3.JPG';
import s4 from '../images/s4.JPG';
import s5 from '../images/s5.JPG';
import s6 from '../images/s6.JPG';

function FiveApp(props) {
    const [show,setShow]=useState(true);
    const [photo,setPhoto]=useState(s2);
    const [border,setBorder]=useState('inset');

    return (
        <div className='box'>
            <h3 className="alert alert-warning">FiveApp
                    <img alt="" src={s1} 
                    style={{width:'60px',float:'right'}}/>                   
            </h3>
            <div>
                <label>
                    <input type='checkbox' defaultChecked
                    onClick={(e)=>{
                        setShow(e.target.checked);
                    }}/>
                    이미지 보이기/숨기기
                </label>
                <br/><br/>
                <select className='form-select' style={{width:'200px'}}
                onChange={(e)=>{
                    setPhoto(e.target.value);
                }}>
                    <option value={s1}>영식</option>
                    <option value={s2}>영호</option>
                    <option value={s3}>옥순</option>
                    <option value={s4}>영철</option>
                    <option value={s5}>순자</option>
                </select>
                <br/><br/>
                <select className='form-select' style={{width:'200px'}}
                 onChange={(e)=>{
                    setBorder(e.target.value);
                 }}>
                    <option>inset</option>
                    <option>dotted</option>
                    <option>solid</option>
                    <option>dashed</option>
                    <option>double</option>
                    <option>groove</option>                    
                </select>
                <br/><br/>
                {
                    // show 값이 true면 이미지가 보이고,false면 안보인다
                    show &&
                    <img alt="" src={photo} style={{border:`10px ${border} gray`}}/>
                }
            </div>
        </div>
    );
}

export default FiveApp;