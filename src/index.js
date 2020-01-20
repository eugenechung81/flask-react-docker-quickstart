import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import App from './App';

import { Provider } from 'react-redux'
import { createStore } from 'redux'

const reducer = function(state = {
  'transcript': 'initial',
}, action) {
  switch(action.type) {
    case 'UPDATE_INFO':
      return {
        'transcript': action.data
      };
    default:
      return state
  }
  // return state;
};

const store = createStore(reducer);

ReactDOM.render(
  <Provider store={store}><App/></Provider>
  , document.getElementById('root'));
