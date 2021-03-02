import React from 'react';
import './App.css';
import {
  BrowserRouter as Router,
  Switch,
  Route,
} from "react-router-dom";

import { Reports } from './containers/Reports.jsx';

function App() {
  return (
    <Router>
      <Switch>
        <Route
          exact
          path= "/reports">
          <Reports />
        </Route>
      </Switch>
    </Router>

  );
}

export default App;
