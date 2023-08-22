<template>
  <nav
    id="main"
    class="navigation-menu navigation-container"
    :style="{ backgroundColor: navBarColor }"
    :class="{ onScroll: !view.topOfPage }"
  >
    <div>
      <img src="../assets/beerBuddiesLogo.png" alt="" />
      <a class="site-identity-logo">Beer Buddy</a>
    </div>

    <input type="checkbox" id="toggleMenu" @click="toggleMenu" />
    <label for="toggleMenu"><i class="ri-menu-line" id="toggleIcon"></i></label>
    <section class="main-menu">
      <ul class="navigation-menu__labels">
        <li>
          <router-link @click="resetToggle()" v-bind:to="{ name: 'home' }">
            Home
          </router-link>
        </li>
        <li>
          <router-link
            @click="resetToggle()"
            v-bind:to="{ name: 'external-search' }"
          >
            More Breweries
          </router-link>
        </li>
        <li v-if="isAuthenticated">
          <button
            class="logout-modal"
            @click="SET_LOGOUT_MODAL(), resetToggle()"
          >
            Logout
          </button>
        </li>
        <li v-if="isBrewer">
          <router-link
            @click="resetToggle()"
            :to="{
              name: 'brewer',
              params: { brewerId: GET_USER_ID },
            }"
            >Brewery
          </router-link>
        </li>
        <li v-if="isAuthenticated">
          <router-link
            @click="resetToggle()"
            :to="{
              name: 'userPage',
              params: { userId: GET_USER_ID },
            }"
            >Profile
          </router-link>
        </li>
        <li v-if="isManager">
          <router-link
            @click="resetToggle()"
            :to="{
              name: 'manager-view',
            }"
            >Manager
          </router-link>
        </li>
        <li v-if="!isAuthenticated">
          <button class="login-modal" @click="SET_LOGIN_MODAL(), resetToggle()">
            Login
          </button>
        </li>
        <li v-if="!isAuthenticated">
          <button
            class="register-modal"
            @click="SET_REGISTER_MODAL(), resetToggle()"
          >
            Register
          </button>
        </li>
      </ul>
      <login-modal v-if="GET_LOGIN_MODAL" @close="signinModalClose">
        <template v-slot:body> Hello, modal! </template>
      </login-modal>
      <register-modal v-if="GET_REGISTER_MODAL" @close="registerModalClose">
        <template v-slot:body> Hello, modal! </template>
      </register-modal>
      <logout-modal v-if="GET_LOGOUT_MODAL" @close="logoutModalClose">
        <template v-slot:body> Hello, modal! </template>
      </logout-modal>
    </section>
  </nav>
</template>

<script>
import loginModal from "../views/LoginView.vue";
import registerModal from "../views/RegisterView.vue";
import logoutModal from "../views/LogoutView.vue";
import { mapGetters, mapMutations } from "vuex";

