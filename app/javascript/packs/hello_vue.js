import Vue from 'vue'
import BootstrapVue from 'bootstrap-vue'
import './bootstrap.scss'
import router from './router'
import store from './store'
import App from '../App.vue'

Vue.use(BootstrapVue)

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    router,
    store,
    render: h => h(App)
  }).$mount()
  document.body.appendChild(app.$el)
})
