import { Add, ArtTrack } from '@mui/icons-material';
import { Alert, Button } from '@mui/material';
import axios from 'axios';
import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';

const PersonForm = () => {
    const [name,setName]=useState('');
    const [age,setAge]=useState('');
    const [blood,setBlood]=useState('A');
    const [photo,setPhoto]=useState('1.jpg');

    const navi=useNavigate();
    
    //추가 버튼
    const addDataEvent=()=>{
        //axios 를 이용해서 데이타 전송후 목록으로 이동
        axios.post("/person/add",{name,age,photo,blood})
        .then(res=>{
            //추가성공후 목록으로 이동
            navi("/");
        })
    }
    return (
        <div className='mainbox'>
            <Alert variant='filled' severity='warning'>
                Person 멤버 등록
            </Alert>
            <div style={{marginTop:'20px'}}>
                <table className='table table-bordered'>
                    <tbody>
                        <tr>
                            <th style={{width:'100px',backgroundColor:'#ccc'}}>
                                이름
                            </th>
                            <td>
                                <input type='text' value={name}
                                style={{width:'150px'}}
                                className='form-control'
                                onChange={(e)=>setName(e.target.value)}/>
                            </td>
                        </tr>
                        <tr>
                            <th style={{width:'100px',backgroundColor:'#ccc'}}>
                                나이
                            </th>
                            <td>
                                <input type='text'
                                style={{width:'150px'}}                               
                                className='form-control'
                                value={age}
                                onChange={(e)=>setAge(e.target.value)}/>
                            </td>
                        </tr>
                        <tr>
                            <th style={{width:'100px',backgroundColor:'#ccc'}}>
                                혈액형
                            </th>
                            <td>
                                <select className='form-select'
                                 style={{width:'150px'}}
                                 onChange={(e)=>setBlood(e.target.value)}>
                                    <option>A</option>
                                    <option>B</option>
                                    <option>O</option>
                                    <option>AB</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th style={{width:'100px',backgroundColor:'#ccc'}}>
                                사진
                            </th>
                            <td className='input-group'>
                                <img alt='' src={require(`../images/${photo}`)}
                                 style={{width:'80px',marginRight:'10px'}}/>
                                <select className='form-select'
                                 style={{width:'150px',height:'40px'}}
                                 onChange={(e)=>setPhoto(e.target.value)}>
                                 {
                                    [...new Array(20)].map((a,idx)=>
                                    (<option>{idx+1}.jpg</option>))
                                 }   
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td colSpan={2} align='center'>
                                <button className='btn btn-outline-secondary'
                                onClick={addDataEvent}>
                                    <Add/>
                                    <span style={{marginLeft:'10px'}}>추가</span>
                                </button>

                                <button className='btn btn-outline-secondary'
                                 style={{marginLeft:'10px'}}
                                 onClick={()=>navi("/")}>
                                    <ArtTrack/>
                                    <span style={{marginLeft:'10px'}}>목록</span>
                                </button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    );
};

export default PersonForm;