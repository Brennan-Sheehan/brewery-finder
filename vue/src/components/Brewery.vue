<template>
  <div class="brewery">
    <div class="brewery-header-container">
      <img :src="brewery.breweryImage" />
      <div class="brewery-details-container">
        <div class="brewery-details">
          <h1 class="brewery-name">{{ brewery.breweryName }}</h1>
          <div class="contact">
            <div class="brewery-contact-info">
              <div>
                {{ brewery.phoneNumber }}
              </div>
              {{ brewery.address }}
            </div>
            <div class="brewery-store-hours">
              {{ brewery.operatingHours }}
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="bottom-container">
      <div class="carousel">
        <button id="btn-left" @click="scrollContent(false)">
          <span class="material-icons-outlined"> arrow_back_ios_new </span>
        </button>
        <div class="beer-container" id="con" ref="content">
          <beer-card
            v-for="card in beers"
            v-bind:key="card.beerId"
            v-bind:card="card"
          />
        </div>
        <button id="btn-right" @click="scrollContent(true)">
          <span class="material-icons-outlined"> arrow_forward_ios </span>
        </button>
      </div>
      <main>
        <div class="left-column">
          <!-- <div class="map-container">Possible Map</div> -->
          <WebDisplay v-bind:webPageUrl="url" />
          <div class="lower-contact">
            <div class="lower-address">{{ brewery.address }}</div>
            <div class="lower-phone">{{ brewery.phoneNumber }}</div>
            <div class="lower-emailAddress">{{ brewery.emailAddress }}</div>
            <div class="lower-hours">{{ brewery.operatingHours }}</div>
          </div>
        </div>

        <div class="right-column">
          <div class="brewery-description">
            <h2>Brewery Description</h2>
            <div class="brewery-description-content">
              {{ brewery.breweryHistory }}
            </div>
          </div>

          <div class="rating">
            <div class="brewery-rating">
              {{ brewery.rating }}
            </div>
          </div>
          <div class="rating">
            <div class="brewery-rating"></div>
            <div class="form">
              <div class="review-button">
                <button
                  v-show="false"
                  v-on:click="showForm = false"
                  v-if="showForm"
                >
                  Write a Review
                </button>
                <button v-on:click.prevent="showForm = true" v-else>
                  Write a Review
                </button>
                <brewery-review-form
                  v-show="showForm"
                  v-bind:breweryId="this.brewery.breweryId"
                />
              </div>
            </div>

            <div class="reviews">
              <h2>Reviews</h2>
              <div class="review-content"><BreweryReview /></div>
            </div>
          </div>
        </div>
      </main>
    </div>
  </div>
</template>

<script>
import breweryServices from "../services/BreweryService";
import BeerCard from "../components/BeerCard.vue";
import beerService from "../services/BeerService";
import breweryReviewForm from "./BreweryReviewForm.vue";
import BreweryReview from "../components/BreweryReviewList.vue";
import WebDisplay from "./WebDisplay.vue";

