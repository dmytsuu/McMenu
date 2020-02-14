<template lang="html">
  <div @mouseover="showBucket" @mouseleave="hideBucket" :class="{ 'bucket-opened': isBucketShown }" class="bucket container-fluid fixed rounded border bg-white">
    <div v-bind:class="{ 'd-none': !isBucketShown }" class="row no-gutters flex-column align-items-center p-3">
      <div class="col">
        <h5 class="text-center">Bucket</h5>
        <table class="table">
          <tbody>
            <tr v-for="product in bucketProducts" :key="product.id" class="text-left table-row">
              <td><img :src="product.image || placeholder" alt="thumbnail" class="thumbnail"></td>
              <td>{{ product.name }}</td>
              <td><span class="badge badge-success p-3">{{ product.quantity }}</span></td>
              <td>{{ product.price * product.quantity }}₴</td>
            </tr>
          </tbody>
        </table>
        <button class="btn btn-success btn-block" @click="submit" :disabled="isSubmitDisabled">{{ submitButtonText }}</button>
        <button class="btn btn-danger btn-block" @click="resetBucket">Reset</button>
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
      isBucketShown: false,
      isSubmitDisabled: false,
      placeholder: 'https://img-global.cpcdn.com/recipes/5520605ad8c12747c2fbd83a362a03a16695fedbee0c05bd73d7a3049444b60f/1200x630cq70/photo.jpg'
    }
  },
  methods: {
    // TODO: refactor this shit
    showBucket () { this.isBucketShown = true },
    hideBucket () { setTimeout(() => this.isBucketShown = false, 500) },
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
      this.$store.commit('resetBucket'),
      this.isBucketShown = false
    }
  },
  computed: {
    ...mapGetters(['bucketProducts', 'totalPrice']),
    submitButtonText () { return this.isSubmitDisabled ? 'Submiting' : `Order ${this.totalPrice} ₴` },
    username () { return this.$store.state.username }
  }
}
</script>

<style scoped lang="scss">
  .table-row { vertical-align: center; }
  .thumbnail {
    width: 50px;
    height: 50px;
  }
  .bucket-opened { width: 30vw !important; }
  .bucket {
    transition: width 0.5s;
    min-height: 40px;
    width: 50px;
    position: fixed;
    top: 20%;
    right: -10px;
    z-index: 100;
  }
</style>
