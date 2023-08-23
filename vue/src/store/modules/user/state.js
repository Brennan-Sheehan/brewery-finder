import axios from "axios";

/*
 * The authorization header is set for axios when you login but what happens when you come back or
 * the page is refreshed. When that happens you need to check for the token in local storage and if it
 * exists you should set the header so that it will be attached to each request
 */

const currentToken = localStorage.getItem("token");
const currentUser = JSON.parse(localStorage.getItem("user"));

if (currentToken != null) {
  axios.defaults.headers.common["Authorization"] = `Bearer ${currentToken}`;
}

export default {
  token: currentToken || "",
  user: currentUser || "",
  showLoginModal: false,
  showRegisterModal: false,
  showLogoutModal: false,
  registrationSuccess: false,
  isAuthenticated: false,
  isBrewer: false,
  isManager: false,
};
