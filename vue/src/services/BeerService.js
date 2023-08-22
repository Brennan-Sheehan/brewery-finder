import axios from "axios";

export default {
  getBeersByBreweryId(breweryId) {
    return axios.get(`/breweries/${breweryId}/beers`);
  },

  getBeerById(beerId) {
    return axios.get(`/beers/${beerId}`);
  },

  createBeerById(payload) {
    return axios.post(`/breweries/${payload.breweryId}/beers`, payload.beer);
  },
  updateBeer(beer) {
    return axios.put(`/beers/${beer.beerId}`, beer);
  },
  deleteBeerFromBrewery(payload) {
    return axios.delete(
      `/breweries/${payload.breweryId}/beers/${payload.beerId}`
    );
  },
  getBeers() {
    return axios.get(`/beers`);
  },
  addLikedBeer(payload) {
    return axios.post(`/beers/${payload.beerId}/users/${payload.userId}`);
  },
  getLikedBeers(user) {
    return axios.get(`/users/${user.id}/beers`);
  },
  deleteLikedBeer(payload) {
    return axios.delete(`/users/${payload.userId}/beers/${payload.beerId}`);
  },
};
