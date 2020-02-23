<template>
  <div>
    <div class="container-fluid">
      <div class="row">
        <Navbar class="col-12 mb-3"/>
        <Product v-for="product in byKind"
        v-bind="product"
        :key="product.id"
        class="col-md-6 p-3 product"/>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios'
import { mapGetters } from 'vuex'
import Product from './Product.vue'
import Navbar from './Navbar.vue'

export default {
  name: 'ProductsBoard',
  components: { Product, Navbar },
  computed: mapGetters(['byKind']),
  async created () {
    if (this.byKind.length) return
    // TODO: use api constants
    let res = await axios.get('http://localhost:3000/api/products/index')
    let products = res.data.map(product => {
      return { ...product, quantity: 0 }
    })
    this.$store.commit('setProducts', products)
  }
}
</script>

<style scoped lang="scss">
  .product { height: 300px; }
</style>
