<template>
  <div class="container">
    <ProfileIcon/>
    <div class="">
      {{session}}
    </div>
    <button @click="joinSession" :disabled="isCurrentSession" class="btn btn-success">{{joinSessionButtonText}}</button>
    <SessionModal/>
  </div>
</template>

<script>

import SessionModal from '../components/SessionModal.vue'
import ProfileIcon from '../components/ProfileIcon.vue'
import axios from 'axios'

export default {
  name: 'home',
  components: { SessionModal, ProfileIcon },
  data () {
    return {
      session: {},
      isFetching: true
    }
  },
  computed: {
    currentSession () { return this.$store.state.session },
    isCurrentSession () { return this.$route.params.id == this.currentSession.id },
    paramsSessionId () { return this.$route.params.id },
    joinSessionButtonText () { return this.isCurrentSession ? 'Already joined this session' : 'Join this session' }
  },
  methods: {
    // TODO: this method should show confirm modal if user has different session
    joinSession () { this.$store.commit('setSession', this.session) },
  },
  async created () {
    await axios.get('http://localhost:3000/api/sessions/' + this.paramsSessionId)
               .then(resp => this.session = resp.data)
               .catch(err => console.log('ERR', err))
    this.isFetching = false
  }
}
</script>
