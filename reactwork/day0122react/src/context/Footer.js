import React, { useContext } from 'react';
import { ThemeContext } from './ThemeContext';

const Footer = () => {
    const {isDark,setIsDark}=useContext(ThemeContext);

    return (
        <footer className='footer' style={{backgroundColor:isDark?'black':'lightgray'}}>
            <button type='button' className='button'
             onClick={()=>setIsDark(!isDark)}>Dark Mode</button>
        </footer>
    );
};

export default Footer;