import axios from "axios";

export default {
  listReviewsByBeerId(beerId) {
    return axios.get(`/beers/${beerId}/reviews`);
  },
  listReviewsByBreweryId(breweryId) {
    return axios.get(`/breweries/${breweryId}/reviews`);
  },
  createBeerReview(payload) {
    return axios.post(`/beers/${payload.beerId}/reviews`, payload.review);
  },
  createBreweryReview(review) {
    return axios.post(`/breweries/${review.breweryId}/reviews`, review);
  },
};
