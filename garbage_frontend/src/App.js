import './App.css';

import {BrowserRouter, Route} from 'react-router-dom';
import Navbar from './components/navbar';
import Login from './pages/login';
import Home from './pages/home';
import Register from './pages/register';

function App() {
  return (
    <div className="App">
      <BrowserRouter>
        <Navbar />
        <Route path='/login' component={Login}/>
        <Route path='/register' component={Register}/>
        <Route path="/home" component={Home}/>
      </BrowserRouter>
    </div>
  );
}

export default App;
