import { Add, ArrowBackRounded, ArtTrack} from '@mui/icons-material';
import { Alert } from '@mui/material';
import axios from 'axios';
import React, { useEffect, useState } from 'react';
import { useNavigate, useParams } from 'react-router-dom';

const UpdatePersonForm = () => {
    const {pnum}=useParams();
    const navi=useNavigate();
    const [selectData,setSelectData]=useState({});

    //pnum 에 대한 dto 를 얻어서 selectData 에 넣는다
    const getSelectData=()=>{
        const url="/person/select?pnum="+pnum;
        axios.get(url)
        .then(res=>{
            setSelectData(res.data);
        })
    }

    const changeData=(e)=>{
        const {name,value}=e.target;
        setSelectData({
            ...selectData,
            [name]:value
          }
        )
    }
    //처음 로딩시 딱 한번 호출
    useEffect(()=>{
        getSelectData();
    },[]);

     //수정 버튼
     const updateDataEvent=()=>{
        //axios 를 이용해서 데이타 전송후 목록으로 이동
        axios.post("/person/update",selectData)
        .then(res=>{
            //수정성공후 디테일로 이동
            navi(`/detail/${pnum}`);
        })
    }
    return (
        <div className='mainbox'>
            <Alert variant='filled' severity='primary'>
                Person 멤버 수정
            </Alert>
            
            <div style={{marginTop:'20px'}}>
                <table className='table table-bordered'>
                    <tbody>
                        <tr>
                            <th style={{width:'100px',backgroundColor:'#ccc'}}>
                                이름
                            </th>
                            <td>
                                <input type='text' value={selectData.name}
                                style={{width:'150px'}}
                                className='form-control'
                                name='name'
                                onChange={changeData}/>
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
                                value={selectData.age}
                                name='age'
                                onChange={changeData}/>
                            </td>
                        </tr>
                        <tr>
                            <th style={{width:'100px',backgroundColor:'#ccc'}}>
                                혈액형
                            </th>
                            <td>
                                <select className='form-select'
                                style={{width:'150px'}}
                                name="blood"
                                value={selectData.blood}
                                onChange={changeData}>
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
                                {
                                    selectData.photo
                                    &&
                                    <img alt='' src={require(`../images/${selectData.photo}`)}
                                style={{width:'80px',marginRight:'10px'}}/>
                                }
                                <select className='form-select'
                                style={{width:'150px',height:'40px'}}
                                name='photo'
                                value={selectData.photo}
                                onChange={changeData}>
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
                                onClick={updateDataEvent}>
                                    <Add/>
                                    <span style={{marginLeft:'10px'}}>수정</span>
                                </button>

                                <button className='btn btn-outline-secondary'
                                style={{marginLeft:'10px'}}
                                onClick={()=>navi(-1)}>
                                    <ArrowBackRounded/>
                                    <span style={{marginLeft:'10px'}}>이전</span>
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

export default UpdatePersonForm;