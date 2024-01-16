import { Button } from '@mui/material';
import React from 'react';

function FourChildApp(props) {
    const {name,age,addr}=props;//읽기전용, 출력만 가능하며 수정은 불가능
    return (
        <div>
            <div className='box'>
                {/* {props.name}님의 나이는  {props.age}이며 고향은 {props.addr}입니다 */}
                {name}님의 나이는 {age}이며 고향은 {addr}입니다
                <Button color='info' variant='contained'
                style={{marginLeft:'10px'}} size="small"
                onClick={()=>props.incre()}>증가</Button>
            </div>
        </div>
    );
}

export default FourChildApp;