import { Button } from '@mui/material';
import React, { useState } from 'react';

function FiveWriteForm({onSave}) {
    const [fname,setFname]=useState('');
    const [fphoto,setFphoto]=useState('2.jpg');
    const [fprice,setFprice]=useState(0);

    //추가 이벤트
    const onAddEvent=()=>{
        onSave({fname,fphoto,fprice});
        //초기화
        setFname('');
        setFprice(0);
    }
    return (
        <div className='input-group'>
            메뉴명:
            <input type='text'
             value={fname} onChange={(e)=>setFname(e.target.value)}
             style={{width:'80px'}}/>

            가격:
            <input type='text'
             value={fprice} onChange={(e)=>setFprice(e.target.value)}
             style={{width:'70px'}}/>

            사진:
            <select onChange={(e)=>setFphoto(e.target.value)}>
                <option value={"2.jpg"}>꼬치종류</option>
                <option value={"4.jpg"}>카레종류</option>
                <option value={"8.jpg"}>샌드위치종류</option>
                <option value={"11.jpg"}>빙수종류</option>
            </select>
            <Button color='warning' variant='outlined' size="small"
            onClick={onAddEvent}>
                추가
            </Button>
        </div>
    );
}

export default FiveWriteForm;