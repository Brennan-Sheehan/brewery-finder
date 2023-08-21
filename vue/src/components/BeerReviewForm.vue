<template>
  <form>
    <div>
      <textarea v-model="newReview.description" placeholder="Review"></textarea>
    </div>
    <select id="rating" v-model.number="newReview.rating" placeholeder="Rating">
      <option value="1">1 Star</option>
      <option value="2">2 Star</option>
      <option value="3">3 Star</option>
      <option value="4">4 Star</option>
      <option value="5">5 Star</option>
    </select>
    <div>
      <input
        class="submit"
        type="submit"
        value="Save"
        v-on:click.prevent="
          createBeerReview({ beerId: GET_BEER.beerId, review: this.newReview });
          resetForm();
        "
      />
      <input type="button" value="Cancel" v-on:click="resetForm()" />
    </div>
  </form>
</template>

<script>
import { mapActions, mapGetters } from "vuex";
export default {
  props: ["review", "beerId"],
  data() {
    return {
      beerReviews: [],
      newReview: {
        reviewId: 0,
        rating: 0,
        description: "",
        breweryId: "",
        username: this.$store.state.user.username,
        userId: this.$store.state.user.id,
      },
    };
  },
  computed: {
    ...mapGetters("reviewModule", ["GET_BEER_REVIEWS"]),
    ...mapGetters("beerModule", ["GET_BEER"]),
  },
  methods: {
    ...mapActions("reviewModule", ["createBeerReview"]),
    ...mapActions("beerModule", ["updateBeerRating"]),
    resetForm() {
      this.newReview = {
        reviewId: 0,
        rating: 0,
        description: "",
        breweryId: "",
        username: this.$store.state.user.username,
        userId: this.$store.state.user.id,
      };
      this.$emit("close");
      this.averageRating();
    },
    averageRating() {
      this.beerReviews = this.GET_BEER_REVIEWS;
      let sum = this.beerReviews.reduce((currentSum, review) => {
        return currentSum + review.rating;
      }, 0);

      const newAverage = (sum / this.beerReviews.length).toFixed(2);
      this.GET_BEER.averageRating = newAverage;
      this.updateBeerRating(this.GET_BEER);
    },
  },
};
</script>

<style>
.icon-star {
  margin-right: 5px;
  color: #ffb400;
  font-weight: 800;
  font-size: 16px;
}
.submit {
  margin-right: 5px;
}
</style>
