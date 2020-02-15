<template lang="html">
  <div class="container-fluid sticky-top">
    <div class="bucket row my-3 no-gutters flex-column align-items-center rounded-smooth shadow-lg">
      <div class="col p-3">
        <h5 class="text-center font-weight-bold">Your order</h5>
        <div :class="{ 'd-none' : bucketProducts.length }" class="display-4 text-muted text-center">¯\_(ツ)_/¯</div>
        <div :class="{ 'd-none' : !bucketProducts.length }" class="container-fluid product">
          <div class="row py-2 no-gutters border-bottom" v-for="product in bucketProducts" :key="product.id">
            <div class="col-2 font-weight-bold">
              {{ product.quantity }}x
            </div>
            <div class="col">
              {{ product.name }}
            </div>
            <div class="col-auto">
              {{ product.price * product.quantity }} грн.
            </div>
          </div>
          <div class="row py-3 justify-content-between font-weight-bold">
            <div class="col-auto">
              TOTAL PRICE
            </div>
            <div class="col-auto">
              {{ this.totalPrice }} грн.
            </div>
          </div>
        </div>
        <div :class="{ 'd-none' : !bucketProducts.length }" class="row justify-content-center flex-wrap">
          <button class="font-weight-bold btn btn-success w-75 rounded-pill mb-2" @click="submit" :disabled="isSubmitDisabled">{{ submitButtonText }}</button>
          <button class="font-weight-bold btn btn-danger w-75 rounded-pill" @click="resetBucket">Reset</button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>

import Swal from 'sweetalert2'
import axios from 'axios'
import { mapGetters } from 'vuex'

export default {
  name: 'Bucket',
  data () {
    return {
      isSubmitDisabled: false,
      placeholder: 'https://img-global.cpcdn.com/recipes/5520605ad8c12747c2fbd83a362a03a16695fedbee0c05bd73d7a3049444b60f/1200x630cq70/photo.jpg'
    }
  },
  methods: {
    // TODO: refactor this shit
    async submit () {
      this.isSubmitDisabled = true
      // TODO: use constants for url, refactor Swal
      await axios.post('http://localhost:3000/buckets/create', { products: this.bucketProducts, name: this.username }).then(res => {
        Swal.fire(
          'Awesome!',
          'Your order is created',
          'success'
        )
      }).catch(err => {
        Swal.fire(
          'Oops...',
          'Something went wrong!',
          'error'
        )
      })
      this.isSubmitDisabled = false
    },
    resetBucket () {
      this.$store.commit('resetBucket')
    }
  },
  computed: {
    ...mapGetters(['bucketProducts', 'totalPrice']),
    submitButtonText () { return this.isSubmitDisabled ? 'Submiting' : 'Order' },
    username () { return this.$store.state.username }
  }
}
</script>

<style scoped lang="scss">
  // .bucket { min-height: 275px; }
  .product { font-size: 17px; }
</style>
