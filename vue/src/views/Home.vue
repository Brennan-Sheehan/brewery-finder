<template>
  <div class="home">
    <div class="header-container">
  
      <img src="../assets/front-page-image.png" alt="">
    
      
      <div class="header-search">
        
        <h1 class="tagline">TAP INTO TASTE!</h1>
        <h4 class="lower-tagline">Search the world of beer with your ultimate brewery companion</h4>
        <div class="form">
          <input type="text" style="width: 350px" v-model="search" placeholder="Brewery Name or Location" @input="applyFilter" />
          <button style="margin-left:1rem" type="submit">Search</button>
        </div>
        
      </div>
    </div>
    <main class="main-container">
      <div class="featured-title">
        <h1>Beer Buddy Breweries</h1>
      </div>
      <div class="brewery-container">
        
          <brewery-card
            v-for="card in visibleBreweries"
            v-bind:key="card.breweriesId"
            v-bind:card="card"
          />
        
        
      </div>
    </main>
  </div>
</template>

<script>
import BreweryCard from '../components/BreweryCard.vue'
import breweryService from "../services/BreweryService"
export default {
  name: "home",
  props: ['card'],
  components: {
    BreweryCard,
  },
  data() {
    return {
      search: '',
      filteredBreweries: [],
      userLiked:{},
      likedBreweries: [],
    }
  },
  computed: {
    breweries(){
      return this.$store.state.breweries
    }, 
    visibleBreweries() {
      return this.filteredBreweries.length > 0 ? this.filteredBreweries : this.breweries;
    }
  },
  methods: {
    applyFilter() {
      const search = this.search.toLowerCase();
      this.filteredBreweries = this.breweries.filter(brewery => {
        if (brewery && brewery.breweryName && brewery.address) {
        const nameMatch = brewery.breweryName.toLowerCase().includes(search); 
        const addressMatch = brewery.address.toLowerCase().includes(search); 
        return nameMatch || addressMatch; 
        }
        return false;
      }); 
    }
  },
  created(){
      this.$store.state.likedBreweries = [];
    breweryService.getLikedBreweries(this.$store.state.user).then((response) => {
      response.data.forEach((element) => {
        this.userLiked.userId = this.$store.state.user.id;
        this.userLiked.breweryId = element.breweryId;
        this.$store.commit("SET_LIKE_BREWERIES", this.userLiked);
        this.userLiked = {};
      });
    });
  }
};
</script>

<style scoped>

.header-container {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 35rem; 
  background: rgba(36, 36, 36, 0.479) 
 
}


img{
  object-fit: cover;
	height: 100%;
	width: 100%;
  z-index: -1;
}

.header-search {
  display: flex;
  flex-direction: column;
  position: absolute;
  align-items: center;
}

.header-search > h1 {
  font-size: 4rem;
  margin-bottom: 2rem;
  color:#f1f1f1;
  text-shadow: rgba(17,21,20,255) 0 3px 0;
}

.header-search > h4 {
  font-size: 1.5rem;
  margin-top: 0rem;
  margin-bottom: 3rem;
  color: #f1f1f1;
  text-shadow: rgba(17,21,20,255) 0 3px 0;
}

.form {
  display: flex;
  align-items: center;
  font-size: 1.2em;
}
input, button {
  border: 1px solid rgba(164,165,170,255);
  border-radius: 5px;
  font-size: inherit;
  box-sizing: content-box;
  padding: 0.2em;
  margin: 0.1em 0.2em;
}
button {
  background: #F14F29;
}
.featured-title {
  text-align: center;
}
main {
  display: flex;
  padding: 1.875rem 1.25rem;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  gap: 1.875rem;
}
.main > h1 {
  color: rgba(164,165,170,255)
}

.brewery-container {
  display: flex;
  width: 80%;
  align-items: center;
  justify-content: center;
  gap: 3rem;
  flex-wrap: wrap;
}
@media screen and (max-width:767px){
  .header-search > h1 {
    font-size: 2rem;
  }
  .form {
    flex-direction: column;
    align-items: flex-start;
    justify-content: center;
    margin: 0;
    gap: 5px;
  }
  input, button {
  height: 30px;
}
  
}

@media screen and (max-width:480px){
  body{
    padding: 0;
  }
  
}
</style>
