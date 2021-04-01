<template>
  <div>
    <div id="header-wrapper" class="ui stackable six column grid">
      <div id="header" class="container">
        <!--MENU ORDINATEUR-->
        <div id="menu">
          <ul>
            <li class="active">
              <a @click="seDeconnecter" class="column" accesskey="5" title=""
                >Se connecter</a
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
                <b-nav-item class="active" @click="seDeconnecter"
                  >Se déconnecter</b-nav-item
                >
              </b-navbar-nav>
            </b-collapse>
          </b-navbar>
        </template>
        <!--FIN MENU PORTABLE-->
      </div>
    </div>

    <div id="wrapper">
      <div class="form" id="modal__contentVisualiserEv">
        <form class="ui form" @submit.prevent="rejoindreEvenement">
          <div
            class="ui small basic icon buttons column ui stackable three column grid"
            style="margin:0px !important; margin-bottom:5%; float:right; width:20%; padding:0px !important;"
            id="iconsModal"
          >
            <a class="ui button column">
              État : En attente
              <i class="clock grey icon"></i>
            </a>
          </div>

          <div id="champUser">
            <div class="field" id="hidden">
              <h5
                style="
								margin-top: 4%;
								margin-bottom: 2%;
								text-align: center;
                font-size:1.1em;
							"
              >
                <i class="arrow circle down icon"></i>Veuillez saisir votre nom
                et un message pour le créateur de l'événement
              </h5>
              <div class="field">
                <label><span style="color:red;">* </span>Nom</label>
                <input type="text" name="" v-model="nom" required />
              </div>
            </div>

            <div class="field">
              <div class="field">
                <label><span style="color:red;">* </span>Message</label>
                <textarea rows="4" v-model="message" required></textarea>
              </div>
            </div>
          </div>

          <div class="title">
            <span>ÉVENEMENT {{ titreModal }}</span>
          </div>
          <h5
            style="
								margin-top: 0%;
								margin-bottom: 2%;
								text-align: center;
                font-size:1.1em;
							"
          >
            <i class="user circle icon"></i>Vous trouverez ci-dessous les
            informations concertant l'événement
          </h5>

          <div class="field">
            <div class="field">
              <label><i class="quote left icon"></i>Titre</label>
              <input
                type="text"
                name=""
                v-model="titreModal"
                readonly="readonly"
              />
            </div>
          </div>

          <div class="field">
            <div class="field">
              <label><i class="align justify icon"></i>Description</label>
              <textarea
                rows="2"
                v-model="descriptionModal"
                readonly="readonly"
              ></textarea>
            </div>
          </div>

          <div class="field">
            <div class="fields">
              <div class="twelve wide field">
                <label><i class="calendar alternate icon"></i>Date</label>
                <input type="date" v-model="dateModal" readonly="readonly" />
              </div>
              <div class="four wide field">
                <label><i class="clock icon"></i>Heure</label>
                <input
                  type="time"
                  v-model="heureModal"
                  name=""
                  readonly="readonly"
                />
              </div>
            </div>
          </div>

          <div class="field">
            <div class="field">
              <label><i class="map marker alternate icon"></i>Adresse</label>
              <input type="text" v-model="adresseModal" readonly="readonly" />
            </div>
          </div>

          <div class="three fields">
            <div class="field">
              <label><i class="address book icon"></i>Code postal</label>
              <input
                type="text"
                name=""
                v-model="codePostalModal"
                readonly="readonly"
              />
            </div>
            <div class="field">
              <label><i class="building icon"></i>Ville</label>
              <input
                type="text"
                name=""
                v-model="villeModal"
                readonly="readonly"
              />
            </div>
            <div class="field">
              <label><i class="flag icon"></i>Pays</label>
              <input
                type="text"
                name=""
                v-model="paysModal"
                readonly="readonly"
              />
            </div>
          </div>

          <div id="map-example-container"></div>

          <div class="ui comments" style="margin-top:6%;">
            <h1>Commentaires</h1>
            <div class="comment">
              <div style="padding-bottom:3%" v-for="(com, i) in this.comments">
                <a class="avatar">
                  <img src="../../assets/images/users.png" />
                </a>
                <div class="content" style="width:100% !important">
                  <a class="author">Utilisateur</a>
                  <div class="metadata">
                    <div class="date">{{ com.updated_at }}</div>
                  </div>
                  <div class="text" style="width:100% !important">
                    {{ com.texte }}
                  </div>
                  <div class="actions">
                    <a class="reply active">{{ com.lien }}</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <form class="ui reply form" id="comments" @submit.prevent="commenter">
            <div class="field">
              <textarea
                v-model="texte"
                placeholder="Écrire un commentaire..."
              ></textarea>
              <input v-model="lien" type="url" placeholder="URL" />
            </div>
            <div id="button" class="ui button" tabindex="0">
              <button id="green">
                Commenter
              </button>
            </div>
          </form>

          <div class="two fields" id="buttonOptions">
            <div class="field">
              <div id="button" class="ui button" tabindex="0">
                <button id="green" @click="optionResponse(true)">
                  ACCEPTER
                </button>
              </div>
            </div>
            <div class="field">
              <div id="button" class="ui button" tabindex="0">
                <button id="red" @click="optionResponse(false)">REFUSER</button>
              </div>
            </div>
          </div>
        </form>
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
import axios from "axios";
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
      id: this.$route.params.id,
      nom: "",
      message: "",
      status: "",
      titreModal: "",
      descriptionModal: "",
      dateModal: "",
      heureModal: "",
      latitudeModal: "",
      longitudeModal: "",
      adresseModal: "",
      codePostalModal: "",
      villeModal: "",
      paysModal: "",
      typeModal: "",
      totalParticipants: "",
      token: null,
      res: true,
      texte: "",
      lien: "",
      comments: [],
      idpar: [],
      nomC: [],
    };
  },
  mounted() {
    this.$store.commit("setInvitation", "Je suis un invité");
    this.unEvenement();
  },
  methods: {
    seDeconnecter() {
      this.$store.commit("setInvitation", "");
      this.$router.push("/");
    },

    rejoindreEvenement() {
      var bearertoken = "Bearer " + this.token;

      const config = {
        headers: null,
      };

      if (this.res == true) {
        this.status = 2;
      } else if (this.res == false) {
        this.status = 1;
      }

      if (bearertoken == "Bearer null") {
        axios
          .put(
            "http://localhost:8080/evenements/" + this.id + "/rejoindre",
            {
              nom: this.nom,
              status: this.status,
              message: this.message,
            },
            config
          )
          .then((response) => {
            if (this.status == 2) {
              this.$router.push("/acepteInvitation");
            } else {
              this.$router.push("/refuseInvitation");
            }
          })
          .catch((error) => {
            console.log("Error ========>", error);
          });
      } else {
        //this.$router.push("/home");
      }
    },

    unEvenement() {
      axios
        .get("http://localhost:8080/evenements/" + this.id)
        .then((response) => {
          this.geolocation(
            response.data.evenement[0].latitude,
            response.data.evenement[0].longitude
          );
        
        for(var i=0; i<response.data.evenement[0].participants[0][0].participant.commentaires.length; i++){     
          console.log("PARTICIPANTE");
          this.comments.push(response.data.evenement[0].participants[0][0].participant.commentaires[i]);
        }

        // for(var i=0; i<response.data.evenement[0].participantsNonInscrits[0][0].participantNonInscrit.commentaires.length; i++){  
        //   console.log("PARTICIPANTE NO INSCRITO");
        //   this.comments.push(response.data.evenement[0].participantsNonInscrits[0][0].participantNonInscrit.commentaires[i]);
        // }

          this.totalParticipants =
            response.data.evenement[0].participants.count +
            (this.totalParticipants =
              response.data.evenement[0].participantsNonInscrits.count);
          this.titreModal = response.data.evenement[0].titre;
          this.descriptionModal = response.data.evenement[0].description;
          this.dateModal = response.data.evenement[0].date;
          this.heureModal = response.data.evenement[0].heure;
          this.latitudeModal = response.data.evenement[0].latitude;
          this.longitudeModal = response.data.evenement[0].longitude;
          this.adresseModal = response.data.evenement[0].adresse;
          this.codePostalModal = response.data.evenement[0].codePostal;
          this.villeModal = response.data.evenement[0].ville;
          this.paysModal = response.data.evenement[0].pays;
          this.typeModal = response.data.evenement[0].type;
       })
        .catch((error) => {
          console.log("Error ========>", error);
        });
    },

    unParticipant(id, i) {
      axios({
        url: `/participants/` + id,
        method: "GET",
      })
        .then(
          (response) => {
            console.log(response.data);
          },
          function(err) {
            console.log("error");
          }
        )
        .catch((error) => {
          alert("Error :" + error);
        });
    },

    optionResponse(x) {
      if (x == true) {
        this.res = true;
      } else {
        this.res = false;
      }
    },

    accueil() {
      this.$router.push("/home");
    },

    evenement() {
      this.$router.push("/evenement");
    },

    commenter() {
      axios
        .post(
          "http://localhost:8080/evenements/" +
            this.$route.params.id +
            "/commentaires",
          {
            id_participant: 44,//Modif ici pour ... 
            texte: this.texte,
            lien: this.lien,
          }
        )
        .then((response) => {
          this.unEvenement();
          this.comments.push(response.data.commentaires);
        })
        .catch((error) => {
          console.log("Error ========>", error);
        });
    },

    profil() {
      this.$router.push("/profil");
    },

    geolocation(lat, lon) {
      console.log(lat);
      console.log(lon);
      var latlng = {
        lng: lon,
        lat: lat,
      };

      var map = "";

      if (!map) {
        map = new L.map("map-example-container", {
          center: [latlng.lat, latlng.lng],
          zoom: 5,
          renderer: L.canvas(),
          attributionControl: true,
        });
      }

      map.setView(new L.LatLng(latlng.lat, latlng.lng), 16);

      var osmLayer = new L.TileLayer(
        "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
        {
          minZoom: 1,
          maxZoom: 17,
          attribution:
            'Map data © <a href="https://openstreetmap.org">OpenStreetMap</a> contributors',
        }
      );

      var markerslat = [];
      map.addLayer(osmLayer);

      var markerlat = L.marker(latlng, { opacity: 1 });
      markerlat.bindPopup("<h3>Votre événement est là</h3>");
      markerlat.addTo(map);
      markerslat.push(markerlat);
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

#map-example-container {
  height: 40vh;
}

#comments {
  width: 100% !important;
  padding: 0% !important;
  margin: 0% !important;
  display: block;
  justify-content: center;
  text-align: center;

  & div:first-of-type {
    background: #0000000e;

    textarea::placeholder {
      color: #000000;
    }
    input {
      background: wheat !important;

      &::placeholder {
        color: #000000;
      }
    }
  }

  & div:last-of-type {
    width: 100%;

    button {
      background: #a6cff4 !important;
    }
  }
}

