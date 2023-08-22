import BreweryService from "@/services/BreweryService.js";
import axios from "axios";

export const getBreweries = ({ commit }) => {
  BreweryService.getBreweries()
    .then((response) => {
      commit("SET_BREWERY_ARRAY", response.data);
    })
    .catch((error) => {
      if (error.response && error.reponse.status === 404) {
        alert("Brewery Not Available");
      }
    });
};

export const getBreweryById = ({ commit }, breweryId) => {
  BreweryService.getBreweryById(breweryId)
    .then((response) => {
      commit("SET_BREWERY", response.data);
    })
    .catch((error) => {
      if (error.response && error.response.status === 404) {
        alert("Brewery Not Available");
      }
    });
};

export const updateBreweryRating = ({ commit }, brewery) => {
  BreweryService.updateBrewery(brewery)
    .then((response) => {
      if (response.status === 200) {
        commit("SET_BREWERY", brewery);
      }
    })
    .catch((error) => {
      if (error.response && error.response.status === 400) {
        alert("Could not update average rating");
      }
    });
};

export const getBreweryByBrewerId = ({ commit }, brewerId) => {
  BreweryService.getBreweryByBrewerId(brewerId)
    .then((response) => {
      commit("SET_BREWERY", response.data);
    })
    .catch((error) => {
      if (error.response && error.response.status === 404) {
        alert("Brewery Not Available");
      }
    });
};

export const createBrewery = ({ commit }, brewery) => {
  BreweryService.createBrewery(brewery)
    .then((response) => {
      if (response.status === 201) {
        commit("SET_BREWERY", response.data);
      }
    })
    .catch((error) => {
      if (error.response && error.response.status === 404) {
        alert("Brewery not Created");
      }
    });
};

export const updateBrewery = ({ commit }, brewery) => {
  BreweryService.updateBrewery(brewery)
    .then((response) => {
      if (response.status === 200) {
        commit("SET_BREWERY", brewery);
        alert("Brewery Profile changes saved!");
      }
    })
    .catch((error) => {
      if (error.response && error.response.status === 404) {
        alert("Brewery Not Updated");
      }
    });
};

export const addLikedBrewery = ({ commit }, payload) => {
  BreweryService.addLikedBrewery(payload)
    .then((response) => {
      if (response.status === 202) {
        commit("ADD_LIKED_BREWERY", payload.brewery);
      }
    })
    .catch((error) => {
      if (error.response && error.response.status === 404) {
        alert("Brewery Not Liked");
      }
    });
};

export const getLikedBreweries = ({ commit }, user) => {
  BreweryService.getLikedBreweries(user)
    .then((response) => {
      commit("SET_LIKE_BREWERIES", response.data);
    })
    .catch((error) => {
      if (error.response && error.response.status === 404) {
        alert("Brewery Not Liked");
      }
    });
};

export const deleteLikedBrewery = ({ commit }, payload) => {
  BreweryService.deleteLikedBrewery(payload)
    .then((response) => {
      if (response.status === 200) {
        commit("DELETE_LIKE_BREWERIES", payload.breweryId);
      }
    })
    .catch((error) => {
      if (error.response && error.response.status === 404) {
        alert("Brewery Not Unliked");
      }
    });
};

export const getApiBreweries = ({ commit }) => {
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
      if (error.response && error.response.status === 404) {
        alert("Brewery Not Available");
      }
    });
};
export const getApiBrewery = ({ commit }, breweryId) => {
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
      if (error.response && error.response.status === 404) {
        alert("Brewery Not Available");
      }
    });
};
