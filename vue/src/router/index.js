import Vue from 'vue'
import Router from 'vue-router'
import Home from '../views/Home.vue'
import Login from '../views/Login.vue'
import Logout from '../views/Logout.vue'
import Register from '../views/Register.vue'
import store from '../store/index'
import Brewery from '../views/BreweryView.vue'
import Beer from '../views/BeerView.vue'
import Brewer from '../views/BrewerView'
import ApiSearchView from '../views/ApiSearchView.vue'
import ApiBreweryView from '../views/ApiBreweryView.vue'
import ManagerView from '../views/ManagerView.vue'
import UserPageView from '../views/UserPageView'
//import Events from '../components/Events'
Vue.use(Router)

/**
 * The Vue Router is used to "direct" the browser to render a specific view component
 * inside of App.vue depending on the URL.
 *
 * It also is used to detect whether or not a route requires the user to have first authenticated.
 * If the user has not yet authenticated (and needs to) they are redirected to /login
 * If they have (or don't need to) they're allowed to go about their way.
 */

const router = new Router({
  mode: 'history',
  base: process.env.BASE_URL,
  routes: [
    {
      path: '/',
      name: 'home',
      component: Home,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/login",
      name: "login",
      component: Login,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/logout",
      name: "logout",
      component: Logout,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/register",
      name: "register",
      component: Register,
      meta: {
        requiresAuth: false
      },
    },
    {
      path: `/breweries/:breweryId`,
      name: "brewery",
      component: Brewery,
      meta: {
        requiresAuth: true
      },
    },
    {
      path: `/beers/:beerId`,
      name: "beer",
      component: Beer, 
      meta: {
        requiresAuth: false
      }
    },
    {
      path: '/externalsearch',
      name: "external-search",
      component: ApiSearchView, 
      meta: {
        requiresAuth: false
      }
    },
    {
      path: '/breweries/brewer/:brewerId',
      name: 'brewer',
      component: Brewer,
      meta: {
        requiresAuth: true
      }
    },
    {
      path: `/externalsearch/:breweryId`,
      name: "api-brewery",
      component: ApiBreweryView, 
      meta: {
        requiresAuth: false
      }
    }, 
    {
      path: `/manager`,
      name: "manager-view",
      component: ManagerView, 
      meta: {
        requiresAuth: true
    }
    },
    {
      path: `/userpage/:userId`,
      name: "userPage",
      component: UserPageView,
      meta: {
        requiresAuth: true
      }
    }
  ]
})

router.beforeEach((to, from, next) => {
  // Determine if the route requires Authentication
  const requiresAuth = to.matched.some(x => x.meta.requiresAuth);

  // If it does and they are not logged in, send the user to "/login"
  if (requiresAuth && store.state.token === '') {
    store.commit('SET_LOGIN_MODAL')
    next();
  } else {
    // Else let them go to their next destination
    next();
  }
});

export default router;
