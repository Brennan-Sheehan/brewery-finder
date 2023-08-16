<template>
  <div>
      
      <review v-for="review in reviewGetter" :key="review.id" :review="review"/>
     
  </div>
</template>

<script>
import reviewService from "../services/ReviewService.js";
import Review from "../components/Review"
export default {
  props: ["brewery"],
  components: {
    Review
  },
  data() {
    return {
      breweryReviews: this.$store.state.breweryReviews,
    };
  },
  computed: {
    reviewGetter() {
      return this.$store.state.breweryReviews;
    },
  },
  watch: {
    reviewGetter: {
      deep: true,
      handler: function (newReview) {
        this.breweryReviews = newReview;
      },
    },
  },
  methods: {
    getBreweryReviews() {
      reviewService
        .listReviewsByBreweryId(this.$route.params.breweryId)
        .then((response) => {
          this.$store.commit("SET_BREWERIES_REVIEWS_ARRAY", response.data);
        })
        .catch((error) => {
          if (error.response && error.response.status === 404) {
            alert("No Reviews for this brewery");
          }
        });
    },
  },
  created() {
      this.getBreweryReviews();
  }
};
</script>

<style>

</style>