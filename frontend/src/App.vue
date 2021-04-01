<template>
  <div id="app">
    <router-view />
  </div>
</template>
<script>
import axios from "axios";

export default {
  mounted() {
    console.log("L'app est demarrée");

    if (this.$store.state.membre == null || !this.$store.state.membre) {
      if (
        this.$store.state.invitation == null ||
        !this.$store.state.invitation
      ) {
        this.$router.push("/");
      }
      /*if (
        (this.$store.state.invitation != null ||
        this.$store.state.invitation) && (this.$store.state.membre == null || !this.$store.state.membre)
      ) {
        this.$router.push("/home");
      }*/
    } /*else if (
      this.$store.state.invitation == null) {
      this.$router.push("/home");
    }*/

    let token = this.$store.state.membre.token;
    if (token) {
      axios.defaults.headers.common["Authorization"] = token;
    } else {
      axios.defaults.headers.common["Authorization"] = null;
    }
  },
  methods: {},
};
</script>
<style lang="scss"></style>
