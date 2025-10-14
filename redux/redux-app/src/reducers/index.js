import counterReducer from "./counter";
import { combineReducers } from "redux";
import loggedReducer from "./isLogged";

const rootReducer = combineReducers({
  counter: counterReducer,
  isLogged: loggedReducer,
});

export default rootReducer;
