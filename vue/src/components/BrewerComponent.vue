<template>
  <div class="brewery-profile">
    <div class="condition" v-if="createButton">
      <button @click="(createButton = false), (postBrewery = true)">
        Create Brewery
      </button>
    </div>
    <div class="condition" v-else>
      <div class="title">
        <h1>{{ originalBrewery.breweryName }}</h1>
        <div class="brewery-actions">
          <button class="edit-button" v-if="editing" @click="cancelChanges">
            Cancel
          </button>
          <button
            class="edit-button"
            v-if="!editing"
            @click="editing = !editing"
          >
            Edit Brewery
          </button>
          <button
            class="save-button edit-button"
            v-if="editing"
            @click="saveChanges"
          >
            Save Changes
          </button>
        </div>
      </div>

      <div class="info-container">
        <div class="header">
          <img :src="originalBrewery.breweryImage" cover />
          <div id="brewery-image" class="info-field">
            <label>Brewery Image URL:</label>
            <span v-if="!editing">{{ originalBrewery.breweryImage }}</span>
            <input v-else v-model="brewery.breweryImage" />
          </div>
        </div>
        <div class="body">
          <div class="left-section">
            <div class="info-field">
              <label>Brewery Name:</label>
              <span v-if="!editing">{{ originalBrewery.breweryName }}</span>
              <input v-else v-model="brewery.breweryName" />
            </div>
            <div class="info-field">
              <label>Phone Number:</label>
              <span v-if="!editing">{{ originalBrewery.phoneNumber }}</span>
              <input v-else v-model="brewery.phoneNumber" />
            </div>
            <div class="info-field">
              <label>Email:</label>
              <span v-if="!editing">{{ originalBrewery.emailAddress }}</span>
              <input v-else v-model="brewery.emailAddress" />
            </div>
            <div class="info-field">
              <label>Address:</label>
              <span v-if="!editing">{{ originalBrewery.address }}</span>
              <input v-else v-model="brewery.address" />
            </div>
            <div class="info-field">
              <label>Longitude:</label>
              <span v-if="!editing">{{ originalBrewery.longitude }}</span>
              <input v-else v-model="brewery.longitude" />
            </div>
            <div class="info-field">
              <label>Latitude:</label>
              <span v-if="!editing">{{ originalBrewery.latitude }}</span>
              <input v-else v-model="brewery.latitude" />
            </div>
            <div class="info-field">
              <label>Operating Hours</label>
              <span v-if="!editing">{{ originalBrewery.operatingHours }}</span>
              <input v-else v-model="brewery.operatingHours" />
            </div>
          </div>
          <div class="right-section">
            <div id="brewery-history" class="info-field">
              <label>Brewery History</label>
              <span v-if="!editing">{{ originalBrewery.breweryHistory }}</span>
              <textarea v-else v-model="brewery.breweryHistory" />
            </div>
            <ul class="beer-list" v-if="!editing">
              <button class="add-beer" @click="showModal = true">
                <span class="material-icons-outlined"> add_circle </span>
              </button>
              <CreateBeerModal
                v-bind:brewery="GET_BREWERY"
                v-if="showModal"
                @close="showModal = false"
              >
                <template v-slot:body> Hello, modal! </template>
              </CreateBeerModal>

              <BeerCard
                v-for="card in GET_BEERS"
                v-bind:key="card.beerId"
                v-bind:card="card"
                class="beer-card"
              >
              </BeerCard>
            </ul>
            <div id="delete" class="beer-list" v-else>
              <form
                class="delete-form"
                @submit="
                  deleteBeerByBrewery({
                    breweryId: GET_BREWERY.breweryId,
                    beerId: getBeerId(selectedCard),
                  })
                "
              >
                <select name="beer-card-select" v-model="selectedCard">
                  <option v-for="card in GET_BEERS" :key="card.beerId">
                    {{ card.beerName }}
                  </option>
                </select>
                <button class="delete-button" type="submit">Delete</button>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import CreateBeerModal from "../components/BeerCreateModal.vue";
import BeerCard from "../components/BeerCard.vue";
import { mapActions, mapGetters } from "vuex";

export default {
  name: "BrewerComponent",

  data() {
    return {
      brewery: {
        from_third_party: false,
        brewerId: this.$route.params.brewerId,
      },
      originalBrewery: {},
      editing: false,
      createButton: true,
      postBrewery: false,
      showModal: false,
      selectedCard: "",
      option: this.$store.state.beers,
    };
  },
  components: {
    BeerCard,
    CreateBeerModal,
  },
  computed: {
    ...mapGetters("beerModule", ["GET_BEERS"]),
    ...mapGetters("breweryModule", ["GET_BREWERY"]),
  },
  methods: {
    ...mapActions("beerModule", [
      "getBeersByBrewery",
      "deleteBeerByBrewery",
      "addBeerByBrewery",
    ]),
    ...mapActions("breweryModule", [
      "getBreweryByBrewerId",
      "createBrewery",
      "updateBrewery",
    ]),
    getBeerId(name) {
      const beer = this.GET_BEERS.find((d) => d.beerName === name);
      return beer.beerId;
    },
    saveChanges() {
      //API call to save the brewery to the database. Should probably do a put?
      if (this.postBrewery) {
        // Create a new brewery in the back end
        this.createBrewery(this.brewery);
        this.postBrewery = false;
      } else {
        // update existing brewery
        this.updateBrewery(this.brewery);
      }
      this.editing = false;
    },
    cancelChanges() {
      // Reset the data to the original state
      this.editing = false;
    },
  },
  watch: {
    GET_BREWERY: {
      deep: true,
      handler() {
        if (this.GET_BREWERY != null) {
          this.createButton = false;
          this.originalBrewery = this.GET_BREWERY;
          this.brewery = this.GET_BREWERY;
          this.getBeersByBrewery(this.GET_BREWERY.breweryId);
        }
      },
    },
  },
  mounted() {
    this.getBreweryByBrewerId(this.$route.params.brewerId);
  },
};
</script>

