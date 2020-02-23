import Vue from 'vue'
import BootstrapVue from 'bootstrap-vue'
import './bootstrap.scss'
import VueClipboard from 'vue-clipboard2'
const VueClockPickerPlugin = require('@pencilpix/vue2-clock-picker/dist/vue2-clock-picker.plugin.js')
import '@pencilpix/vue2-clock-picker/dist/vue2-clock-picker.min.css';
import router from './router'
import store from './store'
import App from '../App.vue'

Vue.use(VueClipboard)
Vue.use(VueClockPickerPlugin)
Vue.use(BootstrapVue)

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    router,
    store,
    render: h => h(App)
  }).$mount()
  document.body.appendChild(app.$el)
})
