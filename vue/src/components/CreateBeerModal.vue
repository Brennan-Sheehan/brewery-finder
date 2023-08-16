<template>
  <transition name="modal">
    <div class="modal-mask">
      <div class="modal-wrapper">
        <div class="modal-container">
          <div class="modal-header">
            <h1 class="title">Add A Beer To Your Brewery!</h1>
          </div>
          <div class="modal-body">
            <div id="add-beer">
              <form @submit="addBeersByBrewery({breweryId:brewery.breweryId, beer:beer }), $emit('close')">
                <h1>Please add beer information {{brewery.breweryId}}</h1>
                <div class="alert" role="alert" v-if="invalidInput">
                  Invalid username and password!
                </div>
                <div class="alert" role="alert" v-if="this.$store.state.registrationSuccess">
                  Thank you for registering, please sign in.
                </div>
                <div class="form-input-group">
                  <label for="beerName">Beer Name:</label>
                  <input
                    type="text"
                    id="beerName"
                    v-model="beer.beerName"
                    required
                    autofocus
                  />
                </div>
                <div class="form-input-group">
                  <label for="description">Description:</label>
                  <input
                    type="text"
                    id="description"
                    v-model="beer.description"
                    required
                  />
                </div>
                <div class="form-input-group">
                  <label for="beerType">Beer Type:</label>
                  <input
                    type="text"
                    id="beerType"
                    v-model="beer.beerType"
                    required
                  />
                </div>
                <div class="form-input-group">
                  <label for="tastingNotes">Tasting Notes:</label>
                  <input
                    type="text"
                    id="tastingNotes"
                    v-model="beer.tastingNotes"
                    required
                  />
                </div>
                <div class="form-input-group">
                  <label for="abv">ABV:</label>
                  <input
                    type="text"
                    id="abv"
                    v-model="beer.abv"
                    required
                  />
                </div>
                <div class="form-input-group">
                  <label for="image">Image URL:</label>
                  <input
                    type="text"
                    id="image"
                    v-model="beer.image"
                    required
                  />
                </div>
                
                <div class="modal-footer">
                  <input class="button" value="Cancel" @click="$emit('close')"/>
                  <button class="save" type="submit">Add Beer</button>
                  
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </transition>
</template>

<script>
import { mapActions } from 'vuex'

export default {
  name: "create-beer",
  props:['brewery'],
  data() {
      return {
          beer: {
            beerId: '',
            beerName: '',
            description: '',
            rating: 1,
            beerType: '',
            tastingNotes: '',
            abv: 0,
            averageRating: 0,
            image: ''
          },
          invalidInput: false,
      }
  },
  components: {},
  
  methods: {
    ...mapActions(["addBeersByBrewery"])
    //Change invalidInput to true if the server response is 400
  },
};
</script>

<style scoped>
.form-input-group {
  display: flex;
  flex-direction: column;
  margin-bottom: 1rem;
}


label {
  font-size: 14px;
  font-weight: 600;
  color: #363949;
  margin-bottom: 4px;
}
.modal-mask {
  position: fixed;
  z-index: 99;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: #f14e291a;
  display: table;
  transition: opacity 0.3s ease;
}

.modal-wrapper {
  display: table-cell;
  vertical-align: middle;
}

.modal-container {
  width: 300px;
  margin: 0px auto;
  padding: 20px 30px;
  padding-bottom: 40px;
  background-color: #f6f6f9;
  border-radius: 5px;
  box-shadow: 0 2rem 3rem rgba(132, 139, 200, 0.18);
  transition: all 0.3s ease;
  z-index: 20;
}
h1 {
  color: #363949;
  font-size: 32px;
  font-weight: 900;
  margin-bottom: 15px;
}
p {
  color: #363949;
  font-size: 18px;
  font-weight: 400;
}

.router {
  color: #363949;
  font-size: 18px;
  font-weight: 400;
}

.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.5s;
}

.fade-enter,
.fade-leave-to {
  opacity: 0;
}

.slide-enter-active,
.slide-leave-active {
  transition: opacity 0.5s;
}

.slide-enter,
.slide-leave-to {
  opacity: 0;
}
.modal-header {
  height: 40px;
  align-items: center;
  justify-content: center;
  display: flex;
  flex-shrink: 0;
  border-bottom: 1px solid rgba(25, 4, 69, 0.1);
}
.modal-body {
    max-height: 600px;
}
.modal-footer {
  display: flex;
  height: 40px;
  align-items: center;
  justify-content: flex-end;
  border-top: 1px solid rgba(25, 4, 69, 0.1);
  padding: 5px 10px;
}

h1 {
  font-weight: 600;
  font-size: 16px;
  line-height: 23px;
}
div.form-element {
  display: flex;
  flex-direction: row;
}

input {
  position: relative;
  box-sizing: border-box;
  border: 1px solid rgba(25, 4, 69, 0.1);
  padding: 0px 15px;
  box-shadow: 0 2rem 3rem rgba(132, 139, 200, 0.18);
  height: 30px;
  width: 100%;
  align-items: center;
  background-color: rgba(132, 139, 200, 0.18);
  color: 363949;
}
select {
  position: relative;
  box-sizing: border-box;
  border: 1px solid rgba(25, 4, 69, 0.1);
  padding: 0px 15px;
  box-shadow: 0 2rem 3rem rgba(132, 139, 200, 0.18);
  height: 30px;
  width: 100%;
  align-items: center;
  background-color: rgba(132, 139, 200, 0.18);
  color: fff;
}

div.label-style {
  display: flex;
  flex-grow: 1;
  margin: 7px;
}
.label {
  text-align: left;
  font-family: lato;
  letter-spacing: 0px;
  margin: 0px;
  color: 363949;
  font-size: 13px;
  line-height: 18px;
  font-weight: 600;
}
.label-name {
  flex-grow: 1;
  opacity: 1;
  text-align: left;
  font-family: lato;
  letter-spacing: 0px;
  margin: 0px;
  color: 363949;
  font-size: 14px;
  line-height: 18px;
  font-weight: 600;
}

.save {
  background-color: #f14f29;
  color: #fff;
  margin-left: 7px;
}

button {
  cursor: pointer;
  text-overflow: ellipsis;
  white-space: nowrap;
  box-sizing: border-box;
  display: inline-flex;
  flex-direction: row;
  align-items: center;
  justify-content: center;
  letter-spacing: 0px;
  font-family: Lato;
  transition: all 0.4s ease-out 0s;
  text-align: center;
  margin: 0px;
  width: auto;
  font-weight: 600;
  border-radius: 6px;
  padding: 0px 8px;
  height: 28px;
  font-size: 13px;
  color: #f14f29;
  background-color: fff;
  border: 1px solid rgba(25, 4, 69, 0.2);
  width: 68px;
}
.button {
 
  cursor: pointer;
  text-overflow: ellipsis;
  white-space: nowrap;
  box-sizing: border-box;
  display: inline-flex;
  flex-direction: row;
  align-items: center;
  justify-content: center;
  letter-spacing: 0px;
  font-family: Lato;
  transition: all 0.4s ease-out 0s;
  text-align: center;
  margin: 0px;
  width: auto;
  font-weight: 600;
  border-radius: 6px;
  padding: 0px 8px;
  height: 28px;
  font-size: 13px;
  color: #f14f29;
  background-color: fff;
  border: 1px solid rgba(25, 4, 69, 0.2);
  width: 68px;

}
</style>
