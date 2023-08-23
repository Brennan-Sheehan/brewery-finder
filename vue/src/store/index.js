import { createStore } from "vuex";

import breweryModule from "./modules/brewery";
import beerModule from "./modules/beer";
import reviewModule from "./modules/reviews";
import userModule from "./modules/user";
import managerModule from "./modules/manager";

const state = {};

export default createStore({
  state,
  modules: {
    breweryModule,
    beerModule,
    reviewModule,
    userModule,
    managerModule,
  },
});
