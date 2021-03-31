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
   /* if (!this.$store.state.membre) {
      if (this.$route.path !== "/") {
        this.$router.push("/");
      }
    } else {
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
