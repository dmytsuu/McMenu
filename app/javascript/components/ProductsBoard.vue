<template>
  <div class="products-board container-fluid">
    <Bucket/>
    <div class="row">
      <Product v-for="product in byKind"
               v-bind="product"
               :key="product.id"
               class="col-md-2 product"/>
    </div>
  </div>
</template>

<script>
import axios from 'axios'
import Product from './Product.vue'
import Bucket from './Bucket.vue'

export default {
  name: 'ProductsBoard',
  components: { Product, Bucket },
  computed: {
    products () { return this.$store.getters.foundProducts },
    byKind () { return this.$store.getters.byKind }
  },
  async created () {
    let res = await axios.get('http://localhost:3000/products/index')
    let products = res.data.map(product => {
      return { ...product, count: 0 }
    })
    this.$store.commit('setProducts', products)
  }
}
</script>

<style scoped lang="scss">
  .product-search { width: 500px; }
  .product { height: 340px; }
</style>
