<template>
  <div>
    <main>
      <div class="loading" v-if="isLoading">
        <img src="../assets/beer_loader.gif" />
      </div>
      <section class="top-section">
        <div class="image-wrapper">
          <div class="image-container">
            <img :src="beer.image" alt="" />
          </div>
        </div>
        <div class="content">
          <h1>{{ beer.beerName }}</h1>
          <div class="beer-type">
            {{ beer.beerType }}
          </div>
          <div>{{ beer.abv }}% ABV</div>
        </div>

        <div class="review-button">
          <button
            v-show="false"
            v-on:click.prevent="showForm = false"
            v-if="showForm"
          >
            Write a Review
          </button>
          <button v-on:click.prevent="showForm = true" v-else>
            Write a Review
          </button>
          <beer-review-form
            v-show="showForm"
            v-bind:beerId="this.beer.beerId"
          />
        </div>
      </section>
      <section class="bottom-section">
        <div>
          <h3>Tasting Notes</h3>
          {{ beer.tastingNotes }}
        </div>
        <!-- {{beer.averageRating}} -->
        <div>
          <h3>Descripion</h3>
          {{ beer.description }}
        </div>
        <div>
          <h3>Reviews</h3>
          <beer-review-list v-bind:beer="beer" />
        </div>
      </section>
    </main>
  </div>
</template>

<script>
import beerService from "../services/BeerService";
import BeerReviewList from "./BeerReviewList.vue";
import beerReviewForm from "./BeerReviewForm.vue";

export default {
  name: "BeerComponent",
  components: { BeerReviewList, beerReviewForm },
  data() {
    return {
      isLoading: true,
      beer: this.$store.state.beer,
      showForm: false,
      aboutName: "",
    };
  },
  mounted() {
    setTimeout(() => {
      this.isLoading = false;
    }, 2000);
  },
  computed: {
    beerGetter() {
      return this.$store.state.beer;
    },
  },
  watch: {
    beerGetter: {
      deep: true,
      handler: function (newBeer) {
        this.beer = newBeer;
      },
    },
  },
  methods: {
    getBeer() {
      beerService
        .getBeerById(this.$route.params.beerId)
        .then((response) => {
          this.$store.commit("SET_BEER", response.data);
        })
        .catch((error) => {
          if (error.response && error.response.status === 404) {
            alert("Beer not available");
          }
        });
    },
  },
  created() {
    this.getBeer();
  },
};
</script>

<style scoped>
.loading {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
  z-index: 9999;
  background-color: rgba(15, 65, 58, 0.87);
}

main {
  margin: 0 auto;
  padding-top: 200px;
  max-width: 900px;
}

.image-wrapper {
  display: flex;
  justify-content: center;
  margin-bottom: 20px;
}

.image-container {
  max-width: 200px;
}

img {
  max-width: 100%;
  height: auto;
}

section {
  background-color: #fff;
  border: 1px solid #ddd;
  border-radius: 5px;
  padding: 20px;
  margin-bottom: 20px;
}

.top-section {
  display: flex;
}

h1 {
  font-size: 24px;
  margin-bottom: 10px;
}

div {
  margin-bottom: 10px;
}

.bottom-section {
  font-size: 16px;
  background-color: #f8f9fa;
}

.beer-type {
  color: #666;
}

.content {
  display: flex;
  flex-direction: column;
  padding: 40px;
  position: relative;
}
.content > div:nth-child(3) {
  font-weight: bold;
}

.review-button {
  margin-top: auto;
  margin-left: auto;
}

.review-button button {
  text-align: right;
  margin: 0;
  font-size: 15px;
  background-color: #484848;
  color: white;
  padding: 18px 40px;
  border-radius: 4px;
}
@media screen and (max-width: 480px) {
  .top-section {
    flex-direction: column;
  }
}

@media (max-width: 768px) {
  .image-wrapper {
    flex-direction: column;
    align-items: center;
  }

  .image-container {
    max-width: 100%;
  }
}
</style>
