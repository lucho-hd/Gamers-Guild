import Vue from 'vue'
import App from './App.vue'
import router from './router/router'
import vuetify from './plugins/vuetify'
import AnimateCSS from 'animate.css'

Vue.config.productionTip = false

new Vue({
  router,
  vuetify,
  AnimateCSS,
  
  render: h => h(App)
}).$mount('#app')
