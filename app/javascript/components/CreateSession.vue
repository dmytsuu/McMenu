<template lang="html">
  <div class="d-flex p-3 flex-column align-items-center text-center">
    <h3 class="font-weight-light my-2">Create Session</h3>
    <div class="row mt-3">
      <input v-model="name" class="col form-control" placeholder="Name">
      <vue-clock-picker v-model="time"
                        input-class="form-control bg-white h-100 cursor-pointer"
                        input-container-class="col h-100"
                        placeholder="Order accept time"
                        close-on-esc
                        close-on-overlay
                        :disabled-to="timePickerFromTime">
      </vue-clock-picker>
      <!-- <b-form-checkbox v-model="private">Private</b-form-checkbox> -->
      <button @click="submit" :disabled="!isAbled" class="btn btn-success btn-block text-uppercase mt-3">GO</button>
    </div>
  </div>
</template>

<script>
import axios from 'axios'
import Swal from 'sweetalert2'

export default {
  name: 'CreateSession',
  data () {
    return {
      name: '',
      time: ''
      // private: true
    }
  },
  computed: {
    timePickerFromTime () {
      let timeNow = new Date().getTime()
      let startTime = new Date(timeNow + 900)
      return `${startTime.getHours()}:${startTime.getMinutes()}`
    },
    isAbled () { return this.name.length && this.time.length },
    host () { return this.$store.state.user },
    sessionTime () {
      let finish_at = this.$store.state.session.finish_at
      return !finish_at.length || new Date(finish_at) < new Date() ? 0 : new Date(finish_at) - new Date()
    }
  },
  methods: {
    // TODO: refactor this shit
    async submit () {
      // this.isSubmitDisabled = true
      // TODO: use constants for url, refactor Swal
      await axios.post('http://localhost:3000/api/sessions/create', { name: this.name, finish_at: this.time, host: this.host }).then(res => {
        this.$store.commit('setSession', res.data)
        let sessionUrl = `http://localhost:3000/${res.data.id}`
        let successText = `<div class="mb-4">Here's your session URL, click & share it!</div>`
        let copyUrlHtml = `<span id="session-url" class="bg-light border rounded p-2 cursor-pointer">${sessionUrl}</span>`
        Swal.fire({
          title: 'Done!',
          html: successText + copyUrlHtml,
          icon: 'success'
        })
        let sessionUrlElement = document.getElementById('session-url')
        sessionUrlElement.addEventListener('click', () => {
          this.$copyText(sessionUrlElement.textContent)
          sessionUrlElement.classList.add('border-success')
          setTimeout(() => sessionUrlElement.classList.remove('border-success'), 1000)
        })
        this.$bvModal.hide('session-modal')
      }).catch(err => {
        console.log('ERR', err)
        Swal.fire(
          'Oops...',
          'Something went wrong!',
          'error'
        )
      })
      // this.isSubmitDisabled = false
    }
  },
}
</script>

<style lang="scss" scoped>
  .form-control { height: 48px }
  #session-url { transition: .5s }
</style>
