<template>
  <div>
    <div id="header-wrapper" class="ui stackable six column grid">
      <div id="header" class="container">
        <div id="logo" class="column">
          <img src="../../assets/images/logo1.png" />
        </div>

        <!--MENU ORDINATEUR-->
        <div id="menu">
          <ul>
            <li class="active column">
              <a @click="accueil" accesskey="1" title="">Accueil</a>
            </li>
            <li>
              <a @click="evenement" class="column" accesskey="2" title="">Évenement</a>
            </li>
            <li>
              <a @click="profil" class="column" accesskey="4" title="">Profil</a>
            </li>
            <li>
              <a @click="seDeconnecter" class="column" accesskey="5" title=""
                >Se déconnecter</a
              >
            </li>
          </ul>
        </div>

        <!--FIN MENU ORDINATEUR-->

        <!--MENU PORTABLE-->
         <template class="menuGeneral">
          <b-navbar toggleable type="dark" id="navPortable">
            <b-navbar-toggle
              target="navbar-toggle-collapse"
              class="menuPortable"
            >
              <b-icon variant="dark" icon="grid3x3-gap-fill"></b-icon>
            </b-navbar-toggle>

            <b-collapse id="navbar-toggle-collapse" is-nav>
              <b-navbar-nav class="">
                <b-nav-item @click="accueil" class="active" href="#">Accueil</b-nav-item>
                <b-nav-item @click="evenement">Évenement</b-nav-item>
                <b-nav-item @click="profil">Profil</b-nav-item>
                <b-nav-item @click="seDeconnecter">Se déconnecter</b-nav-item>
              </b-navbar-nav>
            </b-collapse>
          </b-navbar>
        </template>
        <!--FIN MENU PORTABLE-->
      </div>
      <div id="banner" class="container ui stackable one column grid">
        <div class="column" style="text-align:center;">
          <div class="title">
            <h2>UDÁLOST</h2>
            <span class="bylineTitle"
              >Bonjour {{fullname}}, commencez à créer vous-même de nouveaux
              événements</span
            >
          </div>
          <ul class="actions">
            <li><a @click="evenement" class="button">Commencer</a></li>
          </ul>
        </div>
      </div>
    </div>
    <div id="wrapper">
      <div id="three-column" class="container">
        <div class="container ui stackable one column grid">
          <div class="title column" style="text-align:center;">
            <h2>DES ÉVENEMENTS</h2>
            <br />
            <span class="byline"
              >Trouvez l'option qui vous convient le mieux</span
            >
          </div>
        </div>
        <div class="container ui stackable three column grid">
          <div class="boxA column">
            <span class="fa fa-cloud-download"></span>
            <p>
              Visualisez tous vos événements créés et profitez des multiples fonctionnalités de la plateforme
            </p>
            <a @click="evenement" class="button button-alt">Mes événements crées</a>
          </div>
          <div class="boxB column">
            <span class="fa fa-cogs"></span>
            <p>
              Visualiser et gérer en un seul clic votre participation aux événements auxquels vous avez été invité !
            </p>
            <a @click="invitation" class="button button-alt">Mes invitations à évenements</a>
          </div>
          <div class="boxC column">
            <span class="fa fa-wrench"></span>
            <p>
              Consultez, accédez et participez à tous les événements publics publiés sur la plateforme.
            </p>
            <a @click="evenementPublic" class="button button-alt">Des événements publics</a>
          </div>
        </div>
      </div>
    </div>
    <div id="welcome">
      <div class="container ui stackable one column grid">
        <div class="column">
          <div class="title" style="text-align:center;">
            <h2>Téléchargez notre application mobile</h2>
            <span class="byline"
              >Disponible sur tout système d'exploitation</span
            >
          </div>
          <p>
            Profitez et exploitez davantage Událost en téléchargeant
            l'application mobile. Vous bénéficierez ainsi d'une plus grande
            portabilité.<br /><br />

            Cliquez sur le bouton suivant pour y accéder
          </p>
          <ul class="actions">
            <li><a href="#" class="button">Télécharger l'appli mobile</a></li>
          </ul>
        </div>
      </div>
    </div>
    <div id="copyright" class="container">
      <p>
        &copy; IUT Nancy-Charlemagne. Tous droits réservés | Licence Pro 1
      </p>
    </div>
  </div>
</template>

<script>
import HelloWorld from "@/components/HelloWorld.vue";
//const $ = require("jquery");
// On le declare globalement
//window.$ = $;

