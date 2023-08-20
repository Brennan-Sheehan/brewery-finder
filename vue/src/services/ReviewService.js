import axios from "axios";

const http = axios.create({
  baseURL: "http://54.165.31.227:9000",
});

export default {
  listReviewsByBeerId(beerId) {
    return http.get(`/beers/${beerId}/reviews`);
  },
  listReviewsByBreweryId(breweryId) {
    return http.get(`/breweries/${breweryId}/reviews`);
  },
  createBeerReview(review) {
    return http.post(`/beers/${review.beerId}/reviews`, review);
  },
  createBreweryReview(review) {
    return http.post(`/breweries/${review.breweryId}/reviews`, review);
  },
  updateBeerReview(beer) {
    return http.put(`/beers/${beer.beerId}`, beer);
  },
};
