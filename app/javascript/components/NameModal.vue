<template lang="html">
  <b-modal id="name-modal" hide-header hide-footer centered no-close-on-esc no-close-on-backdrop>
    <div class="d-flex flex-column align-items-center text-center">
      <h3 class="font-weight-light my-2">Who are you?</h3>
      <b-form-input @keypress.enter="saveName" @input="checkValidity" :state="validName" class="form-control my-2" placeholder="Lukin Skywalker" v-model="username"></b-form-input>
      <button @click="saveName" :disabled="isDisabled" class="btn btn-success btn-block text-uppercase my-2">let me in</button>
    </div>
  </b-modal>
</template>

<script>

import Swal from 'sweetalert2'

export default {
  name: 'NameModal',
  data () {
    return {
      username: '',
      isDisabled: true,
      validName: false
    }
  },
  methods: {
    saveName () {
      if (this.isDisabled) { return }
      this.$store.commit('setUsername', this.username)
      this.$bvModal.hide('name-modal')
    },
    checkValidity () {
      if (this.username.trim().length < 2) {
        this.isDisabled = true
        this.validName = false
      } else {
        this.isDisabled = false
        this.validName = true
      }
    }
  }
}
</script>
