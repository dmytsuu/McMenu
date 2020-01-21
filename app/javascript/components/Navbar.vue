<template lang="html">
  <nav class="navbar fixed-top navbar-light bg-white justify-content-center">
    <input class="form-control product-search" placeholder="Find item" @input="searchProducts" v-model="searchKeyword">
  </nav>
</template>

<script>
export default {
  name: 'Navbar',
  data () {
    return {
      searchKeyword: ''
    }
  },
  methods: {
    searchProducts () {
      this.$store.commit('setKeyword', this.searchKeyword)
    }
  }
}
</script>

<style lang="scss">
  .product-search { width: 400px !important; }
</style>
