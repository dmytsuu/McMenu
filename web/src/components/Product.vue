<template lang="html">
  <div class="d-flex flex-column justify-content-around align-items-center">
    <img :src="image" @click="addToBucket" alt="picture" class="image cursor-pointer">
    <p>{{ name }}</p>
    <p class="hryvna">{{ price }}</p>
    <div class="buttons btn-group w-100">
      <button @click="removeFromBucket" :disabled="this.count === 0" class="btn btn-danger w-50">-</button>
      <button @click="addToBucket" class="btn btn-success w-50">+</button>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Product',
  props: ['id', 'name', 'price', 'image', 'initialCount'],
  data () {
    return { count: this.initialCount }
  },
  methods: {
    addToBucket () { this.count++ },
    removeFromBucket () { this.count-- }
  },
  created () {
  }
}
</script>

<style scoped lang="scss">
  .cursor-pointer { cursor: pointer; }
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
