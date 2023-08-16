import axios from "axios"

export default {

    getUsers() {
        return axios.get('/manager/users')
    }, 

    getUserById(userId) {
        return axios.get(`/manager/users/${userId}`)
    }, 

    updateBrewery(Brewery) {
        return axios.put(`/manager/breweries/${Brewery.breweryId}`, Brewery)
    }, 

    updateRole(payload) {
        return axios.put(`/manager/users/${payload.user.id}/${payload.role}`)
    }, 
    
    updateBrewer(Brewery) {
        return axios.put(`/manager/breweries/${Brewery.breweryId}`, Brewery)
    },

    deleteUser(userId) {
        return axios.delete(`/manager/users/${userId}`)
    },    

    deleteBrewery(breweryId) {
        return axios.delete(`/manager/breweries/${breweryId}`)
    }

}

