<template>
  <div class="main-api-brewery-card">
    <router-link
      :to="{ name: 'api-brewery', params: { breweryId: apiCard.breweryId } }"

    > 
      <div class="card-container">
        <img
          :src="apiCard.breweryImage"
          alt="brewery1"
          contain
          height="150px"
          width="300px"
        />
        <div class="card-info">
          <div>
            <div class="name">
              {{ apiCard.breweryName }}
            </div>
            <div class="brewery-details">
              <div>
                {{ apiCard.address }}
              </div>
              <div>
                {{ apiCard.phoneNumber }}
              </div>
            </div>
          </div>
        </div>
      </div>
    </router-link>
  </div>
</template>

<script>
export default {
  props: ["apiCard"],
};
</script>

<style scoped>
.main-brewery-card {
  box-shadow: 1rem 1rem 4rem rgba(71, 74, 95, 0.623);
  border-radius: 4px;
  overflow: hidden;
}
.card-container {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  background: rgba(36, 36, 36, 0.479); 
  overflow: hidden;
  position: relative;
  
}
img {
  object-fit: cover;
  z-index: -1; 
}

.card-info {
  display: flex;
  flex-direction: column;
  align-items: center;
  position: absolute;
  padding: 0.625rem;
  color: rgba(241,241,241,255);
  font-size: 16px;
  overflow: auto;
 
  
}

.rating {
  display: flex;
  flex-direction: column;
  align-items: flex-end;
  align-self: stretch;
}

.brewery-details {
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
  width: 100%;
  margin-top: 0.3rem;
  margin-left: 3rem;
  margin-bottom: 0.3rem;
  
}
.icon-star-empty {
  margin-right: 5px;
  color: #ffb400;
  font-weight: 500;
  position: relative;
  font-size: 12px;
}
</style>