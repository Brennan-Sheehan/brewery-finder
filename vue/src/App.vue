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

export default {
  components: {
    NavBar,
  },
  methods: {},
  created() {},
};
</script>

<style>
.app {
  font-family: "Montserrat", sans-serif;
}
</style>
