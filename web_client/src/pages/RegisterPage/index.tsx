import React, { useState } from 'react'
import TextField from "@mui/material/TextField";
import Button from "@mui/material/Button";
import AdapterDateFns from '@mui/lab/AdapterDateFns';
import LocalizationProvider from '@mui/lab/LocalizationProvider';
import DatePicker from '@mui/lab/DatePicker';
import FormControl from '@mui/material/FormControl';
import FormLabel from '@mui/material/FormLabel';
import RadioGroup from '@mui/material/RadioGroup';
import FormControlLabel from '@mui/material/FormControlLabel';
import Radio from '@mui/material/Radio';

export default function RegisterPage() {
    const [value, setValue] = useState(null)
    return (
        <div className='login-register-form'>
            <h1>Регистрация</h1>
            <div>
                <TextField id='user_first_name' label="Имя" required />
                <br />
                <TextField id='user_last_name' label="Фамилия" required />
                <br />
                <TextField id='user_login' label="Логин" required autoComplete='username' />
                <br />
                <LocalizationProvider dateAdapter={AdapterDateFns}>
                    <DatePicker
                        label="Дата рождения"
                        value={value}
                        onChange={nv => setValue(nv)}
                        renderInput={(params) => <TextField {...params} />}
                    />
                </LocalizationProvider>
                <br />
                <FormControl component="fieldset">
                    <FormLabel component="legend">Пол</FormLabel>
                    <RadioGroup row aria-label="gender" name="row-radio-buttons-group">
                        <FormControlLabel value="male" control={<Radio />} label="Мужской" />
                        <FormControlLabel value="female" control={<Radio />} label="Женский" />
                    </RadioGroup>
                </FormControl>
                <br />
                <TextField id='user_email' label="E mail" required autoComplete='emmail' type='email' />
                <br />
                <TextField id='user_password' label="Пароль" required type="password" />
            </div>
            <Button>Зарегистрироваться</Button>
        </div>
    )
}