export default {
  name: "NavigationComponent",
  data() {
    return {
      brewer: false,
      manager: false,
      checkbox: false,
      view: {
        topOfPage: true,
      },
    };
  },
  components: {
    loginModal,
    registerModal,
    logoutModal,
  },
  beforeMount() {
    window.addEventListener("scroll", this.handleScroll);
  },
  computed: {
    ...mapGetters("userModule", [
      "isAuthenticated",
      "isBrewer",
      "isManager",
      "GET_REGISTER_MODAL",
      "GET_LOGIN_MODAL",
      "GET_LOGOUT_MODAL",
      "GET_USER_ID",
    ]),
    getCurrentRoute() {
      return this.$route.path;
    },
    navBarColor() {
      if (this.$route.path.match("/beers/")) {
        return "#353631";
      } else if (this.$route.path.match("/breweries/brewer")) {
        return "#353631";
      } else if (this.$route.path.match("/userpage")) {
        return "#353631";
      } else {
        return "";
      }
    },
  },
  // watch: {
  //   isBrewer: {
  //     deep: true,
  //     handler() {
  //       this.brewer = this.isBrewer;
  //     },
  //   },
  //   isManager: {
  //     deep: true,
  //     handler() {
  //       this.manager = this.isManager;
  //     },
  //   },
  // },
  methods: {
    ...mapMutations("userModule", [
      "SET_LOGIN_MODAL",
      "SET_REGISTER_MODAL",
      "SET_LOGOUT_MODAL",
      "SET_REGISTRATION",
      "SET_IS_AUTHENTICATED",
      "SET_MANAGER",
      "SET_BREWER",
    ]),
    handleScroll() {
      if (window.scrollY > 100) {
        if (this.view.topOfPage) this.view.topOfPage = false;
      } else {
        if (!this.view.topOfPage) this.view.topOfPage = true;
      }
    },
    signinModalClose() {
      if (this.getCurrentRoute !== "/") {
        this.$router.push({ name: "home" });
      }
      this.SET_IS_AUTHENTICATED();
      this.SET_LOGIN_MODAL();
    },
    logoutModalClose() {
      if (this.getCurrentRoute !== "/") {
        this.$router.push({ name: "home" });
      }
      this.SET_LOGOUT_MODAL();
    },
    registerModalClose() {
      if (this.getCurrentRoute !== "/") {
        this.$router.push({ name: "home" });
      }
      this.SET_REGISTER_MODAL();
    },
    resetToggle() {
      const menu = document.getElementById("main");
      menu.classList.remove("toggled-true");
      this.checkbox = true;
      this.toggleMenu();
    },
    toggleMenu() {
      this.checkbox = !this.checkbox;

      const toggleMenu = document.getElementById("toggleMenu");
      const menu = document.getElementById("main");

      toggleMenu.checked = this.checkbox;

      toggleMenu.addEventListener("change", function () {
        if (toggleMenu.checked) {
          menu.classList.add("toggled-true");
        } else {
          menu.classList.remove("toggled-true");
        }
      });
    },
  },
};
</script>

<style scoped>
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  margin: 0;
  padding: 0;
  background-color: #fdfefe;
  font-family: "Cambria";
  font-size: 18px;
}

.navigation-container {
  max-width: 100%;
  margin: 0;
  padding: 50px;
  position: fixed;
  z-index: 1;
  width: 100%;
}

.navigation-menu {
  display: flex;
  flex-wrap: wrap;
  align-items: center;
  justify-content: space-between;
  background-color: transparent;
  padding-block: 15px;
}
img {
  height: 60px;
  padding-right: 30px;
}
.toggled-true {
  background-color: rgba(0, 0, 0, 0.548);
}
.onScroll {
  background: black;
}
.navigation-menu a {
  text-decoration: none;
  color: #fdfefe;
}
.navigation-menu button {
  text-decoration: none;
  color: #fdfefe;
  border: none;
  background-color: transparent;
}

.site-identity-logo {
  font-size: 25px;
  font-weight: bold;
}
.site-identity-logo:hover {
  color: #f14f29;
}

.navigation-menu__labels {
  list-style: none;
  display: flex;
  gap: 25px;
  align-items: flex-end;
}

.navigation-menu__labels > li > a:hover {
  color: #f14f29;
}
.navigation-menu__labels > li > button:hover {
  color: #f14f29;
}

#toggleMenu,
.navigation-menu label {
  display: none;
}

@media screen and (max-width: 768px) {
  .main-menu {
    width: 100%;
    max-height: 0;
    overflow: hidden;
    opacity: 1;
  }

  .navigation-menu label {
    display: inline-flex;
    align-items: flex-start;
    cursor: pointer;
    color: #fdfefe;
  }

  .navigation-menu__labels {
    flex-direction: column;
    align-items: flex-start;
    margin-top: 10px;
    padding: 20px;
  }

  #toggleMenu:checked ~ .main-menu {
    max-height: 75%;
  }
}
</style>
