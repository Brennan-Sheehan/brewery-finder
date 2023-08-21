export default {
  GET_LOGIN_MODAL(state) {
    return state.showLoginModal;
  },

  isAuthenticated(state) {
    if (state.token != "") {
      return true;
    } else {
      return false;
    }
  },
  isBrewer(state) {
    if (state.isAuthenticated) {
      let result = state.user.authorities.filter(
        (d) => d.name === "ROLE_ADMIN"
      );
      if (result.length > 0) {
        return true;
      } else {
        return false;
      }
    }
  },
  isManager(state) {
    if (state.isAuthenticated) {
      let result = state.user.authorities.filter(
        (d) => d.name === "ROLE_MANAGER"
      );
      if (result.length > 0) {
        return true;
      } else {
        return false;
      }
    }
  },
};
