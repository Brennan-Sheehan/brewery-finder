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
        v-on:click="createBeerReview()"
      />
      <input type="button" value="Cancel" v-on:click="resetForm()" />
    </div>
  </form>
</template>

<script>
import reviewService from "../services/ReviewService";
export default {
  props: ["review", "beerId"],
  data() {
    return {
      beer: {
        beerId: this.$store.state.beer.beerId,
      },
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

  methods: {
    createBeerReview() {
      this.newReview.beerId = this.beerId;
      reviewService
        .createBeerReview(this.newReview)
        .then((response) => {
          if (response.status === 201) {
            this.$store.state.beerReviews.unshift(this.newReview);
            this.averageRating();
            this.resetForm();
          }
        })
        .catch((error) => {
          this.errorMsg = "Could not save review " + error.response.status;
          alert(this.errorMsg);
        });
    },
    averageRating() {
      let sum = this.$store.state.beerReviews.reduce((currentSum, review) => {
        return currentSum + review.rating;
      }, 0);

      const newAverage = (sum / this.$store.state.beerReviews.length).toFixed(
        2
      );

      this.updateAverageRating(newAverage);
    },
    updateAverageRating(data) {
      this.$store.state.beer.averageRating = data;

      reviewService.updateBeerReview(this.$store.state.beer).catch((error) => {
        if (error.response && error.response.status === 500) {
          this.errorMsg =
            "Could not update average rating " + error.response.status;
          alert(this.errorMsg);
        }
      });
    },
    resetForm() {
      location.reload();
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
