<template>
  <div id="app">
    <div id="nav">
      <nav-bar />
    </div>
    <router-view />
  </div>
</template>

<script>
import NavBar from "./components/NavigationComponent.vue";
import { mapMutations } from "vuex";
export default {
  components: {
    NavBar,
  },
  methods: {
    ...mapMutations("userModule", ["SET_IS_AUTHENTICATED"]),
  },
  created() {
    this.SET_IS_AUTHENTICATED();
  },
};
</script>

<style>
.app {
  font-family: "Montserrat", sans-serif;
}
</style>