<style scoped>
.brewery-profile {
  display: flex;
  justify-content: center;
  background-color: #f1f1f1;
  width: 100%;
}
.title {
  display: flex;
  flex-direction: column;
  align-items: flex-start;
  padding-left: 20px;
}
.edit-button {
  border: 1px solid rgba(110, 110, 110, 0.274);
  border-radius: 5px;
  font-size: 20px;
  box-sizing: content-box;
  background: #f14f29;
}
.condition {
  max-width: 1200px;
  width: 100%;
  margin: 0;
}
.header {
  display: flex;
  flex-direction: column;
  width: 100%;
}

.info-container {
  display: flex;
  flex-direction: column;
  align-items: center;
  flex-wrap: wrap;
  gap: 20px;
  margin-top: 20px;
  margin-bottom: 20px;
}

.body {
  display: flex;
  flex-direction: column;
  justify-content: center;
  width: 100%;
}

.left-section {
  width: 100%;
}

.right-section {
  width: 100%;
}
.beer-list {
  display: flex;
  flex-direction: column;
  background-color: #f1f1f1;
  border-radius: 5px;
  box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
  margin: 20px;
  align-items: center;
  gap: 20px;
}

.info-field {
  background-color: #f1f1f1;
  border-radius: 5px;
  box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
  margin-bottom: 15px;
  margin: 20px;
  padding: 20px;
}
span {
  overflow-wrap: break-word;
}
.info-field label {
  font-weight: bold;
  margin-bottom: 5px;
  display: block;
}
input {
  background-color: #f1f1f1;
  border-radius: 3px;
  margin-bottom: 15px;
  border: 1px solid rgba(0, 0, 0, 0.171);
}
.info-field input {
  width: 90%;
}

.brewery-actions {
  margin-top: 20px;
  text-align: center;
}

.brewery-actions > button {
  padding: 10px 20px;
  color: #f1f1f1;
  border: none;
  cursor: pointer;
}

.save-button {
  margin-left: 10px;
}

.brewery-actions > button:hover {
  background-color: #353631;
}
.add-beer {
  box-shadow: 1rem 1rem 4rem rgba(71, 74, 95, 0.623);
  border-radius: 4px;
  width: 90%;
  height: 60px;
  border: none;
  margin: 10px 20px 15px 20px;
}
.material-icons-outlined {
  width: 40px;
}
.beer-card {
  position: relative;
  max-width: 300px;
}

#delete {
  margin: 20px;
}
.delete-button {
  border: 1px solid rgba(110, 110, 110, 0.274);
  border-radius: 5px;
  font-size: 20px;
  box-sizing: content-box;
  padding: 0.2em;
  margin: 0.1em 0.2em;
  background: #f14f29;
}
.delete-form {
  display: flex;
  gap: 10px;
  align-items: center;
}

.delete-form select {
  margin: 20px;
}

textarea {
  min-width: 300px;
  min-height: 200px;
}

/* Media Queries */

@media (min-width: 768px) {
  .brewery-profile {
    padding-top: 90px;
  }
  #brewery-history {
    min-height: 100px;
    margin: 0;
    margin-bottom: 30px;
    margin-right: 20px;
  }
  #brewery-history.info-field textarea {
    height: min-content;
    width: 430px;
    min-height: 200px;
  }
  .beer-list {
    margin: 0;
  }

  .left-section {
    width: 35%;
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    margin-top: 0;
  }
  .right-section {
    display: flex;
    flex-direction: column;
    justify-content: flex-start;
    align-items: flex-start;
    flex-grow: 1;
  }

  .info-container {
    gap: 20px;
    flex-wrap: nowrap;
  }
  .left-section .info-field {
    margin: 0px 30px 20px 10px;
    width: 200px;
  }
  .body {
    flex-direction: row;
    justify-content: flex-start;
    margin-left: 40px;
    margin-right: 40px;
  }
  .add-beer {
    width: 300px;
    margin: 0;
  }
  #brewery-image {
    margin-left: 10px;
  }
  #delete {
    margin: 0;
    width: 484px;
  }
}

@media (min-width: 1024px) {
  .left-section {
    width: 50%;
  }
  .left-section .info-field {
    width: 80%;
  }
  .beer-list {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 20px;
    margin-right: 10px;
    justify-content: center;
    padding: 20px;
  }
  #brewery-history input {
    width: 100%;
  }
  #brewery-history.info-field textarea {
    width: 730px;
  }

  .add-beer {
    height: 280px;
  }
  .title {
    flex-direction: row;
    justify-content: space-between;
  }
}
</style>
