<template>
<div>
    <!-- <form
  v-show="showForm == true" 
      v-on:submit.prevent="addNewReview">  -->
         <div class="loading" v-if="!isLoading">
        <img src="https://usagif.com/wp-content/uploads/gif/beer-101.gif" />
      </div>
      <form >       
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
      <input isLoading=true type="submit" value="Save" v-on:click="createBreweryReview()" />
      <input type="button" value="Cancel" v-on:click="resetForm()" />
      </div>
    </form>
  
</div>
</template>

<script>
import BreweryService from '../services/BreweryService'
import reviewService from '../services/ReviewService'
export default {
    props: ['review', 'breweryId'],
    name:"review-form",
    data(){
        return{
           isLoading: true,
          breweryReviews:[],
    newReview:{
      reviewId: '',
      rating: 0,
      description:'',
      userId: this.$store.state.user.id,
      breweryId:0, 
      beerId:0,
      username: this.$store.state.user.username
    }        
        }
    },

    methods:{
        createBreweryReview(){
         
          console.log(this.$store.state.user.username)
          console.log(this.user)
          console.log(this.newReview)
         this.newReview.breweryId = this.breweryId

     reviewService.createBreweryReview(this.newReview).then((response)=>{   
         
  if (response.status === 201){
    console.log("review saved")
     this.$store.state.breweryReviews.unshift(this.newReview)
     this.averageRating();
 this.resetForm()
      }
     }).catch((error)=>{
       this.errorMsg = ("Could not save review "+ error.response.status)
         alert(this.errorMsg)
        console.log("review not created")
     })
       },
 resetForm() {

      location.reload();
    }, 
     averageRating() {
      let sum = this.$store.state.breweryReviews.reduce((currentSum, review) => {
        return currentSum + review.rating;
      }, 0);

      const newAverage = (sum / this.$store.state.breweryReviews.length).toFixed(
        2
      );

      this.updateBreweryRating(newAverage);
      console.log(newAverage)
    },
    updateBreweryRating(data) {
      this.$store.state.brewery.averageRating = data;
      // console.log(this.$store.state.beer.averageRating + "this is average rating")
      // console.log(this.$store.state.beer + " this.beer")
      BreweryService
        .updateBrewery(this.$store.state.brewery)
        .then((response) => {
          console.log(response.data + " This is response data");
        })
        .catch((error) => {
          console.log(error.message);

          if (error.response && error.response.status === 500) {
            console.log("error updating average rating");
          }
        });
    },
    }
}

</script>

<style>
.icon-star-empty {
  margin-right: 5px;
  color: #ffb400;
  font-weight: 800;
  font-size: 16px;
}
</style>