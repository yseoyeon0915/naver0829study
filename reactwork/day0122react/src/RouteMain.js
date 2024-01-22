import React from 'react';
import Menu from './Menu';
import { Route, Routes } from 'react-router-dom';
import Home from './components/Home';
import CallBackApp from './components/CallBackApp';
import MemoApp from './components/MemoApp';
import ReducerApp from './components/ReducerApp';
import SweetApp from './components/SweetApp';
import errimg from './image/s10.JPG';
import './components/MyStyle.css';
import ContextApp from './context/ContextApp';
import QueryString from './components/QueryString';

const RouteMain = () => {
    return (
        <div className='main'>
            <Menu/>
            <hr style={{clear:'both'}}/>
            <Routes>
                <Route path='/' element={<Home/>}/>
                <Route path='/callback' element={<CallBackApp/>}/>
                <Route path='/memo' element={<MemoApp/>}/>
                <Route path='/reducer' element={<ReducerApp/>}/>
                <Route path='/context' element={<ContextApp/>}/>
                <Route path='/sweet' element={<SweetApp/>}/>
                <Route path='/query' element={<QueryString/>}/>

                <Route path='*' element={
                    <div>
                        <h1>잘못된 URL 주소입니다</h1>
                        <br/><br/>
                        <img alt='' src={errimg}/>
                    </div>
                }>
                </Route>
            </Routes>
        </div>
    );
};

export default RouteMain;