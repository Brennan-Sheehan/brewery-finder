<template>
  <div class="search-container">
    <div class="search-header">
      <h1>Didn't find what you were looking for?</h1>
      <h3>We got your back! Search through breweries throughout the US.</h3>
      <div class="form">
        <input
          type="text"
          style="width: 350px"
          v-model="search"
          placeholder="Brewery Name or Location"
          @input="applyFilter"
        />
        <button type="submit">Search</button>
      </div>
    </div>
    <main class="main-container">
      <div class="search-results">
        <api-brewery-card
          v-for="apiCard in visibleApiBreweries"
          v-bind:key="apiCard.apiBreweriesId"
          v-bind:apiCard="apiCard"
        />
      </div>
    </main>
  </div>
</template>

<script>
import { mapActions, mapGetters } from "vuex";
import ApiBreweryCard from "./ApiBreweryCard.vue";

export default {
  name: "ApiSearch",
  props: ["card"],
  components: {
    ApiBreweryCard,
  },
  data() {
    return {
      search: "",
      filteredApiBreweries: [],
    };
  },
  computed: {
    ...mapGetters("breweryModule", ["GET_API_BREWERIES"]),
    // apiBreweries() {
    //   return this.$store.state.apiBreweries;
    // },
    visibleApiBreweries() {
      return this.filteredApiBreweries.length > 0
        ? this.filteredApiBreweries
        : this.GET_API_BREWERIES;
    },
  },
  methods: {
    ...mapActions("breweryModule", ["getApiBreweries"]),
    applyFilter() {
      const search = this.search.toLowerCase();
      this.filteredApiBreweries = this.GET_API_BREWERIES.filter(
        (apiBrewery) => {
          if (apiBrewery && apiBrewery.breweryName && apiBrewery.address) {
            const nameMatch = apiBrewery.breweryName
              .toLowerCase()
              .includes(search);
            const addressMatch = apiBrewery.address
              .toLowerCase()
              .includes(search);
            return nameMatch || addressMatch;
          }
          return false;
        }
      );
    },
  },
  mounted() {
    this.getApiBreweries();
    this.applyFilter();
  },
};
</script>

<style scoped>
.search-container {
  background-color: rgba(53, 54, 49, 255);
}

.search-header {
  height: 18rem;
  text-align: center;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  color: rgba(241, 241, 241, 255);
}

.search-header > h1 {
  margin: 0.5rem;
  margin-top: 12rem;
  font-size: 2rem;
  color: #f1f1f1;
  text-shadow: rgba(17, 21, 20, 255) 0 3px 0;
}

.search-header > h3 {
  font-size: 1.8rem;
  margin-top: 1rem;
  margin-bottom: 3rem;
  color: #f1f1f1;
  text-shadow: rgba(17, 21, 20, 255) 0 3px 0;
}

main {
  display: flex;
  padding: 1.875rem 1.25rem;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  gap: 1.875rem;
}

.search-results {
  display: flex;
  width: 80%;
  align-items: center;
  justify-content: center;
  gap: 3rem;
  flex-wrap: wrap;
  margin-top: 10rem;
}

.form {
  display: flex;
  flex-direction: column;
  align-items: flex-start;
  font-size: 1.2em;
}

input,
button {
  border: 1px solid rgba(164, 165, 170, 255);
  border-radius: 5px;
  font-size: inherit;
  box-sizing: content-box;
  margin: 0.5rem;
}
input {
  max-width: 20rem;
}
button {
  background: #f14f29;
}

@media (min-width: 769px) {
  .form {
    flex-direction: row;
  }
}
</style>
