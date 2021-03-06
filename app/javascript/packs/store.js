import Vue from 'vue'
import Vuex from 'vuex'
import VuexPersistence from 'vuex-persist'

Vue.use(Vuex)

const vuexLocal = new VuexPersistence({ storage: window.localStorage })

export default new Vuex.Store({
  state: {
    products: [],
    kind: 'All',
    searchKeyword: '',
    username: ''
  },
  mutations: {
    setKeyword (state, keyword) { state.searchKeyword = keyword },
    setUsername (state, username) { state.username = username },
    setKind (state, kind) { state.kind = kind },
    setProducts (state, products) { state.products = products },
    resetBucket (state) { state.products.forEach(product => product.quantity = 0) },
    changeProductCount (state, item) {
      let product = state.products.find(product => product.id === item.id)
      product.quantity = item.quantity
    }
  },
  getters: {
    foundProducts: state => {
      return state.products.filter(product => {
        return state.searchKeyword.toLowerCase().split(' ').every(v => product.name.toLowerCase().includes(v))
      })
    },
    bucketProducts: state => {
      return state.products.filter(product => product.quantity > 0)
    },
    totalPrice: (state, getters) => {
      let summs = getters.bucketProducts.map(product => product.quantity * product.price)
      return summs.reduce((a, b) => a + b, 0)
    },
    byKind: (state, getters) => {
      let result = getters.foundProducts.filter(product => product.kind === state.kind)
      return state.kind === 'All' ? getters.foundProducts : result
    }
  },
  plugins: [vuexLocal.plugin]
})
