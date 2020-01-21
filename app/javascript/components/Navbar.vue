<template lang="html">
  <nav class="navbar flex-column fixed-top navbar-light bg-white justify-content-center">
    <input class="form-control product-search" placeholder="Find item" @input="searchProducts" v-model="searchKeyword">
    <ul class="nav mt-2">
      <li v-for="kind in kinds" @click="selectKind(kind)" class="nav-item nav-link shadow-sm text-capitalize cursor-pointer mr-2">{{ kind }}</li>
    </ul>
  </nav>
</template>

<script>
export default {
  name: 'Navbar',
  data () {
    return {
      searchKeyword: '',
      kinds: ['all', 'menus', 'burgers', 'rolls', 'fries', 'snacks', 'salads', 'desserts', 'cold_desserts', 'drinks', 'hot_drinks', 'happy_meal', 'souces']
    }
  },
  methods: {
    searchProducts () { this.$store.commit('setKeyword', this.searchKeyword) },
    selectKind (kind) { this.$store.commit('setKind', kind) }
  }
}
</script>

<style lang="scss">
  .product-search { width: 400px !important; }
</style>
