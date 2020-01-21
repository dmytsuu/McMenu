<template>
  <div class="products-board container-fluid">
    <Bucket/>
    <div class="row">
      <Product v-for="product in productsSearch"
               :key="product.id"
               :id="product.id"
               :name="product.name"
               :price="product.price"
               :image="product.link"
               :initialCount="product.count"
               class="col-md-2 product"/>
    </div>
  </div>
</template>

<script>
import axios from 'axios'
import Product from '@/components/Product.vue'
import Bucket from '@/components/Bucket.vue'

export default {
  name: 'ProductsBoard',
  components: { Product, Bucket },
  data () {
    return {
      products: []
    }
  },
  computed: {
    productsSearch () {
      return this.products.filter((items) => {
        return this.searchKeyword.toLowerCase().split(' ').every(v => items.name.toLowerCase().includes(v))
      })
    },
    searchKeyword () {
      return this.$store.state.searchKeyword
    }
  },
  async created () {
    let res = await axios.get('http://localhost:3000/McMenu')
    this.products = res.data.map((product) => {
      return { ...product, count: 0 }
    })
    // let storage = res.data.map((item) => {
    //   return { id: item.id, name: item.name, price: item.price, count: 0 }
    // })
    // localStorage.setItem('bucket', JSON.stringify(storage))
  }
}
</script>

<style scoped lang="scss">
  .product-search { width: 500px; }
  .product { height: 340px; }
</style>
