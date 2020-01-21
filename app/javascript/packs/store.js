import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    products: [],
    searchKeyword: ''
  },
  mutations: {
    setKeyword (state, keyword) { state.searchKeyword = keyword },
    setProducts (state, products) { state.products = products },
    changeProductCount (state, item) {
      let product = state.products.find(product => product.id === item.id)
      product.count = item.count
    }
  },
  getters: {
    foundProducts: state => {
      return state.products.filter(product => {
        return state.searchKeyword.toLowerCase().split(' ').every(v => product.name.toLowerCase().includes(v))
      })
    },
    bucketProducts: state => {
      return state.products.filter(product => product.count > 0)
    },
    totalPrice: (state, getters) => {
      let summs = getters.bucketProducts.map(product => product.count * product.price)
      return summs.reduce((a, b) => a + b, 0)
    }
  }
})
