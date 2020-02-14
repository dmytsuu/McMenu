<template lang="html">
  <nav class="search-and-filters container-fluid sticky-top bg-white">
    <div class="row py-3">
      <div class="col bg-white rounded-smooth shadow h-100 p-3 d-flex align-items-center justify-space-between">
        <!-- <ul class="navbar-nav flex-row">
      </ul> -->
      <input class="form-control border-0" placeholder="Find item" @input="searchProducts" v-model="searchKeyword">
      <b-dropdown id="filter-dropdown"
                  variant="link"
                  dropleft
                  no-caret
                  toggle-class="filter-icon mx-3 text-decoration-none text-dark"
                  menu-class="border-0 dropdown-menu-custom shadow">
        <template v-slot:button-content>
          <b-icon icon="filter" aria-hidden="true"></b-icon>
        </template>
        <b-dropdown-item v-for="kind in kinds" @click="selectKind(kind)">{{ kind }}</b-dropdown-item>
      </b-dropdown>
      </div>
    </div>
  </nav>
</template>

<script>
import { mapState } from 'vuex'
import { BIcon, BIconFilter } from 'bootstrap-vue'

export default {
  name: 'Navbar',
  components: { BIcon, BIconFilter },
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
  .search-and-filters { height: 72px; }
  .dropdown-menu-custom {
    width: 250px;
    font-size: 1.25rem;
  }
  a.dropdown-item {
    color: #495057;
    &:active {
      background-color: #ececec;
      color: inherit;
    }
  }
  .filter-icon {
    font-size: 1.25rem;
    // transition: font-size 1s;
    // &:hover { font-size: 2.5rem; }
  }
</style>
