import { createStore } from "vuex";
import actions from "./actions";
import mutations from "./mutations";
import getters from "./getters";

import breweryModule from "./modules/brewery";
import beerModule from "./modules/beer";
import reviewModule from "./modules/reviews";
import userModule from "./modules/user";
import managerModule from "./modules/manager";

/*
 * The authorization header is set for axios when you login but what happens when you come back or
 * the page is refreshed. When that happens you need to check for the token in local storage and if it
 * exists you should set the header so that it will be attached to each request
 */

const state = {
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
    userModule,
    managerModule,
  },
});
