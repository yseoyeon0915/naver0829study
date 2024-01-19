import React from 'react';
import { Route, Routes } from 'react-router-dom';
import PersonList from './components/PersonList';
import PersonForm from './components/PersonForm';
import DetailPerson from './components/DetailPerson';
import UpdatePersonForm from './components/UpdatePersonForm';
import errimg from './images/s10.JPG';
import './components/PersonStyle.css';

const RouterMain = () => {
    return (
        <div>
            <Routes>
                <Route path='/' element={<PersonList/>}/>
                <Route path='/writeform' element={<PersonForm/>}/>
                <Route path='/detail/:pnum' element={<DetailPerson/>}/>
                <Route path='/updateform/:pnum' element={<UpdatePersonForm/>}/> 

                 {/* 그 이외의 매핑주소일경우 호출 */}
                 <Route path='*' element={
                    <div style={{margin:'50px'}}>
                        <h1>잘못된 URL 주소입니다</h1>
                        <img alt='' src={errimg}/>
                    </div>
                }/>
            </Routes>
        </div>
    );
};

export default RouterMain;