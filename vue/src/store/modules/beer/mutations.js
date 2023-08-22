export const SET_BEER = (state, beer) => {
  state.beer = beer;
};
export const SET_BEERS_ARRAY = (state, data) => {
  state.beers = data;
};
export const DELETE_BEER_FROM_ARRAY = (state, data) => {
  state.beers = state.beers.filter((beer) => beer.id !== data.beerId);
};
export const ADD_BEER_TO_ARRAY = (state, data) => {
  state.beers.push(data);
};
export const ADD_LIKED_BEER = (state, data) => {
  state.likedBeers.unshift(data);
};
export const SET_LIKE_BEERS = (state, liked) => {
  liked.forEach((beer) => {
    if (!state.likedBeers.some((likedBeer) => likedBeer.id === beer.id)) {
      state.likedBeers.unshift(beer);
    }
  });
};
export const DELETE_LIKE_BEERS = (state, beerId) => {
  state.likedBeers = state.likedBeers.filter((beer) => {
    return beer.beerId != beerId;
  });
};
