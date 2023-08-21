export const SET_BREWERIES_REVIEWS_ARRAY = (state, data) => {
  state.breweryReviews = data.slice().reverse();
};

export const ADD_BREWERY_REVIEW = (state, data) => {
  state.breweryReviews.unshift(data);
};

export const SET_BEER_REVIEWS_ARRAY = (state, data) => {
  state.beerReviews = data.slice().reverse();
};
export const ADD_BEER_REVIEW = (state, data) => {
  state.beerReviews.unshift(data);
};
