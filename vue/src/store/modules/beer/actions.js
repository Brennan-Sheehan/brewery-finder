import BeerService from "@/services/BeerService.js";

/**
 * Get all beers by the brewery id
 * Commit mutation to set beers array
 *
 * If API call can not be made or returns a 404 status code, alert the user
 * @param {*} commit
 * @param {number} breweryId
 */
export const getBeersByBrewery = ({ commit }, breweryId) => {
  BeerService.getBeersByBreweryId(breweryId)
    .then((response) => {
      commit("SET_BEERS_ARRAY", response.data);
    })
    .catch((error) => {
      if (error.response && error.response.status === 404) {
        alert("Beer Not Available");
      }
    });
};

/**
 * Create a beer by the brewery id
 * Commit mutation to add beer to beers array
 * If API call can not be made or returns a 404 status code, alert the user
 * @param {object} payload takes in the brewery id and the beer object
 */
export const addBeerByBrewery = ({ commit }, payload) => {
  BeerService.createBeerById(payload)
    .then((response) => {
      if (response.status === 200) {
        commit("ADD_BEER_TO_ARRAY", response.data);
      }
    })
    .catch((error) => {
      if (error.response && error.response.status === 404) {
        alert("Beer Not =Created");
      }
    });
};
export const deleteBeerByBrewery = ({ commit }, payload) => {
  BeerService.deleteBeerFromBrewery(payload)
    .then((response) => {
      if (response.status === 200) {
        commit("DELETE_BEER_FROM_ARRAY", payload.beerId);
      }
    })
    .catch((error) => {
      if (error.response && error.response.status === 404) {
        alert("Beer Not Deleted");
      }
    });
};

export const getBeerById = ({ commit }, beerId) => {
  BeerService.getBeerById(beerId)
    .then((response) => {
      commit("SET_BEER", response.data);
    })
    .catch((error) => {
      if (error.response && error.response.status === 404) {
        alert("Beer Not Available");
      }
    });
};

export const updateBeerRating = ({ commit }, beer) => {
  BeerService.updateBeer(beer)
    .then((response) => {
      if (response.status === 200) {
        commit("SET_BEER", beer);
      }
    })
    .catch((error) => {
      if (error.response && error.response.status === 404) {
        alert("Beer Not Updated");
      }
    });
};

export const addLikedBeer = ({ commit }, payload) => {
  BeerService.addLikedBeer(payload)
    .then((response) => {
      if (response.status === 202) {
        commit("ADD_LIKED_BEER", payload.beer);
      }
    })
    .catch((error) => {
      if (error.response && error.response.status === 404) {
        alert("Beer Not Liked");
      }
    });
};

export const getLikedBeers = ({ commit }, user) => {
  BeerService.getLikedBeers(user)
    .then((response) => {
      commit("SET_LIKE_BEERS", response.data);
    })
    .catch((error) => {
      if (error.response && error.response.status === 404) {
        alert("Beer Not Liked");
      }
    });
};

export const deleteLikedBeer = ({ commit }, payload) => {
  BeerService.deleteLikedBeer(payload)
    .then((response) => {
      if (response.status === 200) {
        commit("DELETE_LIKE_BEERS", payload.beerId);
      }
    })
    .catch((error) => {
      if (error.response && error.response.status === 404) {
        alert("Beer Not Deleted");
      }
    });
};
