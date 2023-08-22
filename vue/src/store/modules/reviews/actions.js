import ReviewService from "@/services/ReviewService.js";

export const getBreweryReviews = ({ commit }, breweryId) => {
  ReviewService.listReviewsByBreweryId(breweryId)
    .then((response) => {
      commit("SET_BREWERIES_REVIEWS_ARRAY", response.data);
    })
    .catch((error) => {
      if (error.response && error.response.status === 404) {
        alert("No Reviews for this brewery");
      }
    });
};

export const createBreweryReview = ({ commit }, review) => {
  ReviewService.createBreweryReview(review)
    .then((response) => {
      if (response.status === 201) {
        commit("ADD_BREWERY_REVIEW", review);
      }
    })
    .catch((error) => {
      if (error.response && error.response.status === 400) {
        alert("You have already reviewed this brewery");
      }
    });
};

export const getBeerReviews = ({ commit }, beerId) => {
  ReviewService.listReviewsByBeerId(beerId)
    .then((response) => {
      commit("SET_BEER_REVIEWS_ARRAY", response.data);
    })
    .catch((error) => {
      if (error.response && error.response.status === 404) {
        alert("No Reviews for this beer");
      }
    });
};

export const createBeerReview = ({ commit }, payload) => {
  ReviewService.createBeerReview(payload)
    .then((response) => {
      if (response.status === 201) {
        commit("ADD_BEER_REVIEW", payload.review);
      }
    })
    .catch((error) => {
      if (error.response && error.response.status === 400) {
        alert("You have already reviewed this beer");
      }
    });
};
