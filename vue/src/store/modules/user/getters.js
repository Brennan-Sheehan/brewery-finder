export const GET_LOGIN_MODAL = (state) => {
  return state.showLoginModal;
};
export const GET_REGISTER_MODAL = (state) => {
  return state.showRegisterModal;
};
export const GET_LOGOUT_MODAL = (state) => {
  return state.showLogoutModal;
};
export const GET_USER_ID = (state) => {
  return state.user.id;
};
export const GET_USER = (state) => {
  return state.user;
};
export const GET_USER_USERNAME = (state) => {
  return state.user.username;
};
export const isAuthenticated = (state) => {
  return state.isAuthenticated;
};

export const isBrewer = (state) => {
  return state.isBrewer;
};

export const isManager = (state) => {
  return state.isManager;
};
