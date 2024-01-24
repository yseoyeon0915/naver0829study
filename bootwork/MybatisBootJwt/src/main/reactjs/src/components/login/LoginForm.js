import axios from 'axios';
import React, { useEffect, useState } from 'react';
import Swal from 'sweetalert2';

const LoginForm = () => {
    const [myid,setMyid]=useState('');
    const [pass,setPass]=useState('');
    const [token,setToken]=useState(null);

    useEffect(()=>{
        let session_token=sessionStorage.token;
        console.log(session_token);
        setToken(session_token);

    },[]);//처음 시작시 한번만 호출

    const buttonLoginEvent = () =>{
        axios.post("/login/auth",{myid,pass})
        .then(res=>{
            if(res.data.result==='noid'){
                Swal.fire("회원 아이디가 아닙니다");
            } else if (res.data.result==='nopass'){
                Swal.fire("비밀번호가 맞지 않습니다");
            } else{
                //토근을 얻어서 세션 스토리지에 token이라는 이름으로 저장한다
                sessionStorage.token=res.data.token;
                setToken(res.data.token);
            }
        })
    }

    return (
        <div>
            {
                token==null?
                <div>
                    <h4 className='alert alert-dnager'>로그인 폼</h4>
                    <table className='table table-bordered' style={{width:'250px'}}>
                        <tbody>
                            <tr>
                                <th width={100} style={{backgroundColor:'#ccc'}}>아이디</th>
                                <td>
                                    <input type='text' className='form-control'
                                    value={myid} onChange={(e)=>setMyid(e.target.value)}/>
                                </td>
                            </tr>
                            <tr>
                                <th width={100} style={{backgroundColor:'#ccc'}}>비밀번호</th>
                                <td>
                                    <input type='password' className='form-control'
                                    value={pass} onChange={(e)=>setPass(e.target.value)}/>
                                </td>
                            </tr>
                            <tr>
                                <td colSpan={2} align='center'>
                                    <button type='button' className='btn btn-outline-success'
                                    onClick={buttonLoginEvent}>
                                        회원 로그인
                                    </button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                :
                <div>
                    <h4 className='alert alert-dnager'>로그인 중입니다</h4>
                    <br/><br/>
                    <img alt='' src={require("../../image/05.png")}/>
                    <br/><br/>
                    <button type='button' className='btn btn-danger'
                    onClick={()=>{
                        sessionStorage.removeItem("token");
                        setToken(null);
                        setMyid('');
                        setPass('');
                    }}>로그아웃</button>
                </div>
            }
        </div>
    );
};

export default LoginForm;