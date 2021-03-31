<template>
  <div class="general">
    <div class="container" id="container">
      <div class="form-container sign-in-container">
        <form action="#" @submit.prevent="seConnecter">
          <img class="imgUser" src="../assets/images/logo.png" />
          <input v-model="emailL" type="email" placeholder="Email" required />
          <input
            v-model="motpasseL"
            type="password"
            placeholder="Mot de passe"
            required
          />
          <a href="#" class="links">Mot de passe oublié ?</a>
          <button class="button2">SE CONNECTER</button>
        </form>
      </div>
      <div class="form-container sign-up-container">
        <form action="#" @submit.prevent="creerCompte">
          <strong><h4 class="titleForm">CRÉER COMPTE</h4></strong>
          <input
            type="text"
            v-model="username"
            placeholder="Nom d'utilisateur"
          />
          <input type="text" v-model="prenom" placeholder="Prénom" required />
          <input type="text" v-model="nom" placeholder="Nom" required />
          <input type="email" v-model="email" placeholder="Email" required />
          <input
            required
            type="password"
            v-model="motpasse"
            placeholder="Mot de passe"
          />
          <input
            type="password"
            v-model="motpassev"
            placeholder="Vérifier mot de passe"
            required
          />
          <div id="messageError">
            <span>Les mots de passe ne sont pas identiques</span>
          </div>
          <button class="button1">CRÉER COMPTE</button>
        </form>
      </div>
      <div class="overlay-container">
        <div class="overlay">
          <div class="overlay-panel overlay-left">
            <h1>Vous avez déjà une compte ?</h1>
            <p>
              Connectez-vous et commencez votre expérience !
            </p>
            <button class="ghost" id="signIn">Se connecter</button>
          </div>
          <div class="overlay-panel overlay-right">
            <h1>Vous ne possédez pas de compte ?</h1>
            <p>
              Entrez vos données personnelles et commencez votre expérience !
            </p>
            <button class="ghost" id="signUp">Créer compte</button>
          </div>
        </div>
      </div>
    </div>

    <footer>
      <p>
        IUT Nancy-Charlemagne
      </p>
    </footer>
  </div>
</template>

<script>
// @ is an alias to /src
import HelloWorld from "@/components/HelloWorld.vue";
import axios from "axios";

export default {
  name: "Login",
  components: {
    HelloWorld,
  },
  data() {
    return {
      username: "",
      nom: "",
      prenom: "",
      email: "",
      motpasse: "",
      motpassev: "",
      emailL: "",
      motpasseL: "",
    };
  },
  mounted() {
    //this.test();
    const signUpButton = document.getElementById("signUp");
    const signInButton = document.getElementById("signIn");
    const container = document.getElementById("container");

    signUpButton.addEventListener("click", () => {
      container.classList.add("right-panel-active");
    });

    signInButton.addEventListener("click", () => {
      container.classList.remove("right-panel-active");
    });
  },
  methods: {
    seConnecter() {
      const data = new URLSearchParams();
      data.append("grant_type", "client_credentials");

      axios({
        url: `http://localhost:8080/connexion`,
        method: "POST",
        auth: {
          username: this.emailL,
          password: this.motpasseL,
        },
        headers: {
          Accept: "application/json",
          "Content-Type": "application/x-www-form-urlencoded",
          "Access-Control-Allow-Origin": "*",
        },
        withCredentials: true,
      })
        .then(
          (response) => {
            if(this.emailL == 'admin@admin.com'){
              this.$store.commit("setAdmin", response.data);
              console.log("Admin");
              this.$router.push("/loadingadmin");
            }else{
              this.$store.commit("setMembre", response.data);
              console.log("user");
              this.$router.push("/loading");
            }
          },
          (error) => {
            if (error.response.status === 401) {
              console.log("ERROR CONNEXION");
            }
            return error;
          }
        )
        .catch((error) => {
          alert("Error :" + error);
        });
    },

    creerCompte() {
      const data = new URLSearchParams();
      data.append("grant_type", "client_credentials");

      if (this.motpasse == this.motpassev) {
        axios
          .post("http://localhost:8080/utilisateurs", {
            username: this.username,
            nom: this.nom,
            prenom: this.prenom,
            email: this.email,
            motpasse: this.motpasse,
            headers: {
              Accept: "application/json",
              "Accept-Language": "en_US",
              "Content-Type": "application/x-www-form-urlencoded",
              "Access-Control-Allow-Origin": "http://localhost:8080/",
            },
            withCredentials: true,
          })
          .then((response) => {
            this.$router.push("/successcc");
          })
          .catch((error) => {
            console.log("Error ========>", error);
            this.$router.push("/errorcc");
          });
      } else {
        document.getElementById("messageError").style.display = "block";
      }
    },

    test() {
      axios
        .get("http://localhost:8080/utilisateurs")
        .then((response) => {
          console.log(response);
        })
        .catch((error) => {
          console.log("Error ========>", error);
        });
    },
  },
};
</script>
<style lang="scss" scoped>
@import url("https://fonts.googleapis.com/css2?family=Raleway:wght@300&display=swap");

* {
  box-sizing: border-box;
  font-family: "Raleway", sans-serif;
}

