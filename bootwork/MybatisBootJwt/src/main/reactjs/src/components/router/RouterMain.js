import React from 'react';
import '../MyStyle.css';
import Menu from '../Menu';
import { Route, Routes } from 'react-router-dom';
import Home from '../Home';
import MemberList from '../member/MemberList';
import MemberForm from '../member/MemberForm';
import BoardList from '../board/BoardList';
import LoginForm from '../login/LoginForm';
import BoardForm from '../board/BoardForm';
import BoardDetail from '../board/BoardDetail';

const RouterMain = () => {
    return (
        <div style={{margin:'30px',width:'700px'}}>
            <Menu/>
            <br  style={{clear:'both'}}/>
            <div style={{marginTop:'30px'}}>
                <Routes>
                    <Route path='/' element={<Home/>}/>

                    <Route path='/member'>
                        <Route path='list' element={<MemberList/>}/>
                        <Route path='form' element={<MemberForm/>}/>
                    </Route>

                    <Route path='/board'>
                        <Route path='list' element={<BoardList/>}/>
                        <Route path='list/:currentPage' element={<BoardList/>}/>                        
                        <Route path='form' element={<BoardForm/>}/> 
                        <Route path='select/:num' element={<BoardDetail/>}/>                      
                    </Route>

                    <Route path='/login' element={<LoginForm/>}/>
                </Routes>
            </div>
        </div>
    );
};

export default RouterMain;