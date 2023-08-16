<template>
  <div>
  
      <review v-for="review in reviewGetter" :key="review.id" :review="review"/>
     
    
  </div>
</template>

<script>
import reviewService from "../services/ReviewService.js";

import review from "./Review.vue"
export default {
  props: ["brewery"],
  components: {
    review,
   
  },
  data() {
    return {
      beerReviews: this.$store.state.beerReviews,
   
    };
  },
  computed: {
    reviewGetter() {
      return this.$store.state.beerReviews;
    },
  },
  watch: {
    reviewGetter: {
      deep: true,
      handler: function (newReview) {
        this.beerReviews = newReview;
      },
    },
  },
  methods: {
    getBeerReviews() {
        reviewService
          .listReviewsByBeerId(this.$route.params.beerId)
          .then((response) => {
            this.$store.commit("SET_BEER_REVIEWS_ARRAY", response.data);
          })
          .catch((error) => {
            if (error.response && error.response.status === 404) {
              alert("No Reviews for this beer");
            }
          });
      },

  
    
  },
  created() {
      this.getBeerReviews();   
       
  }
};
</script>

<style>

</style>