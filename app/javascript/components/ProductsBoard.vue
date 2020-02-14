<template>
  <div class="products-board container">
    <Bucket/>
    <div class="row">
      <Product v-for="product in byKind"
               v-bind="product"
               :key="product.id"
               class="col-md-3 product my-1"/>
    </div>
  </div>
</template>

<script>
import axios from 'axios'
import { mapGetters } from 'vuex'
import Product from './Product.vue'
import Bucket from './Bucket.vue'

export default {
  name: 'ProductsBoard',
  components: { Product, Bucket },
  computed: mapGetters(['byKind']),
  async created () {
    if (this.byKind.length) return
    // TODO: use api constants
    let res = await axios.get('http://localhost:3000/products/index')
    let products = res.data.map(product => {
      return { ...product, quantity: 0 }
    })
    this.$store.commit('setProducts', products)
  }
}
</script>

<style scoped lang="scss">
  .products-board { margin-top: 56px; }
  .product { height: 340px; }
</style>
