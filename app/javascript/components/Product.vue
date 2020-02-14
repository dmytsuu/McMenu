<template lang="html">
  <div class="container-fluid">
    <div class="row flex-column rounded-smooth justify-content-center align-items-center mx-1 p-3 shadow h-100 flex-nowrap">
      <div class="col-7">
        <img :src="image || placeholder" alt="picture" class="w-100">
      </div>
      <div class="align-self-start d-flex flex-column align-items-stretch col">
        <h5 class="font-weight-bold">{{ name }}</h5>
        <div class="d-flex justify-content-between align-items-center">
          <p class="price">{{ price }} грн.</p>
          <div class="buttons">
            <button @click="decrement" :disabled="!quantity" class="btn btn-sm btn-danger rounded-smooth">
              <b-icon icon="dash"></b-icon>
            </button>
            <button @click="increment" class="btn btn-sm btn-success rounded-smooth">
              <b-icon icon="plus"></b-icon>
            </button>
        </div>
        </div>
      </div>
      <!-- <p>In bucket<span class="badge badge-success mx-1">{{ quantity }}</span></p> -->
    </div>
  </div>
</template>

<script>
import { BIcon, BIconPlus, BIconDash } from 'bootstrap-vue'
export default {
  name: 'Product',
  components: { BIcon, BIconPlus, BIconDash },
  data () {
    // TODO: use constants
    return { placeholder: 'https://img-global.cpcdn.com/recipes/5520605ad8c12747c2fbd83a362a03a16695fedbee0c05bd73d7a3049444b60f/1200x630cq70/photo.jpg' }
  },
  props: ['id', 'name', 'price', 'image', 'quantity'],
  methods: {
    increment () { this.changeProductCountBy(1) },
    decrement () { this.changeProductCountBy(-1) },
    changeProductCountBy (number) { this.$store.commit('changeProductCount', { id: this.id, quantity: this.quantity + number }) }
  }
}
</script>

<style scoped lang="scss">
  .buttons { font-size: 2rem; }
  p { margin: 0; }
  .price { font-size: 16px;}
  .image { object-fit: contain; }
</style>
