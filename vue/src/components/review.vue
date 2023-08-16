<template>
<div class="outer-box">


<!-- <beer-card :computedProp="averageRating">
         <i class="icon-star" v-for="n in review.averageRating" :key="n"></i>
         <i class="icon-star-empty" v-for="n in maxStars - review.averageRating" :key="n"></i>
</beer-card> -->



  <div class="review">
      <div class="review-name">
          {{review.username}}
      </div>
      <div class="review-description">
          {{review.description}}
      </div>
      <div class="star-rating">
         <i class="icon-star" v-for="n in review.rating" :key="n"></i>
         <!-- <i class="icon-star-empty" v-for="n in maxStars - review.rating" :key="n"></i> -->
         </div>
 
  </div>
      </div>
  
 
</template>

<script>
// import BeerCard from './BeerCard.vue'

export default {
//   components: { BeerCard },
data(){
return{
  
}
},
 props: {
    review: {
      type: Object,
      default: () => ({ rating: 0 })
    },
    maxStars: {
      type: Number,
      default: 5
    }
 }
 
}
</script>

<style scoped>
.review {
  background-color: whitesmoke;
  border-radius: 15px;
  border: 2px solid gray;
  padding: 20px;
    border: 1px solid gray;    
}
.review-name{
    font-size: 25px;
    padding-bottom: 10px;
}
.outer-box{
    padding: 5px;
}
.star-rating{
    font-size: 20px;
}
.review-description{
    font-size: 20px;
    padding-bottom: 5px;
}
.icon-star-empty {
  margin-right: 5px;
  color: #ffb400;
  font-weight: 800;
  font-size: 16px;
}
.icon-star {
  margin-right: 5px;
  color: #ffb400;
  font-weight: 800;
  font-size: 16px;
}
</style>