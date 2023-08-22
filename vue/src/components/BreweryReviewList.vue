<template>
  <div>
    <review
      v-for="review in GET_BREWERY_REVIEWS"
      :key="review.id"
      :review="review"
    />
  </div>
</template>

<script>
import Review from "../components/ReviewComponent";
import { mapActions, mapGetters } from "vuex";
export default {
  props: ["brewery"],
  components: {
    Review,
  },
  computed: {
    ...mapGetters("reviewModule", ["GET_BREWERY_REVIEWS"]),
  },
  methods: {
    ...mapActions("reviewModule", ["getBreweryReviews"]),
  },
  created() {
    this.getBreweryReviews(this.$route.params.breweryId);
  },
};
</script>

<style></style>
