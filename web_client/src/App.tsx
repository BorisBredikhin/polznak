import React from 'react';
import { Routing } from './pages';

function App() {
  const token = localStorage.getItem('token')
  if (!token) {
    
  }
  return (
    <div className="App">
      <Routing token={token}/>
    </div>
  );
}

export default App;
