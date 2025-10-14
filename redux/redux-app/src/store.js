import { legacy_createStore as createStore } from "redux";
import rootReducer from "./reducers";
import * as types from "./types";

const initialState = {};

// Action Creators
export const increment = () => ({ type: types.INCREMENT });
export const decrement = () => ({ type: types.DECREMENT });

// Create Store
const store = createStore(rootReducer, initialState);

// Subscribe to store updates (for testing purposes)
store.subscribe(() => console.log(store.getState())); // Should log: { count: 1 }

// Dispatch some actions to test
store.dispatch(increment());
store.dispatch(decrement());

export default store;
