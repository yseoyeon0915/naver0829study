import { Alert } from '@mui/material';
import axios from 'axios';
import React, { useEffect, useState } from 'react';
import FourGuestRowItem from './FourGuestRowItem';
import Pagination from './Pagination';

const FiveApp = () => {
    const [guestList,setGuestList]=useState([]);
    const [limit, setLimit] = useState(2);
	const [page, setPage] = useState(1);
	const offset = (page - 1) * limit;


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
            <Alert severity='success' variant='filled'>
                <h3>FiveApp</h3>               
            </Alert>
            <h6><b>총 {guestList.length}개의 방명록글이 있습니다</b></h6>
            <label className='input-group' style={{width:'300px'}}>
            페이지 당 표시할 게시물 수:&nbsp;
            <select
                className='form-select'               
                type="number"
                value={limit}
                onChange={(e) => setLimit(Number(e.target.value))}>
                    <option>2</option>
                    <option>3</option>
                    <option>4</option>
                    <option>5</option>               
            </select>            
            </label>           
            {
                guestList.slice(offset, offset + limit).map((item,idx)=>(
                   <FourGuestRowItem key={idx} item={item}
                     onDelete={onDelete}/>                    
                ))
            }
            <footer>
                <Pagination
                    total={guestList.length}
                    limit={limit}
                    page={page}
                    setPage={setPage}
                />
          </footer>
        </div>
    );
};

export default FiveApp;