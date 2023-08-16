import axios from 'axios'

export default {

    getBeersByBreweryId(breweryId) {
        return axios.get(`/breweries/${breweryId}/beers`)
    },

    getBeerById(beerId) {
        return axios.get(`/beers/${beerId}`)
    },

    createBeerById(payload) {
        return axios.post(`/breweries/${payload.breweryId}/beers`, payload.beer)
    },

    deleteBeerFromBrewery(payload) {
        return axios.delete(`/breweries/${payload.breweryId}/beers/${payload.beerId}`)
    },
    getBeers(){
        return axios.get(`/beers`)
    },
    addLikedBeer(beerId,userId){
        return axios.post(`/beers/${beerId}/users/${userId}`)
    },
    getLikedBeers(user){
        return axios.get(`/users/${user.id}/beers`)
    }, 
    deleteLikedBeer(userId,beerId){
        return axios.delete(`/users/${userId}/beers/${beerId}`)
    }
    
}