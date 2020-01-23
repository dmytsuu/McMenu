<template lang="html">
  <b-modal id="name-modal" hide-header="true" hide-footer="true" centered :no-close-on-backdrop="true">
    <div class="d-flex flex-column align-items-center text-center">
      <h3 class="font-weight-light my-2">Who are you?</h3>
      <input class="form-control my-2" placeholder="Lukin Skywalker">
      <button class="btn btn-success btn-block text-uppercase my-2">let me in</button>
    </div>
  </b-modal>
</template>

<script>
export default {
  name: 'NameModal'
}
</script>
