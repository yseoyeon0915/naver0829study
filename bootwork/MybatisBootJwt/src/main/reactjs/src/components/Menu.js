import React, { useEffect, useState } from 'react';
import { NavLink } from 'react-router-dom';

const Menu = () => {
    const [loginStatus,setLoginStatus]=useState('');
    useEffect(()=>{
        if(sessionStorage.token==null)
            setLoginStatus("로그인");
        else
            setLoginStatus("로그아웃");
    });
    return (
        <div>
           <ul className='menu'>
            <li>
                <NavLink to={'/'}>홈</NavLink>    
            </li> 
            <li>
                <NavLink to={'/member/list'}>회원목록</NavLink>    
            </li> 
            <li>
                <NavLink to={'/member/form'}>회원가입</NavLink>    
            </li> 
            <li>
                <NavLink to={'/board/list'}>회원게시판</NavLink>    
            </li>
            <li>
                <NavLink to={'/login'}>{loginStatus}</NavLink>    
            </li>  
           </ul>          
        </div>
    );
};

export default Menu;