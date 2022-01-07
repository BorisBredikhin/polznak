import { BrowserRouter, Route, Routes } from "react-router-dom";
import LoginPage from "./LoginPage";
import RegisterPage from "./RegisterPage";

type RoutingProps = {
    token: string | null
}

export function Routing({token}: RoutingProps) {
    if (!token)
        return (
            <BrowserRouter>
                <Routes>
                    <Route path="/register" element={<RegisterPage/>}/>
                    <Route path="*" element={<LoginPage/>}/>
                </Routes>
            </BrowserRouter> 
        )
    return <p>You are loged in</p>
}