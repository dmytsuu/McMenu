<template lang="html">
  <div class="d-flex flex-column justify-content-around align-items-center">
    <img :src="image || placeholder" alt="picture" class="image cursor-pointer">
    <p>{{ name }}</p>
    <p class="hryvna">{{ price }} <span class="badge badge-success">{{ quantity }}</span> </p>
    <div class="buttons btn-group w-100">
      <button @click="decrement" :disabled="quantity === 0" class="btn btn-danger w-50">-</button>
      <button @click="increment" class="btn btn-success w-50">+</button>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Product',
  data () {
    return { placeholder: 'https://img-global.cpcdn.com/recipes/5520605ad8c12747c2fbd83a362a03a16695fedbee0c05bd73d7a3049444b60f/1200x630cq70/photo.jpg' }
  },
  props: ['id', 'name', 'price', 'image', 'quantity'],
  methods: {
    increment () { this.$store.commit('changeProductCount', { id: this.id, quantity: this.quantity + 1 }) },
    decrement () { this.$store.commit('changeProductCount', { id: this.id, quantity: this.quantity - 1 }) }
  }
}
</script>

<style scoped lang="scss">
  .buttons { font-size: 2rem; }
  p { margin: 0; }
  .image {
    max-width: 70%;
    max-height: 70%;
  }
  .hryvna::after {
    margin-left: 2px;
    content: '₴'
  }
</style>
