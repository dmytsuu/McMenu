<template lang="html">
  <b-modal id="session-modal" hide-header hide-footer centered>
    <CreateSession v-if="isCreateSession"/>
    <!-- <JoinSession v-if="isJoinSessions"/> -->
  </b-modal>
</template>

<script>
import CreateSession from './CreateSession'
import JoinSession from './JoinSession'
import { mapGetters } from 'vuex'

export default {
  name: 'SessionModal',
  components: { CreateSession, JoinSession },
  computed: mapGetters(['isCreateSession'])
}
</script>
