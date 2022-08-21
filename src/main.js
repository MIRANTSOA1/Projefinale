import Vue from 'vue'
import App from './App.vue'
import router from './router'
// import Vuetify from 'vuetify/es5/components/Vuetify'
import vuetify from './plugins/vuetify';
//import axios from 'axios' 
import 'bootstrap/dist/css/bootstrap.min.css'

Vue.config.productionTip = false
 
new Vue({
  router,
  vuetify,
  render: h => h(App)
}).$mount('#app')