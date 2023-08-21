import { createStore } from "vuex";
import actions from "./actions";
import mutations from "./mutations";
import getters from "./getters";
import axios from "axios";
import breweryModule from "./modules/brewery";
import beerModule from "./modules/beer";
import reviewModule from "./modules/reviews";

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

const state = {
  token: currentToken || "",
  user: currentUser || {
    userId: 0,
  },
  showLoginModal: false,
  showRegisterModal: false,
  showLogoutModal: false,
  registrationSuccess: false,
  isAuthenticated: false,

  users: [],
  singleUser: {},
};

export default createStore({
  state,
  getters,
  actions,
  mutations,
  modules: {
    breweryModule,
    beerModule,
    reviewModule,
  },
});
