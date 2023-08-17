import axios from "axios";
import BeerService from "../services/BeerService";

export default {
  getApiBreweries({ commit }) {
    axios
      .get("https://api.openbrewerydb.org/v1/breweries")
      .then((response) => {
        const apiBreweries = response.data.map((apiBrewery) => {
          return {
            breweryId: apiBrewery.id,
            breweryName: apiBrewery.name,
            phoneNumber: apiBrewery.phone,
            emailAddress: "",
            address:
              apiBrewery.street +
              " " +
              apiBrewery.city +
              ", " +
              apiBrewery.state +
              " " +
              apiBrewery.postal_code,
            breweryHistory: apiBrewery.website_url,
            operatingHours: "",
            breweryImage: "",
            longitude: apiBrewery.longitude,
            latitude: apiBrewery.latitude,
            fromThirdParty: true,
          };
        });
        return apiBreweries;
      })
      .then((apiBreweries) => {
        commit("SET_API_BREWERIES", apiBreweries);
      })
      .catch((error) => {
        console.error("Breweries not found", error);
      });
  },
  getApiBrewery({ commit }, breweryId) {
    console.log(breweryId);
    axios
      .get(`https://api.openbrewerydb.org/v1/breweries/${breweryId}`)
      .then((response) => {
        const apiBrewery = {
          breweryId: response.data.id,
          breweryName: response.data.name,
          phoneNumber: response.data.phone,
          emailAddress: "",
          address: `${response.data.street}, ${response.data.city}, ${response.data.state}, ${response.data.postal_code}`,
          breweryHistory: response.data.website_url,
          operatingHours: "",
          breweryImage: "",
          longitude: response.data.longitude,
          latitude: response.data.latitude,
          fromThirdParty: true,
        };
        commit("SET_API_BREWERY", apiBrewery);
      })
      .catch((error) => {
        console.error("Error fetching brewery:", error);
      });
  },
  getBeersByBrewery({ commit }, breweryId) {
    axios
      .get(`/breweries/${breweryId}/beers`)
      .then((response) => {
        commit("SET_BEERS_ARRAY", response.data);
      })
      .catch((error) => {
        if (error.response && error.response.status === 404) {
          alert("Beer Not Available");
        }
      });
  },
  addBeersByBrewery({ commit }, payload) {
    BeerService.createBeerById(payload)
      .then((response) => {
        console.log(response);
        commit("ADD_BEER_TO_ARRAY", response.data);
      })
      .catch((error) => {
        if (error.response && error.response.status === 404) {
          alert("Beer Not Available");
        }
      });
  },
  deleteBeerByBrewery({ commit }, payload) {
    BeerService.deleteBeerFromBrewery(payload)
      .then((response) => {
        commit("DELETE_BEER_FROM_ARRAY", payload);
        console.log(response.data);
      })
      .catch((error) => {
        if (error.response && error.response.status === 404) {
          alert("Beer Not Deleted");
        }
      });
  },
};
