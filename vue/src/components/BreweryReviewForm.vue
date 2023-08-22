<template>
  <div>
    <form>
      <div>
        <textarea
          v-model="newReview.description"
          placeholder="Review"
        ></textarea>
      </div>

      <select
        id="rating"
        v-model.number="newReview.rating"
        placeholeder="Rating"
      >
        <option value="1">1 Star</option>
        <option value="2">2 Star</option>
        <option value="3">3 Star</option>
        <option value="4">4 Star</option>
        <option value="5">5 Star</option>
      </select>

      <div>
        <input
          type="submit"
          value="Save"
          v-on:click.prevent="
            createBreweryReview(this.newReview);
            resetForm();
          "
        />
        <input type="button" value="Cancel" v-on:click="resetForm()" />
      </div>
    </form>
  </div>
</template>

<script>
import { mapActions, mapGetters } from "vuex";

export default {
  props: ["review", "breweryId"],
  name: "review-form",
  data() {
    return {
      breweryReviews: [],
      newReview: {
        reviewId: "",
        rating: 0,
        description: "",
        userId: this.GET_USER_ID,
        breweryId: this.$route.params.breweryId,
        beerId: 0,
        username: this.GET_USER_USERNAME,
      },
    };
  },
  computed: {
    ...mapGetters("reviewModule", ["GET_BREWERY_REVIEWS"]),
    ...mapGetters("breweryModule", ["GET_BREWERY"]),
    ...mapGetters("userModule", [
      "GET_USER",
      "GET_USER_ID",
      "GET_USER_USERNAME",
    ]),
  },
  methods: {
    ...mapActions("reviewModule", ["createBreweryReview"]),
    ...mapActions("breweryModule", ["updateBreweryRating"]),
    resetForm() {
      this.newReview = {
        reviewId: 0,
        rating: 0,
        description: "",
        userId: "",
        breweryId: this.$route.params.breweryId,
        beerId: 0,
        username: "",
      };
      this.$emit("close");
      this.averageRating();
      this.newReview.userId = this.GET_USER_ID;
      this.newReview.username = this.GET_USER_USERNAME;
    },
    averageRating() {
      this.breweryReviews = this.GET_BREWERY_REVIEWS;

      let sum = this.breweryReviews.reduce((currentSum, review) => {
        return currentSum + review.rating;
      }, 0);

      const newAverage = (sum / this.breweryReviews.length).toFixed(2);

      this.GET_BREWERY.averageRating = newAverage;
      this.updateBreweryRating(this.GET_BREWERY);
    },
  },
  mounted() {
    this.newReview.userId = this.GET_USER_ID;
    this.newReview.username = this.GET_USER_USERNAME;
  },
};
</script>

<style>
.icon-star-empty {
  margin-right: 5px;
  color: #ffb400;
  font-weight: 800;
  font-size: 16px;
}
</style>
