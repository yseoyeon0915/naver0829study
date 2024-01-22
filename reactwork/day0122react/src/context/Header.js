import React, { useContext } from 'react';
import { ThemeContext } from './ThemeContext';
import { UserContext } from './UserContext';

const Header = () => {
    const {isDark}=useContext(ThemeContext);
    const user=useContext(UserContext);

    return (
        <header className='header' style={{backgroundColor:isDark?'black':'lightgray'}}>
            <h1>Welcome {user}!</h1>
        </header>
    );
};

export default Header;