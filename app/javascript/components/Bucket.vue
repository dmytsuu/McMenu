<template lang="html">
  <div v-bind:class="{ 'bucket-opened': isBucketShown }" class="bucket container-fluid fixed rounded border bg-white">
    <span @click="toggleBucket" class="close float-left pt-2 cursor-pointer">&times;</span>
    <div v-bind:class="{ 'd-none': !isBucketShown }" class="row no-gutters flex-column align-items-center p-3">
      <div class="col">
        <h5 class="text-center">Bucket</h5>
        <table class="table">
          <tbody>
            <tr v-for="product in bucketProducts" :key="product.id" class="text-left table-row">
              <td><img :src="product.image" alt="thumbnail" class="thumbnail"></td>
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

import { mapGetters } from 'vuex'
import Swal from 'sweetalert2'
import axios from 'axios'

export default {
  name: 'Bucket',
  data () {
    return {
      isBucketShown: false,
      isSubmitDisabled: false
    }
  },
  methods: {
    // TODO: refactor this shit
    toggleBucket () { this.isBucketShown = !this.isBucketShown },
    async submit () {
      this.isSubmitDisabled = true;
      await axios.post('http://localhost:3000/buckets/create', this.bucketProducts).then(res => {
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
    ...mapGetters([
      'bucketProducts', 'totalPrice'
    ]),
    submitButtonText () {
      return this.isSubmitDisabled ? 'Submiting' : `Order ${this.totalPrice} ₴`
    }
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
