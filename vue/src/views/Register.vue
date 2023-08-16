<template>
  <transition name="modal">
    <div class="modal-mask">
      <div class="modal-wrapper">
        <div class="modal-container">
          <div class="modal-header">
            <h1 class="title">Add Job</h1>
          </div>
          <div class="modal-body">
            <div id="register" class="text-center">
              <form @submit.prevent="register">
                <h1>Create Account</h1>
                <div class="alert" role="alert" v-if="registrationErrors">
                  {{ registrationErrorMsg }}
                </div>
                <div class="form-input-group">
                  <label for="username">Username</label>
                  <input
                    type="text"
                    id="username"
                    v-model="user.username"
                    required
                    autofocus
                  />
                </div>
                <div class="form-input-group">
                  <label for="password">Password</label>
                  <input
                    type="password"
                    id="password"
                    v-model="user.password"
                    required
                  />
                </div>
                <div class="form-input-group">
                  <label for="confirmPassword">Confirm Password</label>
                  <input
                    type="password"
                    id="confirmPassword"
                    v-model="user.confirmPassword"
                    required
                  />
                </div>
                <div class="form-input-group">
                  <label for="email">Email</label>
                  <input type="text" id="email" v-model="user.email" required />
                </div>

                <p>
                  <a @click="goToLogin()"> Already have an account? Log in. </a>
                </p>
                <div class="modal-footer">
                  <input
                    class="button"
                    value="Cancel"
                    @click="$emit('close')"
                  />
                  <button class="save" type="submit">Submit</button>
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
import authService from "../services/AuthService";

export default {
  name: "register",
  data() {
    return {
      user: {
        username: "",
        password: "",
        confirmPassword: "",
        email: "",
        role: "user",
      },
      registrationErrors: false,
      registrationErrorMsg: "There were problems registering this user.",
    };
  },
  methods: {
    register() {
      this.user.username = this.user.username.toLowerCase();
      if (this.user.password != this.user.confirmPassword) {
        this.registrationErrors = true;
        this.registrationErrorMsg = "Password & Confirm Password do not match.";
      } else {
        authService
          .register(this.user)
          .then((response) => {
            if (response.status == 201) {
              this.$store.commit("SET_REGISTRATION");
              this.$emit("close");
              this.$store.commit("SET_LOGIN_MODAL");
            }
          })
          .catch((error) => {
            const response = error.response;
            this.registrationErrors = true;
            if (response.status === 400) {
              this.registrationErrorMsg = "Bad Request: Validation Errors";
            }
          });
      }
    },
    clearErrors() {
      this.registrationErrors = false;
      this.registrationErrorMsg = "There were problems registering this user.";
    },
    goToLogin() {
      this.$emit("close");
      this.$store.commit("SET_LOGIN_MODAL");
    },
  },
};
</script>

<style scoped>
.form-input-group {
  display: flex;
  flex-direction: column;
  margin-bottom: 1rem;
  text-align: left;
}

a {
  cursor: pointer;
}

label {
  font-size: 14px;
  font-weight: 600;
  color: #363949;
  margin-bottom: 2px;
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
  margin: 0 auto;
  padding: 10px 20px;
  padding-bottom: 10px;
  background-color: #f6f6f9;
  border-radius: 5px;
  box-shadow: 0 2rem 3rem rgba(132, 139, 200, 0.18);
  transition: all 0.3s ease;
  z-index: 20;
}

h1 {
  color: #363949;
  font-size: 16px;
  font-weight: 600;
  margin-bottom: 10px;
}

p {
  color: #363949;
  font-size: 18px;
  font-weight: 400;
}

.modal-header {
  height: 40px;
  align-items: center;
  justify-content: center;
  display: flex;
  flex-shrink: 0;
  border-bottom: 1px solid rgba(25, 4, 69, 0.1);
}
.modal-body{
  max-height: 600px;
}
.modal-footer {
  display: flex;
  height: 40px;
  align-items: flex-end;
  justify-content: flex-end;
  border-top: 1px solid rgba(25, 4, 69, 0.1);
  padding: 5px 10px;
}
.save {
  background-color: #f14f29;
  color: #fff;
  margin-left: 10px;
}
button,
.button {
  cursor: pointer;
  caret-color: transparent;
  text-decoration: none;
  box-sizing: border-box;
  display: inline-flex;
  align-items: center;
  justify-content: center;
  transition: all 0.4s ease-out 0s;
  text-align: center;
  font-weight: 600;
  border-radius: 6px;
  padding: 0 8px;
  height: 28px;
  font-size: 13px;
  color: #f14f29;
  background-color: #fff;
  border: 1px solid rgba(25, 4, 69, 0.2);
  width: 68px;
}
</style>

