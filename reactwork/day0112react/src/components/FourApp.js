import React, { useState } from 'react';
import s4 from '../images/s4.JPG';

function FourApp(props) {
    const [fname,setFname]=useState('Single Day');
    const [fsize,setFsize]=useState('20px');
    const [fcolor,setFcolor]=useState('blue');

    //이벤트들
    //글자색 변경하는 이벤트
    const changeFontColor=(e)=>{
        setFcolor(e.target.value);

    }
    return (
        <div className='box'>
            <h3 className='alert alert-danger'>FourApp
                <img alt="" src={s4}
                style={{width:'60px',float:'right'}}></img>
            </h3>
            <div style={{fontFamily:fname,fontSize:fsize,color:fcolor}}>
                오늘은 즐거운 금요일!!
            </div>
            <div style={{marginTop:'10px'}}>
                <label>
                    <input type='radio' name='fcolor' dafaultValue={'red'}
                    onClick={changeFontColor}/>빨강
                </label>
                <label style={{marginLeft:'10px'}}>
                    <input type='radio' name='fcolor' dafaultValue={'blue'}
                    defaultChecked onClick={changeFontColor}/>파랑
                </label>
                <label style={{marginLeft:'10px'}}>
                    <input type='radio' name='fcolor' dafaultValue={'green'}
                    onClick={changeFontColor}/>초록
                </label>
                <label style={{marginLeft:'10px'}}>
                    <input type='radio' name='fcolor' dafaultValue={'magenta'}
                    onClick={changeFontColor}/>분홍
                </label>
            </div>

            <div style={{marginTop:'10px'}}>
                <label>
                    <input type='radio' name='fname' dafaultValue={'Gamja Flower'}/>Gamja Flower
                </label>
                <label style={{marginLeft:'10px'}}>
                    <input type='radio' name='fname' dafaultValue={'Single Day'}
                    defaultChecked/>Single Day
                </label>
                <label style={{marginLeft:'10px'}}>
                    <input type='radio' name='fname' dafaultValue={'Lobster'}/>Lobster
                </label>
                <label style={{marginLeft:'10px'}}>
                    <input type='radio' name='fname' dafaultValue={'Jua'}/>Jua
                </label>
            </div>

            <div style={{marginTop:'10px'}}>
                <label>
                    <input type='radio' name='fsize' dafaultValue={'13px;'}/>아주 작게
                </label>
                <label style={{marginLeft:'10px'}}>
                    <input type='radio' name='fsize' dafaultValue={'20px'}
                    defaultChecked/>작게
                </label>
                <label style={{marginLeft:'10px'}}>
                    <input type='radio' name='fsize' dafaultValue={'30px'}/>크게
                </label>
                <label style={{marginLeft:'10px'}}>
                    <input type='radio' name='fsize' dafaultValue={'40px'}/>아주크게
                </label>
            </div>
        </div>
        
    );
}

export default FourApp;