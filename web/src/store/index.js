import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    searchKeyword: ''
  },
  mutations: {
    setKeyword (state, keyword) {
      state.searchKeyword = keyword
    }
  },
  actions: {
    setKeyword (context, keyword) {
      context.commit('setKeyword', keyword)
    }
  },
  modules: {
  }
})
