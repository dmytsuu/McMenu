<template>
  <div class="container">
    <ProfileIcon/>
    <div class="row align-items-start">
      <ProductsBoard class="col col-lg-8"/>
      <Bucket class="col-md-4"/>
    </div>
    <NameModal/>
  </div>
</template>

<script>

import ProductsBoard from '../components/ProductsBoard.vue'
import Bucket from '../components/Bucket.vue'
import NameModal from '../components/NameModal.vue'
import ProfileIcon from '../components/ProfileIcon.vue'

export default {
  name: 'home',
  components: {
    ProductsBoard,
    NameModal,
    Bucket,
    ProfileIcon
  },
  mounted () {
    if (this.$store.state.username) { return }
    this.$bvModal.show('name-modal')
  }
}
</script>