export default {
  name: "brewery",
  props: ["card"],
  data() {
    return {
      userLiked: {},
      brewery: this.$store.state.brewery,
      showForm: false,
      url: "",
      STATE: "",
      CITY: "",
      ZIPCODE: "",
      ADDRESS: "",
      contentScrollWidth: 0,
      contentScrollLeft: 0,
    };
  },
  components: {
    BeerCard,
    breweryReviewForm,
    BreweryReview,
    WebDisplay,
  },
  computed: {
    breweryGetter() {
      return this.$store.state.brewery;
    },
    beers() {
      return this.$store.state.beers;
    },
  },

  watch: {
    breweryGetter: {
      deep: true,
      handler: function (newBrewery) {
        this.brewery = newBrewery;
      },
    },
  },
  methods: {
    getBrewery() {
      breweryServices
        .getBreweryById(this.$route.params.breweryId)
        .then((response) => {
          this.$store.commit("SET_BREWERY", response.data);
        })
        .catch((error) => {
          if (error.response && error.response.status === 404) {
            alert("Brewery Not Available");
          }
        });
    },
    //   updateAverageRating(newAverage) {
    //   this.averageRating = newAverage;
    // },
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
    },
    scrollContent(isRight) {
      if (isRight) {
        this.contentScrollLeft += 500;
        if (this.contentScrollLeft >= this.contentScrollWidth) {
          this.contentScrollLeft = this.contentScrollWidth;
        }
      } else {
        this.contentScrollLeft -= 500;
        if (this.contentScrollLeft <= 0) {
          this.contentScrollLeft = 0;
        }
      }
      this.$refs.content.scrollLeft = this.contentScrollLeft;
    },
    breweryUrl() {
      let stringArray = this.brewery.address.split(", ");
      // now have 3 strings
      let address = stringArray[0];
      this.ADDRESS = address.replaceAll(" ", "-");

      let city = stringArray[1];
      this.CITY = city.replaceAll(" ", "-");

  //     let stateZip = stringArray[2];
  //     this.STATE = stateZip.split(" ")[0];
  //     this.ZIPCODE = stateZip.split(" ")[1];

      this.url = `https://www.mapquest.com/us/${this.STATE}/${this.CITY}/${this.ZIPCODE}/${this.ADDRESS}`;

      return null;
    },
  },
  created() {
    this.getBrewery();
    this.getBeers();
         this.$store.state.userLiked = [];
             beerService.getLikedBeers(this.$store.state.user).then((response) => {
      response.data.forEach((element) => {
      //  this.$store.state.userLiked = [];
        this.userLiked.userId = this.$store.state.user.id;
        this.userLiked.beerId = element.beerId;

        this.$store.commit("SET_USER_LIKED", this.userLiked);
        this.userLiked = {};
      });
    });
  },
  updated() {
    this.breweryUrl();
  },
  mounted() {
    this.contentScrollWidth = this.$refs.content.scrollWidth;
    this.contentScrollLeft = this.$refs.content.scrollLeft;
  },
};
</script>

<style scoped>
.brewery-header-container {
  display: flex;
  justify-content: center;
  align-items: flex-end;
  height: 35rem;
  background: rgba(36, 36, 36, 0.479);
}

img {
  object-fit: cover;
  height: 100%;
  width: 100%;
  z-index: -1;
}

.brewery-details-container {
  display: flex;
  flex-direction: column;
  position: absolute;
  padding-left: 15px;
  padding-right: 15px;
  margin-bottom: 5rem;
  text-shadow: rgba(0, 0, 0, 0.8) 0 2.5px 0;

}

.review-button button {
  display: flex;
  text-align: right;
  font-size: 15px;
  background-color: #484848;
  color: white;
  padding: 18px 40px;
  border-radius: 4px;
}

.form .review-button button {
  display: flex;
  flex-direction: column;
}

.brewery-details {
  display: flex;
  flex-direction: column;
  color: #f1f1f1;

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

.bottom-container {
  display: flex;
  flex-direction: column;

}

.carousel {
  display: flex;
  align-items: center;
  border-radius: 10px;

}

.material-icons-outlined {
  font-size: 24px;
}

#btn-left,
#btn-right {
  transition: all 0.4s ease-out 0s;
  font-weight: 600;
  border-radius: 6px;
  width: 60px;
  color: #f14f29;
  background-color: #f1f1f1;
  border: none;

}

.beer-container {
  display: flex;
  align-items: center;
  gap: 2rem;
  overflow-x: auto;
  margin-top: 2rem;
  margin-bottom: 2rem;
  padding: 40px;
  border: 1px solid #48484828;
  border-radius: 10px;

}

.map-container {
  margin-bottom: 4rem;
}

.lower-contact {
  color: rgba(241, 79, 41, 255);
  margin-top: 4rem;
}

.lower-address,
.lower-phone,
.lower-emailAddress,
.lower-hours {
  margin-bottom: 1rem;
}

.brewery-description-content {
  font-size: 1rem;
  margin-bottom: 3rem;
}



main {
  display: flex;
  flex-direction: column;
  justify-content: center;
  width: inherit;
  padding-left: 20px;
  padding-right: 20px;
}
.left-section {
  width: 100%;
}

.right-section {
  width: 100%;
}

/* Media query for desktop layout */
@media screen and (min-width: 770px) {
  main {
  display: grid;
  grid-template-columns: 1fr 3fr;
  gap: 60px;
  padding-left: 15px;
  padding-right: 15px;
  max-width: 1000px;
  width: max-content;
  justify-content: center;
}
.bottom-container{
  align-items: center;
  justify-content: center;
}
.brewery-details{
  max-width: 50%;
}
.material-icons-outlined {
  font-size: 48px;
}
}
</style>

