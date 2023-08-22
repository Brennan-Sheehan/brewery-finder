export default {
  SET_USERS(state, users) {
    state.users = users;
  },
  SET_SINGLE_USER(state, singleUser) {
    state.singleUser = singleUser;
  },
  SET_ROLE(state, data) {
    state.singleUser = data;
  },
  DELETE_BREWERY(state, id) {
    state.breweries = state.breweries.filter((brewery) => {
      return brewery.breweryId != id;
    });
  },
};
