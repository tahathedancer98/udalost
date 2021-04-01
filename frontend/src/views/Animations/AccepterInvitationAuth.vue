<template>
  <div>
    <div class="div">
      <div class="image">
        <h4>C'est fait ! Vous avez accepté l'invitation</h4>
        <br />
        <img src="../../assets/images/check.gif" />
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    msg: String,
  },
  mounted() {
    this.$store.commit("setInvitation", '');
    this.callFunction();
  },
  components: {},
  methods: {
    callFunction: function() {
      var v = this;
      setTimeout(function() {
        v.$router.push("/home");
      }, 3000);
    },
  },
};
</script>

<style lang="scss" scoped>
@import url("https://fonts.googleapis.com/css2?family=Raleway:wght@300&display=swap");

* {
  margin: 0;
  box-sizing: border-box;
}

.div {
  height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
  background: rgb(255, 255, 255);
}

.image {
  text-align: center;
  width: 40%;
  & h4 {
    color: black;
    font-family: "Raleway", sans-serif;
  }

  & img:first-of-type {
    width: 30%;
  }
}
</style>
