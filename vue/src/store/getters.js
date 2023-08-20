export default {
  GET_BREWERY(state) {
    return state.brewery;
  },
  GET_BREWERIES(state) {
    return state.breweries;
  },
  GET_BEER(state) {
    return state.beer;
  },
  GET_BEERS(state) {
    return state.beers;
  },
  GET_BEER_REVIEWS(state) {
    return state.beerReviews;
  },
  GET_BREWERY_REVIEWS(state) {
    return state.breweryReviews;
  },
  GET_API_BREWERIES(state) {
    return state.apiBreweries;
  },
  GET_API_BREWERY(state) {
    return state.apiBrewery;
  },
  GET_LOGIN_MODAL(state) {
    return state.showLoginModal;
  },
  GET_LIKED_BEERS(state) {
    return state.likedBeers;
  },
  GET_LIKED_BREWERIES(state) {
    return state.likedBreweries;
  },
  GET_USER_LIKED(state) {
    return state.userLiked;
  },
  isAuthenticated(state) {
    if (state.token != "") {
      return true;
    } else {
      return false;
    }
  },
  isBrewer(state) {
    if (state.isAuthenticated) {
      let result = state.user.authorities.filter(
        (d) => d.name === "ROLE_ADMIN"
      );
      if (result.length > 0) {
        return true;
      } else {
        return false;
      }
    }
  },
  isManager(state) {
    if (state.isAuthenticated) {
      let result = state.user.authorities.filter(
        (d) => d.name === "ROLE_MANAGER"
      );
      if (result.length > 0) {
        return true;
      } else {
        return false;
      }
    }
  },
};
