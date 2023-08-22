<template>
  <div>
    <iframe
      width="450"
      height="450"
      style="border: 0"
      loading="lazy"
      allowfullscreen
      v-bind:src="webPageUrl"
    ></iframe>
  </div>
</template>

<script>
export default {
  props: {
    webPageUrl: String,
  },
};
</script>

<style></style>
