import React, { useEffect, useState } from 'react';

function OneApp(props) {
    const [count,setCount]=useState(0);
    const [number,setNumber]=useState(0);
    const[message,setMessage]=useState('Input message');
    

    //count 만 증가하는 이벤트
    const increCount=()=>{
        setCount(count+1);
    }
    const increNumber=()=>{
        setNumber(number+1);
    }
    const increCountNumber=()=>{
        setCount(count+1);
        setNumber(number+1);
    }
    //useEffect
    //useEffect(()=>{
    //    console.log("처음 시작시, state 변수 변경시마다 호출");
    //}); //값 변경시 무조건 호출

    useEffect(()=>{
        console.log("count 변경시에만 호출!!!");
    },[count]);//count 변경시에만 호출

    useEffect(()=>{
        console.log("number 변경시에만 호출!!!");
    },[number]);//number 변경시에만 호출
    return (
        <div>
            <h3 className='alert alert-danger'>OneApp-useEffect 공부</h3>

            <button type='button' className='btn btn-outline-secondary'
            onClick={increCount}>
                count만 증가
            </button>
            <button type='button' className='btn btn-outline-secondary'
            onClick={increNumber}>
                number만 증가
            </button>
            <button type='button' className='btn btn-outline-secondary'
            onClick={increCountNumber}>
                count, number 모두 증가
            </button>
            <br/>
            <input type='text' value={message} onChange={(e)=>setMessage(e.target.value)}/>
            <br/>
            <b style={{fontSize:'2em'}}>count:{count}</b>
            <br/>
            <b style={{fontSize:'2em'}}>Number:{number}</b>
            <br/>
            <b style={{fontSize:'20px'}}>{message}</b>
        </div>
    );
}

export default OneApp;