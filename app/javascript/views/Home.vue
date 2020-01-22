<template>
  <div class="home">
    <Navbar/>
    <ProductsBoard/>
  </div>
</template>

<script>

import ProductsBoard from '../components/ProductsBoard.vue'
import Navbar from '../components/Navbar.vue'

export default {
  name: 'home',
  components: {
    ProductsBoard,
    Navbar
  }
}
</script>
