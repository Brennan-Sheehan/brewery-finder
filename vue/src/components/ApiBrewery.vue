<template>
  <div class="apibrewery">
    <div class="brewery-header-container">
      <img src="../assets/beerBuddiesLogo.png" alt="bbl"  />
      <div class="brewery-details-container">
        <div class="brewery-details">
          <h1 class="brewery-name"> {{ apiBrewery.breweryName }} </h1>
          <div class="contact">
            <div class="brewery-contact-info">
              <div>
                {{ apiBrewery.phoneNumber }}
              </div>
              {{ apiBrewery.address }}
            </div>
            <div class="brewery-store-hours">
              {{ apiBrewery.operatingHours }}
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="bottom-container">
      <div class="beer-container">
        <beer-card
          v-for="card in beers"
          v-bind:key="card.beerId"
          v-bind:card="card"
        />
      </div>
      <main>
        <div class="left-column">
          <div class="map-container">Possible Map</div>
          <div class="lower-contact"> 
            <div class="lower-address">{{ apiBrewery.address }}</div>
            <div class="lower-phone">phone</div>
            <div class="lower-emailAddress">{{ apiBrewery.emailAddress }}</div>
            <div class="lower-hours">{{ apiBrewery.operatingHours }}</div>
          </div>
        </div>
        <div class="right-column">
          <div class="brewery-description">
            <h2>Brewery Description</h2>
            {{ apiBrewery.breweryHistory }}
          </div>
        </div>
      </main>
    </div>
    
  </div>
</template>

<script>
import BeerCard from "../components/BeerCard.vue";
import beerService from "../services/BeerService";

export default {
  name: "apiBrewery",
  props: ["apiCard"],
  data() {
    return {
      apiBrewery: this.$store.state.apiBrewery,
      showForm: false,
    };
  },
  components: {
    BeerCard,
  },
  computed: {
    beers() {
      return this.$store.state.beers;
    },
    apiBreweryGetter() {
      return this.$store.state.apiBrewery;
    }
  },
  watch: {
    apibreweryGetter: {
      deep: true,
      handler: function (newApiBrewery) {
        this.apiBrewery = newApiBrewery;
      },
    },
  },
  methods: {
    getBeers() {
      beerService
        .getBeersByBreweryId(this.$route.params.breweryId)
        .then((response) => {
          this.$store.commit("SET_BEERS_ARRAY", response.data);
        })
        .catch((error) => {
          if (error.response && error.response.status === 404) {
            alert("Beer Not Available");
          }
        });
      this.$store.dispatch('getApiBrewery', this.$route.params.breweryId)
    },
  },
   created() {
    this.getBeers();
    
  },
};
</script>

<style scoped>
.brewery-header-container {
  display: flex;
  justify-content: center;
  align-items: flex-end;

  height: 45rem;
  background: rgba(36, 36, 36, 0.479);
}
img {
  object-fit: contain;
  height: 100%;
  width: 100%;
  z-index: -1;
}

.beer-container {
  display: flex;
  width: 80%;
  align-items: center;
  justify-content: center;
  gap: 3rem;
  flex-wrap: wrap;
  margin-top: 5rem;
  margin-bottom: 5rem;
}

.brewery-details-container {
  display: flex;
  flex-direction: row;
  position: absolute;
  padding-left: 15px;
  padding-right: 15px;
  margin-bottom: 5rem;
  min-width: 900px;
  text-shadow: rgba(0, 0, 0, 0.8) 0 2.5px 0;
}
.review-button button {
  text-align: right;
  margin: 0;
  bottom: 0;
  position: absolute;
  right: 0;
  font-size: 15px;
  background-color: #484848;
  color: white;
  padding: 18px 40px;
  border-radius: 4px;
}

.brewery-details {
  display: flex;
  flex-direction: column;
  color: #f1f1f1;
  max-width: 50%;
}

.brewery-details h1 {
  font-size: 34px;
  font-weight: bold;
}
.brewery-contact-info {
  display: flex;
  flex-direction: column;
  line-height: 1.5;
  margin: 1.25em 0;
  font-size: 15px;
}

.bottom-container{
  display: flex;
  flex-direction: column;
  align-items: center;
}
.map-container{
  margin-bottom: 2rem;
}

.lower-contact{
  color: rgba(241,79,41,255);

}
.lower-address {
  margin-bottom: 1rem;

}
.lower-phone {
  margin-bottom: 1rem;

}
.lower-emailAddress {
  margin-bottom: 1rem;

}
.lower-hours {
  margin-bottom: 1rem;

}
.brewery-description-content {
  font-size: 1rem;
  margin-bottom: 1rem;
}
main {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  gap: 10px;
  padding-left: 15px;
  padding-right: 15px;
  max-width: 1000px;
  width: max-content;
  justify-content: center;
  
}
</style>