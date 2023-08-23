<template>
  <div class="user-page">
    <div class="welcome">
      <h1>WELCOME, {{ this.GET_USER.username.toUpperCase() }}!</h1>
      <div class="description">
        <h3>
          Below you can view all of your favorite Breweries and Beers. Cheers,
          Beer Buddy!
        </h3>
      </div>
    </div>
    <div class="main-page">
      <div class="left-section">
        <h3>Favorited Breweries</h3>
        <div class="fav-breweries">
          <div class="brewery-container">
            <brewery-card
              v-for="card in GET_LIKED_BREWERIES"
              v-bind:key="card.breweriesId"
              v-bind:card="card"
            />
          </div>
        </div>
      </div>

      <div class="right-section">
        <div class="fav-beers">
          <h3>Favorited Beers</h3>

          <div class="beer-container">
            <beer-card
              v-for="card in GET_LIKED_BEERS"
              v-bind:key="card.beerId"
              v-bind:card="card"
            />
          </div>
        </div>
      </div>
    </div>
    <div class="footer">
      <div class="delete"></div>
    </div>
  </div>
</template>

<script>
import BreweryCard from "../components/BreweryCard.vue";
import BeerCard from "../components/BeerCard.vue";

import { mapGetters } from "vuex";

export default {
  components: { BreweryCard, BeerCard },
  data() {
    return {
      user: this.GET_USER,
      search: "",
      filteredBreweries: [],
      filteredBeers: [],
    };
  },
  computed: {
    ...mapGetters("breweryModule", ["GET_LIKED_BREWERIES"]),
    ...mapGetters("beerModule", ["GET_LIKED_BEERS"]),
    ...mapGetters("userModule", ["GET_USER"]),

    visibleBreweries() {
      return this.filteredBreweries.length > 0
        ? this.filteredBreweries.slice(0, 4)
        : this.breweries.slice(0, 4);
    },
    visibleBeers() {
      return this.filteredBeers.length > 0
        ? this.filteredBeers.slice(0, 4)
        : this.beers.slice(0, 4);
    },
  },
  filters: {
    uppercase(value) {
      return value.toUpperCase();
    },
  },
  methods: {
    applyFilter() {
      const search = this.search.toLowerCase();
      this.filteredBreweries = this.breweries.filter((brewery) => {
        if (brewery && brewery.breweryName && brewery.address) {
          const nameMatch = brewery.breweryName.toLowerCase().includes(search);
          const addressMatch = brewery.address.toLowerCase().includes(search);
          return nameMatch || addressMatch;
        }
        return false;
      });
    },
    applyBeerFilter() {
      const search = this.search.toLowerCase();
      this.filteredBeers = this.beers.filter((beer) => {
        if (beer && beer.beerName) {
          const nameMatch = beer.beerName.toLowerCase().includes(search);
          return nameMatch;
        }
        return false;
      });
    },
  },
};
</script>

<style scoped>
.main-page {
  display: flex;
  justify-content: center;
}
.welcome {
  display: flex;
  padding-top: 8rem;
  padding-left: 3rem;
}
.description {
  display: flex;
  margin-top: 9rem;
  margin-bottom: 3rem;
  margin-right: 15rem;
}
.fav-breweries {
  display: flex;
}
.left-section {
  margin-right: 8rem;
  border: 1px solid rgba(0, 0, 0, 0.116);
  padding: 2rem;
}
.right-section {
  display: flex;
  border: 1px solid rgba(0, 0, 0, 0.116);
  padding: 2rem;
}
.beer-container {
  padding-bottom: 1rem;
}
.brewery-container {
  padding-bottom: 1rem;
  align-items: space-between;
}
@media screen and (max-width: 767px) {

  .description {
  display: flex;
  margin-top: 9rem;
  margin-bottom: 3rem;
  margin-right: 0rem;
  margin-left: -10rem;
}
  .left-section {
  margin-right: 1rem;
  border: 1px solid rgba(0, 0, 0, 0.116);
  padding: 2rem;
}

@media screen and (max-width: 480px) {
  .description {
  display: flex;
  margin-top: 9rem;
  margin-bottom: 3rem;
  margin-right: 0rem;
  margin-left: -12rem;
}

.main-page{
  display: flex;
  flex-direction:column;
}
  .left-section {
  display: flex;
  flex-direction: column;
  border: 1px solid rgba(0, 0, 0, 0.116);
  padding: 2rem;
  margin-left: 1rem;
}

.right-section {
  display: flex;
  flex-direction: column;
  margin-right:1rem;
  border: 1px solid rgba(0, 0, 0, 0.116);
  padding: 2rem;
  margin-left: 1rem;
}
.beer-container {
  padding-bottom: 1rem;
  align-items: space-between;
  margin-right:1.8rem;
}
.brewery-container {
  padding-bottom: 1rem;
  align-items: space-between;
}

}
}
</style>
