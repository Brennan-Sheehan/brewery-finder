import ManagerService from "@/services/ManagerService";

export const getUserList = ({ commit }) => {
  ManagerService.getUsers()
    .then((response) => {
      commit("SET_USERS", response.data);
    })
    .catch((error) => {
      if (error.response && error.response.status === 404) {
        alert("Users are not available");
      }
    });
};

export const setBrewer = ({ commit }, payload) => {
  ManagerService.updateRole(payload)
    .then((response) => {
      if (response.status == 202) {
        commit("SET_ROLE", payload.user);
      }
    })
    .catch((error) => {
      if (error.response && error.response.status == 404) {
        alert("unable to change role");
      }
    });
};

export const setUser = ({ commit }, payload) => {
  ManagerService.updateRole(payload)
    .then((response) => {
      if (response.status == 202) {
        commit("SET_ROLE", payload.user);
      }
    })
    .catch((error) => {
      if (error.response && error.response.status == 404) {
        alert("unable to change role");
      }
    });
};

export const toggleRole = ({ commit }, payload) => {
  ManagerService.updateRole(payload)
    .then((response) => {
      if (response.status == 202) {
        commit("SET_ROLE", payload.user);
      }
    })
    .catch((error) => {
      if (error.response && error.response.status == 404) {
        alert("unable to change role");
      }
    });
};

export const deleteBrewery = ({ commit }, id) => {
  ManagerService.deleteBrewery(id)
    .then((response) => {
      if (response.status == 200) {
        commit("DELETE_BREWERY", id);
      }
    })
    .catch((error) => {
      if (error.response && error.response.status === 404) {
        alert("Unable to delete brewery");
      }
    });
};

export const changeBrewer = ({ commit }, payload) => {
  ManagerService.updateBrewer(payload)
    .then((response) => {
      if (response.status == 200) {
        commit("UPDATE_BREWER", payload.brewery);
      }
    })
    .catch((error) => {
      if (error.response && error.response.status === 404) {
        alert("Unable to change brewer");
      }
    });
};
