export const SET_USERS = (state, users) => {
  state.users = users;
};

export const SET_SINGLE_USER = (state, singleUser) => {
  state.singleUser = singleUser;
};

export const SET_ROLE = (state, data) => {
  state.singleUser = data;
};

export const DELETE_BREWERY = (state, id) => {
  state.breweries = state.breweries.filter((brewery) => {
    return brewery.breweryId != id;
  });
};
