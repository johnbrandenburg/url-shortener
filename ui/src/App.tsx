import React from 'react';
import {
  BrowserRouter as Router,
  Switch,
  Route,
} from "react-router-dom";
import './App.css';
import HomePage from './Components/HomePage';

const App = () => {
  return (
    <div className="App">
      <header className="App-header">
        URL Shortener
      </header>
      <main className="App-body">
        <Router>
          <Switch>
            <Route path='/'>
              <HomePage/>
            </Route>
          </Switch>
        </Router>
      </main>
    </div>
  );
}

export default App;
