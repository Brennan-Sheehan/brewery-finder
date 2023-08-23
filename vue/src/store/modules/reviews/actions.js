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
