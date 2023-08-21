import axios from "axios";

export default {
  SET_AUTH_TOKEN(state, token) {
    state.token = token;
    localStorage.setItem("token", token);
    axios.defaults.headers.common["Authorization"] = `Bearer ${token}`;
  },
  SET_USER(state, user) {
    state.user = user;
    localStorage.setItem("user", JSON.stringify(user));
    state.isAuthenticated = true;
  },
  LOGOUT(state) {
    localStorage.removeItem("token");
    localStorage.removeItem("user");
    state.token = "";
    state.user = {};
    axios.defaults.headers.common = {};
    state.isAuthenticated = false;
  },

  SET_LOGIN_MODAL(state) {
    state.showLoginModal = !state.showLoginModal;
  },
  SET_REGISTER_MODAL(state) {
    state.showRegisterModal = !state.showRegisterModal;
  },
  SET_LOGOUT_MODAL(state) {
    state.showLogoutModal = !state.showLogoutModal;
  },
  SET_REGISTRATION(state) {
    state.registrationSuccess = !state.registrationSuccess;
  },
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
