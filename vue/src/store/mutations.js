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
  SET_LIKE_BEERS(state, liked) {
    state.likedBeers.unshift(liked);
  },
  SET_USER_LIKED(state, liked) {
    state.userLiked.unshift(liked);
  },
  SET_USER_LIKED_CREATED(state, liked) {
    (state.userLiked = []), state.userLiked.unshift(liked);
  },
  DELETE_USER_LIKED(state, beerId) {
    state.userLiked = state.userLiked.filter((beer) => {
      return beer.beerId != beerId;
    });
  },
  SET_LIKE_BREWERIES(state, liked) {
    state.likedBreweries.unshift(liked);
  },
  DELETE_LIKE_BREWERIES(state, breweryId) {
    state.likedBreweries = state.likedBreweries.filter((brewery) => {
      return brewery.breweryId != breweryId;
    });
  },
  DELETE_LIKE_BEERS(state, beerId) {
    state.likedBeers = state.likedBeers.filter((beer) => {
      return beer.beerId != beerId;
    });
  },
  SET_BREWERY(state, brewery) {
    state.brewery = brewery;
  },
  SET_BREWERY_ARRAY(state, data) {
    state.breweries = data.slice().reverse();
  },
  SET_BEER(state, beer) {
    state.beer = beer;
  },
  SET_BEERS_ARRAY(state, data) {
    state.beers = data;
  },
  ADD_BEER_TO_ARRAY(state, data) {
    state.beers.push(data);
  },
  SET_BEER_REVIEWS_ARRAY(state, data) {
    state.beerReviews = data.slice().reverse();
  },
  SET_BREWERIES_REVIEWS_ARRAY(state, data) {
    state.breweryReviews = data.slice().reverse();
  },
  SET_API_BREWERIES(state, data) {
    state.apiBreweries = data;
  },
  SET_API_BREWERY(state, apiBrewery) {
    state.apiBrewery = apiBrewery;
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
  DELETE_BEER_FROM_ARRAY(state, data) {
    const beer = state.beers.filter((d) => d.id !== data.beerId);
    state.beers = beer;
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
