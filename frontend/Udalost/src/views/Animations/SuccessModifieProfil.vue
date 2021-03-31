<template>
  <div>
    <div class="div">
      <div class="image">
        <h4>Votre profil a été bien modifié</h4>
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
    this.callFunction();
  },
  components: {},
  methods: {
    callFunction: function() {
      var v = this;
      setTimeout(function() {
        v.$router.push("/profil");
      }, 1500);
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
  & h4 {
    color: black;
    font-family: "Raleway", sans-serif;
  }

  & img:first-of-type {
    width: 50%;
  }
}
</style>
