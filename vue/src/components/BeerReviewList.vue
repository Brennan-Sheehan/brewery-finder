<template>
  <div>
    <review
      v-for="review in GET_BEER_REVIEWS"
      :key="review.id"
      :review="review"
    />
  </div>
</template>

<script>
import { mapActions, mapGetters } from "vuex";

import review from "./ReviewComponent.vue";
export default {
  name: "BeerReviewList",
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
    ...mapGetters("reviewModule", ["GET_BEER_REVIEWS"]),
  },

  methods: {
    ...mapActions("reviewModule", ["getBeerReviews"]),
  },
  mounted() {
    this.getBeerReviews(this.$route.params.beerId);
  },
};
</script>

<style></style>
