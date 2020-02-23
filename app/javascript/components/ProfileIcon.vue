<template lang="html">
  <div class="wrapper p-2 d-flex flex-column shadow bg-white rounded-pill">
    <router-link :to="{ name: 'home' }">
      <img src="../packs/images/avatar.jpg" alt="avatar" class="avatar rounded-circle cursor-pointer">
    </router-link>
    <div class="items display-4">
      <b-icon icon="dash" class="mt-3 cursor-pointer" @click="leaveSession"></b-icon>
      <b-icon icon="plus" class="cursor-pointer" @click="showSessionModal"></b-icon>
    </div>
  </div>
</template>

<script>
import { BIcon, BIconDash, BIconPlus } from 'bootstrap-vue'
import SessionModal from './SessionModal'

export default {
  name: 'ProfileIcon',
  components: { BIcon, BIconDash, BIconPlus, SessionModal },
  methods: {
    leaveSession () { this.$store.commit('setSession', {}) },
    showSessionModal () {
      this.$store.commit('setSessionModalAction', 'create')
      this.$bvModal.show('session-modal')
    }
  }
}
</script>

<style lang="scss" scoped>
  .wrapper {
    position: fixed;
    top: 1rem;
    right: 1rem;
    width: 72px;
    .items { display: none; }
    &:hover {
      .items { display: block; }
    }
  }
  .avatar {
    height: 56px;
    width: 56px;
  }
</style>
