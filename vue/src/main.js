import { createApp } from "vue";
import App from "./App.vue";
import router from "./router/index";
import store from "./store/index";
import axios from "axios";

axios.defaults.baseURL = process.env.VUE_APP_REMOTE_API;

createApp(App).use(router).use(store).mount("#app");
