<template>
  <div class="container">
    <div class="row align-items-start">
      <ProductsBoard class="col col-md-8"/>
      <Bucket class="col-md-4"/>
    </div>
    <NameModal/>
  </div>
</template>

<script>

import ProductsBoard from '../components/ProductsBoard.vue'
import Bucket from '../components/Bucket.vue'
import NameModal from '../components/NameModal.vue'

export default {
  name: 'home',
  components: {
    ProductsBoard,
    NameModal,
    Bucket
  },
  mounted () {
    if (this.$store.state.username) { return }
    this.$bvModal.show('name-modal')
  }
}
</script>