export default {
  name: "Home",
  components: {
    HelloWorld,
  },
  data() {
    return {
        fullname : this.$store.state.membre.utilisateur.prenom + ' ' + this.$store.state.membre.utilisateur.nom
    };
  },
  mounted() {},
  methods: {
    seDeconnecter(){
      this.$router.push("/");
    },

    accueil(){
      this.$router.push("/home");
    },

    evenement(){
      this.$router.push("/evenement");
    },

    profil(){
      this.$router.push("/profil");
    },

    invitation() {
      this.$router.push("/invitation");
    },

    evenementPublic() {
      this.$router.push("/evenementPublic");
    },
  },
};
</script>

<style lang="scss" scoped>
@import url("https://fonts.googleapis.com/css2?family=Raleway:wght@300&display=swap");
@import "node_modules/bootstrap/scss/bootstrap.scss";
@import "node_modules/bootstrap-vue/src/index.scss";

* {
  font-family: "Raleway", sans-serif;
}

a{
  cursor: pointer;
}

html,
body {
  height: 100%;
}

body {
  margin: 0px;
  padding: 0px;
  background: #111111;
  font-family: "Didact Gothic", sans-serif;
  font-size: 12pt;
  font-weight: 200;
  color: #fff;
}

h1,
h2,
h3 {
  margin: 0;
  padding: 0;
}

p,
ol,
ul {
  margin-top: 0;
}

ol,
ul {
  padding: 0;
  list-style: none;
}

p {
  line-height: 180%;
}

a {
  color: #ee0000;
}

a:hover {
  text-decoration: none;
}

.container {
  width: 100%;
}

/*********************************************************************************/
/* Image Style                                                                   */
/*********************************************************************************/

.image {
  display: inline-block;
}

.image img {
  display: block;
  width: 100%;
}

.image-full {
  display: block;
  width: 100%;
  margin: 0 0 2em 0;
}

.image-left {
  float: left;
  margin: 0 2em 2em 0;
}

.image-centered {
  display: block;
  margin: 0 0 2em 0;
}

.image-centered img {
  margin: 0 auto;
  width: auto;
}

.fa-1x {
  font-size: 1.5rem;
}
.navbar-toggler.toggler-example {
  cursor: pointer;
}

/*********************************************************************************/
/* List Styles                                                                   */
/*********************************************************************************/

/*********************************************************************************/
/* Social Icon Styles                                                            */
/*********************************************************************************/

ul.contact {
  margin: 0;
  padding: 2em 0em 0em 0em;
  list-style: none;
}

ul.contact li {
  display: inline-block;
  padding: 0em 0.3em;
  font-size: 1em;
}

ul.contact li span {
  display: none;
  margin: 0;
  padding: 0;
}

ul.contact li a {
  color: #fff;
}

ul.contact li a:before {
  display: inline-block;
  background: #3f3f3f;
  width: 40px;
  height: 40px;
  line-height: 40px;
  border-radius: 20px;
  text-align: center;
  color: #ffffff;
}

/*********************************************************************************/
/* Button Style                                                                  */
/*********************************************************************************/

.button {
  display: inline-block;
  padding: 1em 2em 1em 2em;
  letter-spacing: 0.1em;
  margin-top: 2em;
  padding: 1.4em 3em;
  border: 2px solid rgba(255, 255, 255, 1);
  border-radius: 6px;
  text-decoration: none;
  font-weight: 700;
  font-size: 1em;
  color: #fff;

  &:hover {
    background-color: #484877ff;
    border: 2px solid #484877ff;
    color: white;
    transition: 1s;
  }
}

.button-alt {
  padding: 1em 2em;
  border-color: #484877ff;
  color: rgba(0, 0, 0, 0.8);
}

/*********************************************************************************/
/* 4-column                                                                      */
/*********************************************************************************/

.box1,
.box2,
.box3,
.box4 {
  width: 235px;
}

.box1,
.box2,
.box3 {
  float: left;
  margin-right: 20px;
}

.box4 {
  float: right;
}

/*********************************************************************************/
/* 3-column                                                                      */
/*********************************************************************************/

/*********************************************************************************/
/* 2-column                                                                      */
/*********************************************************************************/

.tbox1,
.tbox2 {
  width: 575px;
}

.tbox1 {
  float: left;
}

.tbox2 {
  float: right;
}

/*********************************************************************************/
/* Heading Titles                                                                */
/*********************************************************************************/

.title {
  margin-bottom: 3em;
  color: white;
}

.title h2 {
  font-size: 2.7em;
}

