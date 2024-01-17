import { Alert } from '@mui/material';
import axios from 'axios';
import React, { useEffect, useState } from 'react';
import ThreeCardApp from './ThreeCardApp';

const ThreeApp = () => {
    const [personList,setPersonList]=useState([]);

    const list=()=>{
        //백엔드로부터 데이타를 가져와서 배열변수에 넣기
        axios.get("/person/list")
        .then(res=>{
            setPersonList(res.data);
        })
    }

    useEffect(()=>{
        console.log("useEffect")
        list();//처음 시작시 무조건 호출
    },[]);//처음 시작시 한번만 호출

    return (
        <div>
            <Alert severity='warning' variant='filled'>
                <h3>ThreeApp-mui Card 를 이용한 목록 출력</h3> 
                {
                    personList.map((item,idx)=>(
                       <div>
                        <ThreeCardApp key={idx} item={item}/>  
                        <hr/>
                       </div>                      
                    ))
                }              
            </Alert>
        </div>
    );
};

export default ThreeApp;