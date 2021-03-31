<template>
  <div>
    <div class="div">
      <div class="image">
        <h4>Bienvenu(e) admin à</h4>
        <h1>UDÁLOST</h1>
        <br />
        <img src="../../assets/images/loading.gif" />
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    msg: String,
  },
  data() {
    return {
        fullname : this.$store.state.membre.utilisateur.prenom + ' ' + this.$store.state.membre.utilisateur.nom
    };
  },
  mounted() {
    this.callFunction();
  },
  components: {},
  methods: {
    callFunction: function() {
      var v = this;
      setTimeout(function() {
        v.$router.push("/gestionEvenement");
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
  background-image: linear-gradient(rgba(36, 36, 36, 0.664), #484877ff),
    url("../../assets/images/background.jpg");
  background-size: 100%;
}

.image {
  text-align: center;
  & h1,
  h4 {
    color: white;
    padding: 1%;
    font-family: "Raleway", sans-serif;
  }

  h1 {
    font-size: 1000%;
  }

  & img:first-of-type {
    width: 100%;
    margin-top: -20%;
  }
}
</style>