#messageError {
  text-align: center;
  color: red;
  display: none;
}
#cnt {
  display: none;
}
a {
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
  color: rgb(255, 255, 255);

  &:hover {
    background-color: #484877ff;
    border: 2px solid #484877ff;
    color: white;
    transition: 1s;
  }
}

.button-alt {
  width: 100%;

  color: rgba(0, 0, 0, 0.8);
}

.boxA,
.boxB,
.boxC {
  width: 100%;
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
  background: #fff;
}

#wrapper2 {
  width: 100% !important;
  background: #fff;
}

/*********************************************************************************/
/* Header                                                                        */
/*********************************************************************************/

#header-wrapper {
  background: rgb(48, 48, 78);
  background-size: cover;
}

#header {
  padding: 5em 0em;
}

/*********************************************************************************/
/* Logo                                                                          */
/*********************************************************************************/

#logo {
  & img {
    width: 12%;
    margin-top: -2%;
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
  margin-right: 5%;
  display: block;
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

// NAV MOBILE

#navPortable {
  display: none;
  float: left;
}

.menuPortable {
  background-color: rgb(255, 255, 255);
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
        float: right;
        width: 18%;
        margin-top: 2%;
        margin-right: 5%;
      }
    }
  }

  #header-wrapper {
    padding: 5%;
  }
}

