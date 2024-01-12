import React, {useState } from 'react';
import s3 from '../images/s3.JPG';

function ThreeApp(props) {
    const [irum,setIrum]=useState('유서연');
    const [spring,setSpring]=useState(80);
    const [react,setReact]=useState(100);

    const inputStyle = {
        marginLeft: '10px'
    }

    const resultStyle={
        position:'absolute',
        left:'300px',
        top:'90px'
    }
    return (
        <div className='box'>
             <h3 className="alert alert-info">ThreeApp
                    <img alt="" src={s3} 
                    style={{width:'60px',float:'right'}}/>                   
            </h3>
            <div style={{width:'200px'}}>
                <div className='input-group'>
                    <h4>이름 </h4>
                    <input type='text' className='form-control'
                    style={inputStyle}
                    value={irum}
                    onChange={(e)=>{
                        setIrum(e.target.value);
                    }}/>
                </div>
                <div className='input-group'>
                    <h4>스프링점수 </h4>
                    <input type='text' className='form-control'
                    style={inputStyle}
                    value={spring}
                    onChange={(e)=>{
                        setSpring(Number(e.target.value));//숫자타입으로 변환해서 넣기
                    }}/>
                </div>
                <div className='input-group'>
                    <h4>리액트점수 </h4>
                    <input type='text' className='form-control'
                    style={inputStyle}
                    value={react}
                    onChange={(e)=>{
                        setReact(Number(e.target.value));
                    }}/>
                </div>
            </div>

            <div style={resultStyle}>
                이 름 : {irum}<br/>
                스프링 점수 : {spring}점<br/>
                리액트점수 : {react}점<br/>
                총 점 : {spring+react}점<br/>
                평 균 : {(spring+react)/2}점<br/>
                {/* 평균이 90이상은 '장학생' 나머지는 : '노력' */}
                등 급 : {(spring+react)/2>=90?"장학생":"노력"}
            </div>
        </div>
        
    );
}

export default ThreeApp;
