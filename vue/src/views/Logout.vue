<template>
  <transition name="modal">
    <div class="modal-mask">
      <div class="modal-wrapper">
        <div class="modal-container">
          <div class="modal-header">
            <h1 class="title logoutbtn">Log Out</h1>
          </div>
 
          <div class="modal-footer">
            <input
              id="cancel"
              class="button"
              value="Cancel"
              @click="$emit('close')"
            />
            <input
              id="log-out"
              class="button"
              value="Log Out"
              @click="logout()"
            />
          </div>
        </div>
      </div>
    </div>
  </transition>
</template>

<script>
export default {
  methods: {
    logout() {
      this.$store.commit("LOGOUT")
      this.$emit('close')
     
      
    }
  }
};
</script>

<style scoped>
.form-input-group {
  display: flex;
  flex-direction: column;
  margin-bottom: 1rem;
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
  height: 100%;
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
  margin-bottom: 15px;
  font-weight: 600;
  font-size: 16px;
  line-height: 23px;
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

.modal-footer {
  display: flex;
  height: 40px;
  align-items: center;
  justify-content: center;
  border-top: 1px solid rgba(25, 4, 69, 0.1);
  padding: 5px 10px;
}

#log-out {
  background-color: #f14f29;
  color: #fff;
  margin-left: 60px;
}

.button {
  cursor: pointer;
  caret-color: transparent;
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