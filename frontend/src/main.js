import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import SuiVue from 'semantic-ui-vue'; 
import 'semantic-ui-css/semantic.min.css';
import { BootstrapVue, IconsPlugin } from 'bootstrap-vue'

import 'bootstrap/dist/css/bootstrap.css';
import 'bootstrap-vue/dist/bootstrap-vue.css';

import axios from 'axios';

window.api = axios.create({
  baseURL: "https://api.udalost.web:10243/"
});

window.api_back = axios.create({
  baseURL: "https://api.udalost.back:10043/"
});

window.map = axios.create({
  baseURL: "https://maps.open-street.com/"
});

axios.interceptors.response.use(function (response) {
  return response;
}, function (error) {
  if (401 === error.response.status) {
      console.log("a error")
  } else {
      return Promise.reject(error);
  }
});

import $ from 'jquery'
//axios.defaults.withCredentials = true

Vue.use(BootstrapVue);
Vue.use(IconsPlugin);

Vue.use(SuiVue);
Vue.config.productionTip = false

Vue.prototype.$bus = new Vue();


new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