.title .byline {
  font-size: 1.3em;
  color: rgba(255, 255, 255, 0.356);
}

.bylineTitle {
  font-size: 1.3em;
  color: rgba(255, 255, 255, 0.356);
}

/*********************************************************************************/
/* Header                                                                        */
/*********************************************************************************/

#wrapper {
  width: 100% !important;
  padding: 8em 0em 7em 0em;
  background: #fff;
}

/*********************************************************************************/
/* Header                                                                        */
/*********************************************************************************/

#header-wrapper {
  position: relative;
  padding: 5em 0em 7em 0em;
  background: linear-gradient(rgba(72, 72, 119, 0.582), rgb(48, 48, 78)),
    url("../../assets/images/background3.jpg") no-repeat center;
  background-size: cover;
}

#header {
  position: relative;
  padding: 5em 0em;
}

/*********************************************************************************/
/* Logo                                                                          */
/*********************************************************************************/

#logo {
  & img {
    width: 12%;
    margin-top: -5%;
    margin-left: 5%;
  }
}
/*********************************************************************************/
/* Menu                                                                          */
/*********************************************************************************/

#menu {
  position: absolute;
  top: 4.5em;
  right: 0;
  margin-right: 0%;
  display: '';
}

#menu ul {
  display: inline-block;
}

#menu li {
  display: block;
  float: left;
  text-align: center;
}

#menu li a,
#menu li span {
  padding: 1em 1.5em;
  letter-spacing: 1px;
  text-decoration: none;
  text-transform: uppercase;
  font-size: 0.8em;
  color: rgba(255, 255, 255, 0.8);

  &:hover {
    border-bottom: 2px solid rgba(255, 255, 255, 1);
  }
}

#menu .active a {
  border: 2px solid rgba(255, 255, 255, 1);
  border-radius: 6px;
  color: rgba(255, 255, 255, 1);

  &:hover {
    background-color: #484877ff;
    border: 2px solid #484877ff;
    transition: 1s;
  }
}

/*********************************************************************************/
/* Banner                                                                        */
/*********************************************************************************/

#banner {
  padding-top: 10em;
  text-align: center;
}

#banner .title h2 {
  font-size: 4em;
}

#banner .title .byline {
  font-size: 2em;
}

#banner .button {
  margin-top: 2em;
  padding: 1.4em 3em;
  border: 2px solid rgba(255, 255, 255, 1);
  border-radius: 6px;
  font-weight: 700;
  font-size: 1em;

  &:hover {
    border: 2px solid #a6cff4;
    background-color: #a6cff4;
  }
}

#copyright {
  width: 100%;
  padding: 5em 0em;
}

#copyright p {
  text-align: center;
  font-size: 1em;
  color: rgba(0, 0, 0, 0.699);
}

#copyright a {
  text-decoration: none;
  color: rgba(0, 0, 0, 0.699);
}

/*********************************************************************************/
/* Welcome                                                                       */
/*********************************************************************************/

#welcome {
  position: relative;
  padding: 7em 0em 7em 0em;
  background: linear-gradient(rgba(72, 72, 119, 0.521), rgb(48, 48, 78)),
    url("../../assets/images/mapmobile.jpg") no-repeat center;
  background-size: cover;
  text-align: center;

  & .button:hover {
    border: 2px solid #a6cff4;
    background-color: #a6cff4;
  }
}

#welcome .container {
  width: 100%;
  padding: 0px 100px;
  color: rgba(255, 255, 255, 0.8);
}

#welcome a {
  color: rgba(255, 255, 255, 1);
}

/*********************************************************************************/
/* Extra                                                                         */
/*********************************************************************************/

#three-column {
  text-align: center;
  color: rgba(0, 0, 0, 0.6);
}

#three-column .fa {
  display: block;
  padding: 1em 0em;
  color: rgba(0, 0, 0, 1);
  font-size: 2em;
}

#three-column .title h2 {
  font-weight: bold;
  color: rgba(0, 0, 0, 0.8);
}

#three-column .title .byline {
  text-align: center;
  color: rgba(0, 0, 0, 0.5);
}

// NAV MOBILE

#navPortable {
  display: none;
  float: left;
}

.menuPortable{
  background-color:rgb(255, 255, 255);
}

@media screen and (max-width: 900px) {
  #navPortable {
    display: inline-block;
  }

  #menu {
  display: none;
  top: 0px;
  }

  #header {
  padding: 0px;

  #logo {
  & img {
    float:right;
    width: 18%;
    margin-top: 0%;
    margin-right:5%;
  }
}
}

}
</style>
