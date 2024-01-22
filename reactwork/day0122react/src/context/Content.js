import React, { useContext } from 'react';
import { ThemeContext } from './ThemeContext';
import { UserContext } from './UserContext';

const Content = () => {
    const {isDark}=useContext(ThemeContext);
    const user=useContext(UserContext);

    return (
        <div className='content' style={{backgroundColor:isDark?'gray':'white'}}>
        <p>{user}님! 즐거운 하루되세요!!!</p>
    </div>
    );
};

export default Content;