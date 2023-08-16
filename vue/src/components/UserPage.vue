<template>
  <div class="user-page">
    <div class="welcome">
      <h1>WELCOME, {{ user.username.toUpperCase() }}!</h1>
      <div class="description">
        <h3>
          Below you can view all of your favorite Beers and Breweries. Cheers,
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
              v-for="card in this.$store.state.likedBreweries"
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
              v-for="card in $store.state.userLiked"
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
import beerService from "../services/BeerService";
import breweryService from "../services/BreweryService";

export default {
  components: { BreweryCard, BeerCard },
  data() {
    return {
      user: this.$store.state.user,
      search: "",
      filteredBreweries: [],
      filteredBeers: [],
      userLiked: {},
    };
  },
  computed: {
    breweries() {
      return this.$store.state.breweries;
    },
    beers() {
      console.log(this.$store.state.beers);
      return this.$store.state.beers;
    },
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
          console.log(this.beers);
          const nameMatch = beer.beerName.toLowerCase().includes(search);
          return nameMatch;
        }
        return false;
      });
    },
    gettingBeers() {
      beerService
        .getBeers()
        .then((response) => {
          console.log(response.data);
          this.$store.commit("SET_LIKE_BEERS", response.data);
        })
        .catch((error) => {
          if (error.response && error.response.status === 404) {
            alert("Beer Not Available");
          }
        });
    },
    getLikedBeers() {
      this.$store.state.userLiked = [];
      beerService.getLikedBeers(this.$store.state.user).then((response) => {
        response.data.forEach((element) => {
          //  this.$store.state.userLiked = [];
          this.userLiked.userId = this.$store.state.user.id;
          this.userLiked.beerId = element.beerId;
          this.userLiked.beerId = element.beerId;
          this.userLiked.beerName = element.beerName;
          this.userLiked.abv = element.abv;
          console.log(element);
          this.userLiked.image = element.image;

          this.$store.commit("SET_USER_LIKED", this.userLiked);

          this.userLiked = {};
        });
      });
      // this.$store.state.userLiked = this.$store.state.LikedBeers
    },
  },

  //  updated() {
  //   this.getLikedBeers();
  // },
  created() {
    // this.gettingBeers();
    this.getLikedBeers();
    this.$store.state.likedBreweries = [];
    breweryService
      .getLikedBreweries(this.$store.state.user)
      .then((response) => {
        response.data.forEach((element) => {
          this.userLiked.userId = this.$store.state.user.id;

          this.userLiked.breweryId = element.breweryId;
          this.userLiked.breweryImage = element.breweryImage;
          this.userLiked.breweryName = element.breweryName;
          this.userLiked.address = element.address;
          this.userLiked.phoneNumber = element.phoneNumber;
          this.$store.commit("SET_LIKE_BREWERIES", this.userLiked);
          this.userLiked = {};
        });
      });
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
/* .welcome {
  text-align: center;
  margin-bottom: 1rem;
}

.left-section,
.right-section {
  width: 50%;
}

.left-section {
  width: 35%;
  display: flex;
  flex-direction: column;
  align-items: flex-start;
  background-color: #f1f1f1;
}
.right-section {
  width: 35%;
  display: flex;
  flex-direction: column;
  align-items: flex-end;
  background-color: #f1f1f1;
}

.right-section,
.left-section {
  height: fit-content;
  min-height: 200px;
  width: 90%;
  align-self: center;
  background-color: #f1f1f1;
}

.footer {
  display: flex;
  flex-direction: column;
  align-self: flex-end;
  text-align: center;
  margin-top: 1rem;
  padding: 1rem;
  background-color: #333;
  color: #fff;
}

.fav-breweries,
.fav-beers {
  padding: 5rem;
}

.brewery-container {
  /* Add any specific styling for the brewery card container if needed */
/* } */

/* .brewery-name {
  margin-right: 10px;
}

.brewery-image {
  width: 20px;
  height: 20px;
} */

/* Add any additional styles for your brewery-card component here */
</style>