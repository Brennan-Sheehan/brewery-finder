export const SET_BREWERY = (state, brewery) => {
  state.brewery = brewery;
};

export const SET_BREWERY_ARRAY = (state, data) => {
  state.breweries = data.slice().reverse();
};

export const ADD_LIKED_BREWERY = (state, data) => {
  state.likedBreweries.unshift(data);
};
export const SET_LIKE_BREWERIES = (state, liked) => {
  liked.forEach((brewery) => {
    if (
      !state.likedBreweries.some(
        (likedBrewery) => likedBrewery.id === brewery.id
      )
    ) {
      state.likedBreweries.unshift(brewery);
    }
  });
};

export const DELETE_LIKE_BREWERIES = (state, breweryId) => {
  state.likedBreweries = state.likedBreweries.filter((brewery) => {
    return brewery.breweryId != breweryId;
  });
};

export const SET_API_BREWERIES = (state, data) => {
  state.apiBreweries = data;
};

export const SET_API_BREWERY = (state, apiBrewery) => {
  state.apiBrewery = apiBrewery;
};
