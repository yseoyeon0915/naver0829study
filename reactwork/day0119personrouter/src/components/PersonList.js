import { Alert, Button } from '@mui/material';
import axios from 'axios';
import React, { useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import PersonRowItem from './PersonRowItem';

const PersonList = () => {
    const [list,setList]=useState([]);

    const navi=useNavigate();

    const personList=()=>{
        axios.get("/person/list")
        .then(res=>{
            setList(res.data);
        })
    }

    //삭제
    const onPersonDelete=(pnum)=>{
        const url="/person/delete?pnum="+pnum;
        axios.delete(url)
        .then(res=>{
            //삭제후 목록 다시 출력
            personList();
        })
    }
    useEffect(()=>{
        personList();
    },[]);

    return (
        <div className='mainbox'>
            <Button color='success' variant='outlined'
            onClick={()=>navi("/writeform")}>멤버추가</Button>
            <br/><br/>
            <Alert variant='filled' severity='info'>
                Person 멤버 목록
            </Alert>
            <h5><b>총 {list.length}명의 회원정보가 있습니다</b></h5>
            <table className='table table-bordered'>
                <thead>
                    <tr>
                        <th style={{width:'80px',backgroundColor:'orange'}}>번호</th>
                        <th style={{width:'300px',backgroundColor:'orange'}}>회원명</th>
                        <th style={{width:'120px',backgroundColor:'orange'}}>삭제</th>                        
                    </tr>
                </thead>
                <tbody>
                {
                    list &&
                    list.map((row,idx)=>(
                        <PersonRowItem key={idx} row={row} idx={idx}
                         onDelete={onPersonDelete}/>
                    ))
                }
                </tbody>
            </table>
        </div>
    );
};

export default PersonList;