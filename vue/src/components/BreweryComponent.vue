<template>
  <div class="brewery">
    <div class="brewery-header-container">
      <img :src="GET_BREWERY.breweryImage" />
      <div class="brewery-details-container">
        <div class="brewery-details">
          <h1 class="brewery-name">{{ GET_BREWERY.breweryName }}</h1>
          <div class="contact">
            <div class="brewery-contact-info">
              <div>
                {{ GET_BREWERY.phoneNumber }}
              </div>
              {{ GET_BREWERY.address }}
            </div>
            <div class="brewery-store-hours">
              {{ GET_BREWERY.operatingHours }}
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
            v-for="card in GET_BEERS"
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
            <div class="lower-address">{{ GET_BREWERY.address }}</div>
            <div class="lower-phone">{{ GET_BREWERY.phoneNumber }}</div>
            <div class="lower-emailAddress">{{ GET_BREWERY.emailAddress }}</div>
            <div class="lower-hours">{{ GET_BREWERY.operatingHours }}</div>
          </div>
        </div>

        <div class="right-column">
          <div class="brewery-description">
            <h2>Brewery Description</h2>
            <div class="brewery-description-content">
              {{ GET_BREWERY.breweryHistory }}
            </div>
          </div>

          <div class="rating">
            <div class="brewery-rating"></div>
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
                  v-bind:breweryId="GET_BREWERY.breweryId"
                  @close="showForm = false"
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
import BeerCard from "../components/BeerCard.vue";
import breweryReviewForm from "./BreweryReviewForm.vue";
import BreweryReview from "../components/BreweryReviewList.vue";
import WebDisplay from "./WebDisplay.vue";
import { mapActions, mapGetters, mapMutations } from "vuex";

export default {
  name: "BreweryComponent",
  props: ["card"],
  data() {
    return {
      userLiked: {},
      showForm: false,
      brewery: {},
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
    ...mapGetters("breweryModule", ["GET_BREWERY"]),
    ...mapGetters("beerModule", ["GET_BEERS"]),
    ...mapGetters("userModule", ["GET_USER"]),
  },

  methods: {
    ...mapMutations("breweryModule", ["SET_BREWERY"]),
    ...mapActions("breweryModule", ["getBreweryById"]),
    ...mapActions("beerModule", ["getBeersByBrewery"]),
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
      setTimeout(() => {
        let stringArray = this.GET_BREWERY.address.split(", ");
        // now have 3 strings
        let address = stringArray[0];
        this.ADDRESS = address.replaceAll(" ", "-");

        let city = stringArray[1];
        this.CITY = city.replaceAll(" ", "-");

        let stateZip = stringArray[2];
        this.STATE = stateZip.split(" ")[0];
        this.ZIPCODE = stateZip.split(" ")[1];

        this.url = `https://www.google.com/maps/embed/v1/place?key=AIzaSyDAr-1vasBNPlrlbWwgbW4tP8_sqQFva8c&q=${this.STATE}+${this.CITY}+${this.ZIPCODE}+${this.ADDRESS}`;

        return null;
      }, 1000);
    },
  },
  updated() {
    this.breweryUrl();
  },
  mounted() {
    this.getBreweryById(this.$route.params.breweryId);
    this.getBeersByBrewery(this.$route.params.breweryId);
    this.contentScrollWidth = this.$refs.content.scrollWidth;
    this.contentScrollLeft = this.$refs.content.scrollLeft;
  },
};
</script>

<style scoped>
  @media screen and (min-width: 300px) {
    
    #btn-left,
#btn-right {
  transition: all 0.4s ease-out 0s;
  font-weight: 600;
  border-radius: 6px;
  width: 60px;
  color: transparent;
  border: none;
}
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
  width: 100vw;
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



.material-icons-outlined {
  font-size: 24px;
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
  width: 100%;
  padding-left: 20px;
  padding-right: 20px;
}
.left-section {
  width: 100%;
}

.right-section {
  width: 100%;
}

    .brewery{
      overflow: hidden;
      width:100%;
    }


.right-column {
  margin-right: 4rem;
}
  }

/* Media query for desktop layout */
@media screen and (min-width: 770px) {
  .left-column {
    margin-left: 4rem;
  width: 100%;
}
.right-column {
  margin-right: 4rem;
}
  .brewery{
    overflow: hidden;
    width: 100%;
  }
  main {
    display: grid;
    grid-template-columns: 1fr 2fr;
    gap: 60px;
    padding-left: 15px;
    padding-right: 15px;
    max-width: 100vw;
    justify-content: center;
  }
  .bottom-container {
    align-items: center;
    justify-content: center;
  }
  .brewery-details {
    max-width: 50%;
  }
  .material-icons-outlined {
    font-size: 48px;
  }
  .carousel {
  display: flex;
  align-items: center;
  border-radius: 10px;
  width:60rem;
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
.carousel {
  display: flex;
  align-items: center;
  border-radius: 10px;
  width:80rem;
}
}




  /* .brewery-header-container {
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
  width:80rem;
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
main {
    display: grid;
    grid-template-columns: 1fr 2fr;
    gap: 60px;
    padding-left: 15px;
    padding-right: 15px;
    max-width: 100vw;
    width: 95vw;
    justify-content: center;
  }
} */

</style>





