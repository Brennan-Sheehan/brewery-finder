import axios from "axios";

export const SET_AUTH_TOKEN = (state, token) => {
  state.token = token;
  localStorage.setItem("token", token); // Save token to local storage
  axios.defaults.headers.common["Authorization"] = `Bearer ${token}`; // Set token for axios
};

export const SET_USER = (state, user) => {
  state.user = user;
  localStorage.setItem("user", JSON.stringify(user)); // Save user to local storage
  state.isAuthenticated = true;
};

export const LOGOUT = (state) => {
  localStorage.removeItem("token");
  localStorage.removeItem("user");
  state.token = "";
  state.user = {};
  axios.defaults.headers.common = {};
  state.isAuthenticated = false;
  state.isBrewer = false;
  state.isManager = false;
};

export const SET_LOGIN_MODAL = (state) => {
  state.showLoginModal = !state.showLoginModal;
};

export const SET_REGISTER_MODAL = (state) => {
  state.showRegisterModal = !state.showRegisterModal;
};

export const SET_LOGOUT_MODAL = (state) => {
  state.showLogoutModal = !state.showLogoutModal;
};

export const SET_REGISTRATION = (state) => {
  state.registrationSuccess = !state.registrationSuccess;
};

/**
 * This function checks if the user is authenticated and if they are a brewer or manager
 *  * @param {*} state
 */

export const SET_IS_AUTHENTICATED = (state) => {
  if (state.token) {
    state.isAuthenticated = true;
  }
  if (state.isAuthenticated) {
    let result = state.user.authorities.filter((d) => d.name === "ROLE_ADMIN");
    if (result.length > 0) {
      state.isBrewer = true;
    } else {
      state.isBrewer = false;
    }
  }

  if (state.isAuthenticated) {
    let managerResult = state.user.authorities.filter(
      (d) => d.name === "ROLE_MANAGER"
    );
    if (managerResult.length > 0) {
      state.isManager = true;
    } else {
      state.isManager = false;
    }
  }
};
