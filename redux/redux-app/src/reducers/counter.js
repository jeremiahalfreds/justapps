import * as types from "../types";

// Initial State
const initialState = {
  count: 0,
};

// Reducer
const counterReducer = (state = initialState, action) => {
  switch (action.type) {
    case types.INCREMENT:
      return { ...state, count: state.count + 1 };
    case types.DECREMENT:
      return { ...state, count: state.count - 1 };
    default:
      return state;
  }
};

export default counterReducer;