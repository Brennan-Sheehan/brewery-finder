import axios from 'axios'

export default {

    getBreweries() {
        return axios.get('/breweries')
    },

    getBreweryById(breweryId) {
        return axios.get(`/breweries/${breweryId}`)
    },

    createBrewery(Brewery) {
        return axios.post(`/breweries`, Brewery)
    },

    updateBrewery(Brewery) {
        return axios.put(`/breweries/${Brewery.breweryId}`, Brewery)
    },
    
    getBreweryByBrewerId(brewerId) {
        return axios.get(`/breweries/brewer/${brewerId}`)
    },
    addLikedBrewery(breweryId, userId){
        return axios.post(`breweries/${breweryId}/users/${userId}`)
    },
    getLikedBreweries(user){
        return axios.get(`/users/${user.id}/breweries`)
    },
    deleteLikedBrewery(userId,breweryId){
        return axios.delete(`/users/${userId}/breweries/${breweryId}`)
    }
}