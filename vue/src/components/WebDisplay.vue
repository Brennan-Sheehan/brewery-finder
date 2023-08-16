<template>
  <div>
      <iframe v-bind:src ="webPageUrl" frameborder="0" width="100%" height="400"></iframe>
  </div>
</template>

<script>
export default {
props: {
    webPageUrl: String
}
}
</script>

<style>

</style>