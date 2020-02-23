import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'
import Session from '../views/Session.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/:id?',
    name: 'home',
    component: Home
  },
  // {
  //   path: '/:id',
  //   name: 'session',
  //   component: Session
  // }
]

const router = new VueRouter({
  routes,
  mode: 'history'
})

export default router