// CARD EVENEMENT

#cardsEvenement {
  text-align: center;
  display: block !important;

  & #cardDiv {
    display: inline-block;
    background-color: #00000007;
    padding: 0% !important;
    box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px rgba(0, 0, 0, 0.22);

    #content {
      background-color: rgb(0, 0, 0);
      width: 100%;
      height: 70px;
      display: flex;
      align-items: center;
      justify-content: center;
      margin: 0% !important;
      color: white;

      span {
        margin-left: 5%;
      }

      #date {
        color: #a6cff4;
      }

      &:hover {
        background-color: #3f3f3f;
      }
    }

    &:hover {
      background-color: #0000000e;
    }
  }
}

#icons {
  float: right;
  margin-right: 8.2%;
  border: none;

  & button {
    float: right;
    border: none;
    border-radius: 0%;
    font-size: 100%;
    background-color: rgb(0, 110, 37) !important;
    color: white !important;
    width: 100%;
    border-radius: 100px;

    &:nth-child(1) > i {
      color: white;
    }

    &:hover {
      background-color: rgb(0, 65, 22) !important;
    }
  }
}

#chercheur {
  width: 100%;
  color: black;

  & input {
    width: 100%;
    background-color: #00000015;

    &::placeholder {
      color: rgb(78, 78, 78);

      &:hover {
        background-color: #a6cff4;
      }
    }
  }
}

