<template lang="html">
  <b-modal id="name-modal" hide-header hide-footer centered no-close-on-esc no-close-on-backdrop>
    <div class="d-flex flex-column align-items-center text-center">
      <h3 class="font-weight-light my-2">Who are you?</h3>
      <b-form-input @keypress.enter="submit" @input="checkValidity" :state="isValidName" class="form-control my-2" placeholder="Lukin Skywalker" v-model="username"></b-form-input>
      <button @click="submit" :disabled="isDisabled" class="btn btn-success btn-block text-uppercase my-2">let me in</button>
    </div>
    <div class="d-flex flex-column align-items-center text-center" v-if="paramsSessionId">
      <h3 class="font-weight-light my-2">Join {{host}} session also?</h3>
      <button @click="joinSession" class="btn btn-success btn-block text-uppercase my-2">Join</button>
    </div>
  </b-modal>
</template>

<script>
import axios from 'axios'
import Swal from 'sweetalert2'

export default {
  name: 'NameModal',
  data () {
    return {
      host: '...',
      session: {},
      username: '',
      isSubmited: false,
      isValidName: false
    }
  },
  computed: {
    isDisabled () { return this.isSubmited || !this.isValidName },
    paramsSessionId () { return this.$route.params.id },
  },
  methods: {
    checkValidity () { (this.username.trim().length < 2) ? this.isValidName = false : this.isValidName = true },
    async submit () {
      this.isSubmited = true
      await axios.post('http://localhost:3000/api/users/create', { name: this.username })
           .then(res => {
             this.$store.commit('setUsername', res.data)
             this.$bvModal.hide('name-modal')
           }).catch(err => Swal.fire('Oops...', 'Something went wrong!', 'error'))
      this.isSubmited = false
    },
    joinSession () { this.$store.commit('setSession', this.session) },
  },
  async created () {
    console.log('THIS.PARAMSSESSIONID', this.$route.params)
    if (!this.paramsSessionId) { return }
    console.log('CONDITION PASSED')
    await axios.get('http://localhost:3000/api/sessions/' + this.paramsSessionId)
               .then(resp => this.session = resp.data)
               .catch(err => console.log('ERR', err))
    this.host = this.session.name
  }
}
</script>
