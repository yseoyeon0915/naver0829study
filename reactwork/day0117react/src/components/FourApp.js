import { Alert } from '@mui/material';
import React, { useEffect, useState } from 'react';
import FourGuestForm from './FourGuestForm';
import axios from 'axios';
import FourGuestRowItem from './FourGuestRowItem';

const FourApp = () => {
    const [guestList,setGuestList]=useState([]);

    //저장함수
    const onGuestSave=(data)=>{//data에는 닉네임과 글이들어있음
        axios.post("/guest/insert",data)
        .then(res=>{
            //추가 성공후 목록 다시 출력
            list();
        })
    }

    //목록 출력하는 함수
    const list=()=>{
        axios.get("/guest/list")
        .then(res=>{
            setGuestList(res.data);
        })
    }

    //처음 시작시 목록 출력
    useEffect(()=>{
        list();
    },[]);//처음 한번만 호출

    //삭제함수
    const onDelete=(gnum)=>{
        axios.delete("/guest/delete?gnum="+gnum)
        .then(res=>{
            //삭제후 목록 다시 출력
            list();
        })
    }
    return (
        <div>
            <Alert severity='primary' variant='filled'>
                <h3>FourApp-guest DB</h3>               
            </Alert>
            <FourGuestForm onSave={onGuestSave}/>
            <hr/>
            <h6><b>총 {guestList.length}개의 방명록글이 있습니다</b></h6>
            {
                guestList.map((item,idx)=>(
                    <FourGuestRowItem key={idx} item={item}
                     onDelete={onDelete}/>
                ))
            }
        </div>
    );
};

export default FourApp;