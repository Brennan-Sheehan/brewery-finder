import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'
import BeerService from '../services/BeerService'

Vue.use(Vuex)

/*
 * The authorization header is set for axios when you login but what happens when you come back or
 * the page is refreshed. When that happens you need to check for the token in local storage and if it
 * exists you should set the header so that it will be attached to each request
 */
const currentToken = localStorage.getItem('token')
const currentUser = JSON.parse(localStorage.getItem('user'));

if(currentToken != null) {
  axios.defaults.headers.common['Authorization'] = `Bearer ${currentToken}`;
}

export default new Vuex.Store({
  state: {
    token: currentToken || '',
    user: currentUser || {
      userId: 0
    },
    showLoginModal: false,
    showRegisterModal: false,
    showLogoutModal: false,
    registrationSuccess: false,
    isAuthenticated: false,
    brewery: {
      breweryId:0,
      breweryName:"",
      phoneNumber:"",
      emailAddress:"",
      address:"",
      breweryHistory:"",
      operatingHours:"",
      breweryImage:"",
      brewerId: 0, 
      averageRating:0
    },
    breweries: [],
    userLiked: [],
    beer: {
        beerId: 0,
        beerName: "",
        description: "",
        rating: "",
        beerType:"",
        tastingNotes:"",
        abv: 0,
        image:"",
        averageRating:0
    },
    beers: [],
    liked:{
      userId:0,
      beerId:0,
      breweryId:0
    },
    likedBeers:[],
    likedBreweries:[],
    beerReview: {
        reviewId: '',
        rating: 0,
        description:'',
        userId: 0,
        breweryId:0,
        username:'',
        averageRating:''
    },
    breweryReview:{
      reviewId: '',
      rating: 0,
      description:'',
      userId: 0,
      breweriesId:0, 
      beerId:0,
      username:''
    },
    beerReviews: [],
    breweryReviews: [], 
    apiBreweries: [], 
    apiBrewery: {
      breweryId: 0,
      breweryName:"",
      phoneNumber:"",
      emailAddress:"",
      address:"",
      breweryHistory:"",
      operatingHours:"",
      breweryImage:"",
      brewerId: 0, 
    }, 
    users: [], 
    singleUser: {
      userId: 0, 
      username: "", 
      passwordHash: "", 
      role:"", 
      emailAddress: "", 
      request: ""
    }
  },
  mutations: {
    SET_AUTH_TOKEN(state, token) {
      state.token = token;
      localStorage.setItem('token', token);
      axios.defaults.headers.common['Authorization'] = `Bearer ${token}`
    },
    SET_USER(state, user) {
      state.user = user;
      console.log(user)
      localStorage.setItem('user',JSON.stringify(user));
      state.isAuthenticated = true;
    },
    LOGOUT(state) {
      localStorage.removeItem('token');
      localStorage.removeItem('user');
      state.token = '';
      state.user = {};
      axios.defaults.headers.common = {};
      state.isAuthenticated = false
    },
    SET_LIKE_BEERS(state, liked){
      state.likedBeers.unshift(liked);
    },
    SET_USER_LIKED(state, liked){
      state.userLiked.unshift(liked);
    },
    SET_USER_LIKED_CREATED(state, liked){
      state.userLiked = [],
      state.userLiked.unshift(liked);
    },
    DELETE_USER_LIKED(state, beerId){
      state.userLiked = state.userLiked.filter(beer=>{
      return beer.beerId != beerId;
    });
  },
    SET_LIKE_BREWERIES(state, liked){
      state.likedBreweries.unshift(liked);
    },
    DELETE_LIKE_BREWERIES(state, breweryId){
        state.likedBreweries = state.likedBreweries.filter(brewery=>{
          
        console.log(state.likedBreweries + "Delete Brewery mutation")
        return brewery.breweryId != breweryId;   
      });
    },
     DELETE_LIKE_BEERS(state, beerId){
        state.likedBeers = state.likedBeers.filter(beer=>{
        return beer.beerId != beerId;
      });
    },
    SET_BREWERY(state, brewery) {
      state.brewery = brewery;
    },
    SET_BREWERY_ARRAY(state, data) {
      state.breweries = data.slice().reverse();
    },
    SET_BEER(state, beer){
      state.beer = beer;
    },
    SET_BEERS_ARRAY(state, data) {
      state.beers = data;
    },
    ADD_BEER_TO_ARRAY(state,data){
      state.beers.push(data)
    },
    SET_BEER_REVIEWS_ARRAY(state, data){
      state.beerReviews = data.slice().reverse();
    },
    SET_BREWERIES_REVIEWS_ARRAY(state, data){
      state.breweryReviews = data.slice().reverse();
    },
    SET_API_BREWERIES(state, data){
      state.apiBreweries = data
    },
    SET_API_BREWERY(state, apiBrewery){
      state.apiBrewery = apiBrewery
    },
    SET_LOGIN_MODAL(state){
      state.showLoginModal = !state.showLoginModal
    },
    SET_REGISTER_MODAL(state){
      state.showRegisterModal = !state.showRegisterModal
    },
    SET_LOGOUT_MODAL(state){
      state.showLogoutModal = !state.showLogoutModal
    },
    SET_REGISTRATION(state){
      state.registrationSuccess = !state.registrationSuccess
    },
    DELETE_BEER_FROM_ARRAY(state, data){
      const beer = state.beers.filter(d => d.id !== data.beerId)
      console.log(beer)
      state.beers = beer
    }, 
    SET_USERS(state, users){
      state.users = users
    }, 
    SET_SINGLE_USER(state, singleUser) {
      state.singleUser = singleUser
    }, 
    SET_ROLE(state, data) {
      state.singleUser = data;
    }, 
    DELETE_BREWERY(state, id) {
      state.breweries = state.breweries.filter(brewery=>{
        return brewery.breweryId != id;
      });
    }
  }, 
  actions: {
    getApiBreweries ({ commit }) {
      axios.get('https://api.openbrewerydb.org/v1/breweries')
      .then(response => {
        const apiBreweries = response.data.map (apiBrewery => {
          return {
            breweryId: apiBrewery.id,
            breweryName: apiBrewery.name,
            phoneNumber: apiBrewery.phone, 
            emailAddress: '', 
            address: apiBrewery.street + ' '+ apiBrewery.city + ', ' + apiBrewery.state + ' ' + apiBrewery.postal_code,
            breweryHistory: apiBrewery.website_url,
            operatingHours: '',
            breweryImage: '',
            longitude: apiBrewery.longitude,
            latitude: apiBrewery.latitude,
            fromThirdParty: true
          }
       })
       return apiBreweries; 
      })
      .then(apiBreweries => {
        commit('SET_API_BREWERIES', apiBreweries)
      })
      .catch(error => {
        console.error("Breweries not found", error)
      })
    },
    getApiBrewery ({ commit }, breweryId) {
      console.log(breweryId)
      axios.get(`https://api.openbrewerydb.org/v1/breweries/${breweryId}`)
      .then(response => {
        const apiBrewery = {
            breweryId: response.data.id,
            breweryName: response.data.name,
            phoneNumber: response.data.phone, 
            emailAddress: '', 
            address: `${response.data.street}, ${response.data.city}, ${response.data.state}, ${response.data.postal_code}`,
            breweryHistory: response.data.website_url,
            operatingHours: '',
            breweryImage: '',
            longitude: response.data.longitude,
            latitude: response.data.latitude,
            fromThirdParty: true
          }
          commit('SET_API_BREWERY', apiBrewery)
        })
        .catch(error => {
          console.error("Error fetching brewery:", error)
      })
    },
    getBeersByBrewery({commit}, breweryId) {
        axios.get(`/breweries/${breweryId}/beers`)
        .then((response) => {
          commit("SET_BEERS_ARRAY", response.data);
        })
        .catch((error) => {
          if (error.response && error.response.status === 404) {
            alert("Beer Not Available");
          }
        });
    },
    addBeersByBrewery({commit}, payload) {
     
      BeerService.createBeerById(payload)
      .then((response) => {
        console.log(response)
        commit('ADD_BEER_TO_ARRAY', response.data)
      })
      .catch((error) => {
        if (error.response && error.response.status === 404) {
          alert("Beer Not Available");
        }
      })
    },
    deleteBeerByBrewery({commit}, payload) {
      
      BeerService.deleteBeerFromBrewery(payload)
      .then((response) => {
        commit('DELETE_BEER_FROM_ARRAY', payload)
        console.log(response.data)
      })
      .catch((error) => {
        if (error.response && error.response.status === 404) {
          alert("Beer Not Deleted");
        }
      })
    }
  },
  getters :{
    isAuthenticated(state) {
      if(state.token != ""){
        // && state.user.role === "user" goin to try to integrate auth based on role
        return true
      }else {
        return false
      }
    },
    isBrewer(state) {
      if(state.isAuthenticated){
        let result = state.user.authorities.filter(d => d.name === 'ROLE_ADMIN')
        if(result.length > 0){
          return true
        }else {
          return false
        }
      }
      
    },
    isManager(state) {
      if(state.isAuthenticated){
        console.log(state.user.authorites)
        let result = state.user.authorities.filter(d => d.name === 'ROLE_MANAGER')
        console.log(result)
        if(result.length > 0){
          return true
        }else {
          return false
        }
      }

    }
  }
})
