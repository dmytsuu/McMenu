<template>
  <div class="home">
    <Navbar/>
    <ProductsBoard/>
    <NameModal/>
  </div>
</template>

<script>

import ProductsBoard from '../components/ProductsBoard.vue'
import Navbar from '../components/Navbar.vue'
import NameModal from '../components/NameModal.vue'

export default {
  name: 'home',
  components: {
    ProductsBoard,
    Navbar,
    NameModal
  },
  mounted () {
    if (this.$store.state.username) { return }
    this.$bvModal.show('name-modal')
  }
}
</script>
