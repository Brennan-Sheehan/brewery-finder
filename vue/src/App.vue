<template>
  <div id="app">
    <div id="nav">
      <nav-bar/>
    </div>
    <router-view />
  </div>
</template>

<script>
import NavBar from "./components/Navigation.vue"
import BreweryService from './services/BreweryService'

export default {
  components: {
    NavBar
  },
  methods: {
    getBreweries() {
      BreweryService.getBreweries()
      .then(response => {
        this.$store.commit('SET_BREWERY_ARRAY', response.data)
      })
      .catch(error => {
        if(error.response && error.reponse.status === 404) {
          alert(
            "Brewery Not Available"
            )
        }
      })
    },
    
  },
  created(){
    this.getBreweries()
  }
}
</script>

<style>
.app {
  font-family: 'Montserrat', sans-serif;
}
</style>