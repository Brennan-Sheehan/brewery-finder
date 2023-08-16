<template>
  <div class="main-brewery-card">
    <router-link :to="{ name: 'brewery', params: { breweryId: card.breweryId } }">
      <div class="card-container">
        <div class="card-content">
          <div class="image-mask">
            <img :src="card.breweryImage" alt="brewery1" class="card-image" />
          </div>
          <div class="card-info">
            <div class="name">{{ card.breweryName }}</div>
            <div class="beer-details">
              <div>{{ card.address }}</div>
              <div>{{ card.phoneNumber }}</div>
            </div>
                
          </div>
          <div class="footer">
    <div v-if="card.averageRating >0" class="star-ratings">
  <div class="fill-ratings" :style="{ width: (card.averageRating / 5 * 100).toFixed(2) + '%' }">
    <span>★★★★★</span>
  </div>
  <div class="empty-ratings">
    <span>★★★★★</span>
  </div>
  <span
    :class="{
      'filled-hearts': isLiked,
      'empty-hearts': !isLiked,
    }"
    @click.prevent="toggleLike(isLiked)"
    style="cursor: pointer"
  >
    ♥
  </span>
</div>
<div v-else class="no-review">
  <div class="no-review-text">
    Add Review
  </div>
  <span
    :class="{
      'filled-hearts': isLiked,
      'empty-hearts': !isLiked,
    }"
    @click.prevent="toggleLike(isLiked)"
    style="cursor: pointer"
  >
    ♥
  </span>
</div>
</div>
        </div>
        
      </div>
    </router-link>
  </div>
</template>

<script>
import breweryService from '../services/BreweryService'
export default {

  props: ["card"],
  data(){
    return{
 liked: {
        breweryId: this.card.breweryId,
        userId: this.$store.state.user.id,
      },
      userLiked: {},
    };
    },
  computed: {
    isLiked() {
      let likedBrewery = this.$store.state.likedBreweries.find((brewery) => {
        if (brewery.breweryId == this.card.breweryId) {
          return brewery;
        }
      });
      if (likedBrewery === undefined) {
        return false;
      } else if (this.card.breweryId === likedBrewery.breweryId) {
        return true;
      } else {
        return false;
      }
    },
  },
   methods: {
    toggleLike(isLiked) {
      if (!isLiked) {
        breweryService
          .addLikedBrewery(this.card.breweryId, this.$store.state.user.id)
          .then((response) => {
            if (response.status === 202) {
              if (!this.$store.state.likedBreweries.includes(this.liked)) {
                this.$store.commit("SET_LIKE_BREWERIES", this.liked);
              }
            }
          })
          .catch((error) => {
            this.errorMsg = "Could not add brewery" + error.response.status;
          });
      } else {
        breweryService.deleteLikedBrewery(this.$store.state.user.id, this.card.breweryId).then((response) => {
        if (response.status === 200){
        this.$store.commit("DELETE_LIKE_BREWERIES", this.card.breweryId);
          }
        })
        .catch((error) => {
          this.errorMsg = "Could not delete" + error.response.status;
        });
      }
    },
  },
  created() {
    // breweryService.getLikedBreweries(this.$store.state.user).then((response) => {
    //   response.data.forEach((element) => {
    //     this.userLiked.userId = this.$store.state.user.id;
    //     this.userLiked.breweryId = element.breweryId;
    //     this.$store.commit("SET_LIKE_BREWERIES", this.userLiked);
    //     this.userLiked = {};
    //   });
    // });
  }
};
</script>

<style scoped>
.main-brewery-card {
  box-shadow: 1rem 1rem 4rem rgba(71, 74, 95, 0.623);
  border-radius: 4px;
  overflow: hidden;
  height: 200px;
  width: 350px; 
}

.card-container {
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  background: #f1f1f1;
  overflow: hidden;
  position: relative;
  height: 100%; 
  width: 100%;
}
.footer {
  display: flex;
  text-decoration:none;
  color: #e7711b;
  text-align: left;
  width: 100%;
  margin-top: 2rem;
  margin-left: 0.625rem;
  margin-bottom: 0.3rem;
}

.card-content {
  height: 100%; 
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}

.image-mask {
  object-fit: cover;
  height: 85%;
  background-color: black;
}
.card-image {
  object-fit: cover;
  height: 100%; 
  width: 100%;
  opacity: 0.4;
}

.no-review {
  color: #ccc;
position: absolute;
  position: relative;
  margin: 0;
  padding: 0;
  text-decoration: none;
  font-size: 2rem;
  padding-bottom: 0.2rem;
}

.no-review-text{
  font-size: 1rem;
  color: #e7711b;
  text-decoration: none;
}
.filled-hearts {
  background-image: linear-gradient(red, red);
  background-clip: text;
  -webkit-background-clip: text;
  color: transparent;
  position: absolute;
  top: 0;
  left: 300px;
}
.empty-hearts {
  position: absolute;
  top: 0;
  left: 300px;
  padding-top: .22rem;
}
.card-info {
  display: flex;
  flex-direction: column;
  align-items: flex-start;
  position: absolute;
  padding: 1rem;
  color: rgba(241, 241, 241, 255);
  font-size: 16px;
  overflow: auto;
  margin-top: 15%;
}

.beer-details {
  display: flex;
  flex-direction: column;
  justify-content: flex-end;
  align-items: flex-start;
  align-self: stretch;
  font-size: 12px;
  text-shadow: rgba(0, 0, 0, 0.8) 0 1px 0;
}

.name {
  margin: 0 0 0.5em;
  font-size: 20px;
  font-weight: 600;
  text-shadow: rgba(0, 0, 0, 0.8) 0 1px 0;
}

.footer {
  display: flex;
  text-align: left;
  margin-top: 0.3rem;
  margin-left: 1rem;
  margin-bottom: 0.3rem;
}

.icon-star-empty {
  margin-right: 5px;
  color: #ffb400;
  font-weight: 500;
  position: relative;
  font-size: 15px;
}


.icon-star-empty {
  margin-right: 5px;
  color: #ffb400;
  font-weight: 800;
  font-size: 16px;
}
.icon-star {
  margin-right: 10px;
  color: #ffb400;
  font-weight: 800;
  font-size: 16px;
}
.star-ratings {
  unicode-bidi: bidi-override;
  color: #ccc;
  font-size: 30px;
  position: relative;
  margin: 0;
  padding: 0;
}
  .fill-ratings {
    color: #e7711b;
    padding: 0;
    position: absolute;
    z-index: 1;
    display: block;
    top: 0;
    left: 0;
    overflow: hidden;
  }
   
    span {
      display: inline-block;
    }
  
  .empty-ratings {
    padding: 0;
    display: block;
    z-index: 0;
  }
</style>
