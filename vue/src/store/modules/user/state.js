import axios from "axios";

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
