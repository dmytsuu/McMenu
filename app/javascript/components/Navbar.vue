<template lang="html">
  <nav class="navbar fixed-top navbar-dark bg-dark justify-content-center">
    <ul class="navbar-nav flex-row">
      <li v-for="kind in kinds" @click="selectKind(kind)" class="nav-item nav-link cursor-pointer px-2">{{ kind }}</li>
    </ul>
    <form class="form-inline ml-3">
      <input class="form-control d-inline-block" placeholder="Find item" @input="searchProducts" v-model="searchKeyword">
    </form>
  </nav>
</template>

<script>
import { mapState } from 'vuex'

export default {
  name: 'Navbar',
  data () {
    return {
      searchKeyword: '',
      kinds: ['All', 'Menus', 'Burgers', 'Rolls', 'Fries', 'Snacks', 'Salads', 'Desserts', 'Cold Desserts', 'Drinks', 'Hot Drinks', 'Happy Meal', 'Souces']
    }
  },
  methods: {
    searchProducts () { this.$store.commit('setKeyword', this.searchKeyword) },
    selectKind (kind) {
      this.searchKeyword = ''
      this.searchProducts()
      this.$store.commit('setKind', kind)
    }
  },
  computed: mapState(['username'])
}
</script>

<style lang="scss">
</style>
