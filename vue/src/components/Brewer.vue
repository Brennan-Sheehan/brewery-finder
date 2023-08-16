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
          <button class="edit-button" v-if="editing" @click="saveChanges">
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
                v-bind:brewery="brewery"
                v-if="showModal"
                @close="showModal = false"
              >
                <template v-slot:body> Hello, modal! </template>
              </CreateBeerModal>

              <BeerCard
                v-for="card in beers"
                v-bind:key="card.beerId"
                v-bind:card="card"
                class="beer-card"
              >
              </BeerCard>
            </ul>
            <div id="delete" class="beer-list" v-else>
              <form class="delete-form" @submit="deleteBeerByBrewery({breweryId: brewery.breweryId, beerId: getBeerId(selectedCard)})">
                <select name="beer-card-select" v-model="selectedCard">
                <option v-for="card in beers" :key="card.beerId">
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
import brewerService from "../services/BreweryService";
import CreateBeerModal from "../components/CreateBeerModal.vue";
import BeerCard from "../components/BeerCard.vue";
import { mapActions } from "vuex";

export default {
  name: "Brewery-Profile",

  data() {
    return {
      brewery: {
        breweryId: "",
        name: "",
        phoneNumber: "",
        emailAddress: "",
        address: "",
        breweryHistory: "",
        operatingHours: "",
        breweryImage: "",
        longitude: "",
        latitude: "",
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
    beers() {
      return this.$store.state.beers;
    },
  },
  methods: {
    ...mapActions(["getBeersByBrewery", "deleteBeerByBrewery"]),
    getBeerId(name) {
      const beer = this.$store.state.beers.find(d => d.beerName === name)
      console.log(this.$store.state.beers.find(d => d.beerName === name))
      return beer.beerId
    },
    saveChanges() {
      //API call to save the brewery to the database. Should probably do a put?
      if (this.postBrewery) {
        // Create a neww brewery in the back end
        brewerService
          .createBrewery(this.brewery)
          .then((response) => {
            if (response.status === 201) {
              alert("Brewery Create");
              this.postBrewery = false;
            }
          })
          .catch((error) => {
            if (error.response && error.response.status === 404) {
              alert("Brewery not Created");
            }
          });
      } else {
        // update existing brewery
        brewerService
          .updateBrewery(this.brewery)
          .then((response) => {
            if (response.status === 201) {
              alert("Brewery Create");
            }
          })
          .catch((error) => {
            if (error.response && error.response.status === 404) {
              alert("Brewery not Created");
            }
          });
      }
      this.editing = false;
      alert("Brewery Profile changes saved!");
    },
    cancelChanges() {
      // Reset the data to the original state
      this.editing = false;
    },
  },
  created() {
    // Initialize brewery data when creating element
    // use this to call in the brewery data if there is any set to "originalBrewery"
    // set to false so we know we arent creating a new one

    brewerService
      .getBreweryByBrewerId(this.$route.params.brewerId)
      .then((response) => {
        if (response.data.breweryId > 0) {
          this.createButton = false;
          this.originalBrewery = response.data;
          this.brewery = response.data;
          this.getBeersByBrewery(response.data.breweryId);
        }
      })
      .catch((error) => {
        if (error.response && error.response.status === 404) {
          alert("no brewery found");
        }
      });
  },
};
</script>

<style scoped>
.brewery-profile {
  display: flex;
  justify-content: center;
  padding-top:100px;
  background-color: #f1f1f1;
}
.title {
  display: flex;
  flex-direction: column;
  align-items: flex-start;
}
.edit-button {
  border: 1px solid rgba(110, 110, 110, 0.274);
  border-radius: 5px;
  font-size: 20px;
  box-sizing: content-box;
  padding: 0.2em;
  margin: 0.1em 0.2em;
  background: #f14f29;
}
.condition {
  max-width: 1000px;
}
.header {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
}

img {
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
  background-color: #f1f1f1;
  padding: 10px;
  border-radius: 5px;
  box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
  margin: 0;
  margin-bottom: 15px;
  width: 90%;
}

.info-field {
  background-color: #f1f1f1;
  padding: 10px;
  border-radius: 5px;
  box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
  margin: 10px;
  margin-bottom: 15px;
}

.info-field label {
  font-weight: bold;
  margin-bottom: 5px;
  display: block;
}
input {
  background-color: #f1f1f1;
  padding: 10px;
  border-radius: 5px;
  box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
  margin: auto;
  margin-bottom: 15px;
}
.info-field input {
  width: 90%;
  padding: 10px;
}

.right-section textarea {
  height: fit-content;
  min-height: 200px;
  width: 90%;
  align-items: flex-start;
  background-color: #f1f1f1;
}

.brewery-actions {
  margin-top: 20px;
  text-align: center;
}

.brewery-actions > button {
  margin: 0 10px;
  padding: 10px 20px;
  color: #f1f1f1;
  border: none;
  cursor: pointer;
}

.brewery-actions > button:hover {
  background-color: #353631;
}
.add-beer {
  box-shadow: 1rem 1rem 4rem rgba(71, 74, 95, 0.623);
  border-radius: 4px;
  width: 100%;
  height: 60px;
  margin: 0;
  border: none;
  margin-bottom: 15px;
}
.material-icons-outlined {
  width: 40px;
}
.beer-card {
  position: relative;
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
.delete-form{
  display: flex;
  gap: 10px;
  align-items: center;
}

/* Media Queries */
@media (min-width: 390px) {
  .left-section,
  .right-section {
    width: 100%;
  }
}

@media (min-width: 768px) {
  .info-field {
    width: calc(80% - 10px);
  }
  #brewery-history {
    width: 94%;
    min-height: 100px;
    margin: 0;
    margin-bottom: 30px;
  }

  #brewery-image {
    width: calc(86% - 10px);
  }
  img {
    width: calc(88% - 10px);
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

  .body {
    flex-direction: row;
    justify-content: flex-start;
    margin-left: 40px;
    margin-right: 40px;
  }
  .add-beer {
    height: 270px;
    width: 300px;
    margin-bottom: 0;
  }
}

@media (min-width: 1024px) {
  .beer-list {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 10px;
    width: initial;
  }
  #brewery-history .info-field {
    width: initial;
    min-height: 200px;
  }
  #brewery-image {
    width: calc(100% - 20px);
  }
  img {
    width: 100%;
  }

  .title {
    flex-direction: row;
    justify-content: space-between;
  }
}
</style>