#submenu {
  display: flex;
  justify-content: center;

  & a {
    display: flex;
    justify-content: center;

    &:hover {
      color: #484877ff;
    }
  }
}

#imageCard {
  background-color: white;
  display: flex;
  justify-content: center;

  img {
    width: 50%;
    padding: 4%;
    filter: hue-rotate(200deg);
  }
}

$base: #0f1923;
$white: #ece8e1;
$height: 7vh;
$transition: 0.3s ease-out all;

.form {
  width: 100%;
  padding: 2%;

  input,
  textarea {
    background-color: #30303015 !important;
    height: 4vh;
    border: none;

    &:hover {
      background-color: #a6d0f42d;
      border: 1px solid #a6d0f42d;
    }
  }
  & .title {
    display: grid;
    justify-content: center;
    align-items: center;
    grid-template-columns: repeat(3, 1fr);
    color: #484877ff;
    text-align: center;
    height: 10px;
    font-size: 150%;

    & span {
      grid-column: 2/3;
    }
  }

  & #button {
    display: flex;
    justify-content: center;
    background-color: white;
    border: none !important;

    & button {
      border-radius: 100px;
      width: 100%;
      height: 5vh;
      border: none !important;
      background-color: rgb(48, 48, 78);
      color: white;
      cursor: pointer;

      &#green {
        background-color: green;

        &:hover {
          border: none !important;
          background-color: rgb(4, 95, 4);
          transition: 0.5s;
        }
      }

      &#red {
        background-color: rgb(173, 2, 2);

        &:hover {
          border: none !important;
          background-color: rgb(110, 0, 0);
          transition: 0.5s;
        }
      }
    }
  }
}

#buttonOptions {
  width: 100%;
}

#champUser {
  margin-bottom: 5%;
  input,
  textarea {
    background-color: #a6d0f479 !important;
    height: 4vh;
    border: none;

    &:hover {
      background-color: #a6d0f42d;
      border: 1px solid #a6d0f42d;
    }
  }
}
</style>