#messageError {
  text-align: center;
  color: red;
  display: none;
}

.general {
  background: #f6f5f7;

  // CENTRER CONTAINER
  position: relative;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  font-family: "Montserrat", sans-serif;
  height: 100vh;
  margin: -20px 0 50px;
}

h1 {
  font-weight: bold;
  margin: 0;
}

h4 {
  color: #a6cff4;
  font-weight: bold;
  text-align: center;
}

p {
  font-size: 14px;
  font-weight: 100;
  line-height: 20px;
  letter-spacing: 0.5px;
  margin: 20px 0 30px;
}

span {
  font-size: 12px;
}

a {
  color: #333;
  font-size: 14px;
  text-decoration: none;
  margin: 15px 0;
}

button {
  border-radius: 20px;
  color: #ffffff;
  font-size: 12px;
  font-weight: bold;
  padding: 12px 45px;
  letter-spacing: 1px;
  text-transform: uppercase;
  transition: transform 80ms ease-in;
  cursor: pointer;
}

.button1 {
  margin-top: 4%;
  border: 1px solid #a6cff4;
  background-color: #a6cff4;

  &:hover {
    border: 1px solid #84b6e2;
    background-color: #84b6e2;
  }
}

.button2 {
  border: 1px solid #484877ff;
  background-color: #484877ff;

  &:hover {
    border: 1px solid rgb(85, 85, 145);
    background-color: rgb(85, 85, 145);
  }
}

#signIn {
  border: 1px solid #484877ff;
  background-color: #484877ff;

  &:hover {
    border: 1px solid rgb(85, 85, 145);
    background-color: rgb(85, 85, 145);
  }
}

#signUp {
  border: 1px solid #a6cff4;
  background-color: #a6cff4;

  &:hover {
    border: 1px solid #84b6e2;
    background-color: #84b6e2;
  }
}

button:active {
  transform: scale(0.95);
}

button:focus {
  outline: none;
}

button.ghost {
  background-color: transparent;
  border-color: #ffffff;

  &:first-of-type {
    border: 1px solid #484877ff;
    background-color: #484877ff;
  }

  &:last-of-type {
    border: 1px solid #a6cff4;
    background-color: #a6cff4;
  }
}

.titleForm {
  margin-bottom: 5%;
}

.imgUser {
  width: 60%;
  margin-bottom: 10%;
}

form {
  background-color: #ffffff;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
  padding: 0 50px;
  height: 100%;
  text-align: center;
}

input {
  background-color: #eee;
  border: none;
  padding: 12px 15px;
  margin: 8px 0;
  width: 100%;
}

.links {
  color: royalblue;
  font-size: 0.8em;

  &:hover {
    color: red;
  }
}

.container {
  background-color: #fff;
  border-radius: 10px;
  box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px rgba(0, 0, 0, 0.22);
  position: relative;
  overflow: hidden;
  width: 768px;
  max-width: 100%;
  min-height: 480px;
}

.form-container {
  position: absolute;
  top: 0;
  height: 100%;
  transition: all 0.6s ease-in-out;
}

.sign-in-container {
  left: 0;
  width: 50%;
  z-index: 2;
}

.container.right-panel-active .sign-in-container {
  transform: translateX(100%);
}

.sign-up-container {
  left: 0;
  width: 50%;
  opacity: 0;
  z-index: 1;
}

.container.right-panel-active .sign-up-container {
  transform: translateX(100%);
  opacity: 1;
  z-index: 5;
  animation: show 0.6s;
}

@keyframes show {
  0%,
  49.99% {
    opacity: 0;
    z-index: 1;
  }

  50%,
  100% {
    opacity: 1;
    z-index: 5;
  }
}

.overlay-container {
  position: absolute;
  top: 0;
  left: 50%;
  width: 50%;
  height: 100%;
  overflow: hidden;
  transition: transform 0.6s ease-in-out;
  z-index: 100;
}

.container.right-panel-active .overlay-container {
  transform: translateX(-100%);
}

.overlay {
  background-repeat: no-repeat;
  background-size: cover;
  background-position: 0 0;
  color: #ffffff;
  position: relative;
  left: -100%;
  height: 100%;
  width: 200%;
  //pour ne pas voir avant le texte du div qui est en mouvement
  transform: translateX(0);
  transition: transform 1s;
}

//CRÉER COMPTE
.container.right-panel-active .overlay {
  transform: translateX(50%);
}

.overlay-panel {
  position: absolute;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
  padding: 0 40px;
  text-align: center;
  top: 0;
  height: 100%;
  width: 50%;
}

.overlay-left {
  background: #a6cff4;
}

.overlay-right {
  right: 0;
  background: #484877ff;
}

.social-container {
  margin: 20px 0;
}

.social-container a {
  border: 1px solid #dddddd;
  border-radius: 50%;
  display: inline-flex;
  justify-content: center;
  align-items: center;
  margin: 0 5px;
  height: 40px;
  width: 40px;
}

footer {
  color: rgb(92, 92, 92);
  font-size: 13px;
  bottom: 0;
  position: fixed;
  left: 0;
  right: 0;
  text-align: center;
  z-index: 999;
}
</style>
