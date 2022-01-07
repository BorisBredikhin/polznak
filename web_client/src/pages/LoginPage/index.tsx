import React from 'react'
import TextField from "@mui/material/TextField";
import Button from "@mui/material/Button";
import { Link } from 'react-router-dom';

export default function LoginPage() {
    return (
        <div className='login-register-form'>
            <h1>Вход</h1>
            <div>
                <TextField id='user_login' label="Логин" required autoComplete='username' />
                <br/>
                <TextField id='user_password' label="Пароль" required autoComplete='current-password' type="password" />
            </div>
            <Button>Войти</Button>
            <Link to='/register' style={{textDecoration: 'none'}}><Button>Зарегистрироваться</Button></Link>
        </div>
    )
}
