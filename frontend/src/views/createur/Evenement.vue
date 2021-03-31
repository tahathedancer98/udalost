<template>
  <div>
    <div id="header-wrapper" class="ui stackable six column grid">
      <div id="header" class="container">
        <!--MENU ORDINATEUR-->
        <div id="menu">
          <ul>
            <li class="column">
              <a @click="accueil" accesskey="1" title="">Accueil</a>
            </li>
            <li class="active">
              <a @click="evenement" class="column" accesskey="2" title=""
                >Évenement</a
              >
            </li>
            <li>
              <a @click="profil" class="column" accesskey="4" title=""
                >Profil</a
              >
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
                <b-nav-item @click="accueil" href="#">Accueil</b-nav-item>
                <b-nav-item @click="evenement" class="active"
                  >Évenement</b-nav-item
                >
                <b-nav-item @click="profil">Profil</b-nav-item>
                <b-nav-item @click="seDeconnecter">Se déconnecter</b-nav-item>
              </b-navbar-nav>
            </b-collapse>
          </b-navbar>
        </template>
        <!--FIN MENU PORTABLE-->
      </div>
    </div>

    <div
      class="ui secondary pointing menu ui stackable three column grid"
      id="submenu">
      <a class="active item column" @click="evenement">
        Mes évenements
      </a>
      <a class="item column" @click="invitation">
        Mes invitations
      </a>
      <a class="item column" @click="evenementPublic">
        Évenements publics
      </a>
    </div>

    <div id="wrapper">
      <div
        class="ui stackable two column grid"
        style="margin:0px !important; width:100%; padding:0px !important; padding-left:8.2%; padding-right:8.2%; margin-bottom:3%;"
      >
        <div
          class="ui search column"
          style="margin:0px !important; float:right; width:83%; padding:0px !important; margin-right:2%"
        >
          <div class="ui icon input" id="chercheur">
            <input
              class="prompt"
              type="text"
              placeholder="Rechercher évenement..."
            />
            <i class="search icon"></i>
          </div>
          <div class="results"></div>
        </div>

        <div
          class="ui small basic icon buttons column ui stackable three column grid"
          style="margin:0px !important; float:right; width:15%; padding:0px !important;"
          id="icons"
        >
          <a
            href="#createEvenement-modal"
            class="ui button column"
            id="fire-popup"
          >
            <i class="large calendar plus icon"></i> Ajouter évenement
          </a>
        </div>
      </div>
      <!--TABLE-->
      <div id="messageVideE">
        <span
          ><i class="frown icon"></i> Vous n'avez pas encore créé
          d'événements</span
        >
      </div>
      <div
        class="ui link cards stackable five column grid"
        id="cardsEvenement"
        @click="afficherEvenement"
      >
        <a
          href="#visualiserEvenement-modal"
          class="card column"
          id="cardDiv"
          v-for="(ev, i) in listeEvenements"
        >
          <div style="color:black;" @click="unEvenement(ev.id)">
            <div class="image" id="imageCard">
              <img src="../../assets/images/iconCalendar.png" />
            </div>
            <div class="content">
              <div class="header">{{ ev.titre }}</div>
              <div class="meta">
                <a
                  >{{ ev.adresse }} {{ ev.codePostal }} {{ ev.ville }}
                  {{ ev.pays }}</a
                >
              </div>
              <div class="description">
                {{ ev.description }}
              </div>
            </div>
            <div class="extra content" id="content">
              <span class="right floated" id="date">
                Date : {{ ev.date }} {{ ev.heure }}
              </span>
            </div>
          </div>
        </a>
      </div>
      <!--FIN TABLE-->
    </div>

    <div id="createEvenement-modal" class="modal">
      <div class="modal__contentCreerEv">
        <div class="form">
          <div class="title">
            <span>CRÉER ÉVENEMENT</span>
          </div>
          <form class="ui form" @submit.prevent="geoMap">
            <h5
              style="
								margin-top: 0%;
								margin-bottom: 2%;
								text-align: center;
                font-size:1.1em;
							"
            >
              <i class="address book icon"></i>Remplissez le formulaire suivant
              avec les informations relatives à l'événement que vous souhaitez
              créer.
            </h5>

            <div class="field">
              <div class="field">
                <label><i class="quote left icon"></i>Titre</label>
                <input type="text" name="" v-model="titre" required />
              </div>
            </div>

            <div class="field">
              <div class="field">
                <label><i class="align justify icon"></i>Description</label>
                <textarea rows="2" v-model="description" required></textarea>
              </div>
            </div>

            <div class="field">
              <div class="fields">
                <div class="twelve wide field">
                  <label><i class="calendar alternate icon"></i>Date</label>
                  <input type="date" v-model="date" required />
                </div>
                <div class="four wide field">
                  <label><i class="clock icon"></i>Heure</label>
                  <input type="time" name="" v-model="heure" required />
                </div>
              </div>
            </div>

            <div class="field">
              <div class="field">
                <label><i class="map marker alternate icon"></i>Adresse</label>
                <input type="text" v-model="adresse" required />
              </div>
            </div>

            <div class="three fields">
              <div class="field">
                <label><i class="address book icon"></i>Code postal</label>
                <input type="text" name="" v-model="codePostal" required />
              </div>
              <div class="field">
                <label><i class="building icon"></i>Ville</label>
                <input type="text" name="" v-model="ville" required />
              </div>
              <div class="field">
                <label><i class="flag icon"></i>Pays</label>
                <input type="text" name="" v-model="pays" required />
              </div>
            </div>

            <div class="field">
              <div class="field">
                <label><i class="tags icon"></i>Type d'évenement</label>
                <select class="ui fluid search" v-model="type">
                  <option value="0">Public</option>
                  <option value="1">Private</option>
                </select>
              </div>
            </div>
            <div id="button" class="ui button" tabindex="0">
              <button>ENREGISTRER</button>
            </div>
          </form>
        </div>
        <a href="#" class="modal__close">&times;</a>
      </div>
      <div id="popup-overlay"></div>
    </div>

    <div id="geolocaliser-modal" class="modal">
      <div class="modal__contentGeo">
        <div class="form">
          <a class="ui button" id="retour" href="javascript: history.go(-1)">
            <i class="reply icon"></i> Retourner
          </a>
          <div class="title">
            <span>GÉOLOCALISATION DE "{{ titreModal }}"</span>
          </div>
          <form>
            <div id="map-example-container"></div>
            <input
              id="input-map"
              class="form-control"
              placeholder="Quelle est l'adresse de votre événement ?"
            />
            <div id="button" class="ui button" tabindex="0">
              <button>ENREGISTRER</button>
            </div>
          </form>
        </div>
        <a @click="reload" href="#" class="modal__close">&times;</a>
      </div>
      <div id="popup-overlay"></div>
    </div>

    <div id="visualiserEvenement-modal" class="modal">
      <div class="modal__contentVisualiserEv">
        <div class="form">
          <div class="title">
            <span>ÉVENEMENT "{{ titreModal }}"</span>
          </div>

          <button hidden="hidden" id="link">{{ link }}</button>

          <form class="ui form" @submit.prevent="modifierEvenement">
            <div
              class="ui small basic icon buttons column ui stackable four column grid"
              style="margin:0px !important; float:right; width:50%; padding:0px !important;"
              id="iconsModal"
            >
              <a class="ui button column" @click="participant">
                <i class="large purple users alternate icon"></i>
                {{ totalParticipants }} participants
              </a>
              <a class="ui button column" @click="copierURL">
                <i class="large green share icon"></i> Partager
                <div id="messageCopie">
                  <span><i class="check icon"></i>Lien copié !</span>
                </div>
              </a>
              <a class="ui button column" href="#geolocaliser-modal">
                <i class="large orange map marker alternate icon"></i>
                Géolocaliser
              </a>
              <a class="ui button column" v-for="(ev, i) in listeEvenements">
                <i class="large red trash alternate icon" @click="suppEvenement(ev.id)"></i>
                Supprimer
              </a>
            </div>
            <div class="field">
              <div class="field">
                <label><i class="quote left icon"></i>Titre</label>
                <input type="text" name="" v-model="titreModal" />
              </div>
            </div>

            <div class="field">
              <div class="field">
                <label><i class="align justify icon"></i>Description</label>
                <textarea rows="2" v-model="descriptionModal"></textarea>
              </div>
            </div>

            <div class="field">
              <div class="field">
                <label><i class="tags icon"></i>Type d'évenement</label>
                <select class="ui search" v-model="typeModal">
                  <option value="0">Public</option>
                  <option value="1">Private</option>
                </select>
              </div>
            </div>

            <div class="field">
              <div class="fields">
                <div class="twelve wide field">
                  <label><i class="calendar alternate icon"></i>Date</label>
                  <input type="date" v-model="dateModal" />
                </div>
                <div class="four wide field">
                  <label><i class="clock icon"></i>Heure</label>
                  <input type="time" name="" v-model="heureModal" />
                </div>
              </div>
            </div>

            <div class="field">
              <div class="field">
                <label><i class="map marker alternate icon"></i>Adresse</label>
                <input type="text" v-model="adresseModal" />
              </div>
            </div>

            <div class="three fields">
              <div class="field">
                <label><i class="address book icon"></i>Code Postal</label>
                <input type="text" name="" v-model="codePostalModal" />
              </div>
              <div class="field">
                <label><i class="building icon"></i>Ville</label>
                <input type="text" name="" v-model="villeModal" />
              </div>
              <div class="field">
                <label><i class="flag icon"></i>Pays</label>
                <input type="text" name="" v-model="paysModal" />
              </div>
            </div>

            <div id="button" class="ui button" tabindex="0">
              <button>MODIFIER</button>
            </div>
          </form>
        </div>
        <a href="#" class="modal__close">&times;</a>
      </div>
      <div id="popup-overlay"></div>
    </div>

    <div id="copyright" class="container">
      <p>
        &copy; IUT Nancy-Charlemagne. Tous droits réservés | Licence Pro 1
      </p>
    </div>
  </div>
</template>

<script>
import axios from "axios";

export default {
  data() {
    return {
      typeE: [
        { text: "Public", value: 0 },
        { text: "Private", value: 1 },
      ],
      token: this.$store.state.membre.token,
      titre: "",
      description: "",
      date: "",
      heure: "",
      latitude: "",
      longitude: "",
      adresse: "",
      codePostal: "",
      ville: "",
      pays: "",
      type: "",
      listeEvenements: [],
      participants: [],
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
      idEvenement: "",
      link: "",
      lon: "",
      lat: "",
      id: this.$store.state.membre.utilisateur.id,
      token: this.$store.state.membre.token,
    };
  },
  components: {
   },
  mounted() {
    this.afficherEvenementsUser();
  },
  methods: {
    copierURL() {
      var aux = document.createElement("input");
      aux.setAttribute("value", document.getElementById("link").innerHTML);
      document.body.appendChild(aux);
      aux.select();
      document.execCommand("copy");
      document.body.removeChild(aux);
      this.messageTime();
    },

    messageTime() {
      document.getElementById("messageCopie").style.display = "block";
      setTimeout(function() {
        document.getElementById("messageCopie").style.display = "none";
      }, 1500);
    },

    geoMap() {
      var adresse =
        this.adresse +
        ", " +
        this.ville +
        ", " +
        this.pays +
        ", " +
        this.codePostal;

      const params = {
        address: adresse,
        sensor: false,
        key: "fc0786cbe56423b6ad6be200da5fdda1",
      };

      map
        .get("api/geocoding/", { params })
        .then((response) => {
          var lon,
            lat = "";
          lon = response.data.results[0].geometry.location.lng;
          lat = response.data.results[0].geometry.location.lat;
          console.log(lon);
          console.log(lat);
          this.creerEvenement(lat, lon);
        })
        .catch((error) => {
          console.log("Error with maps========>", error);
        });
    },

    creerEvenement(lat, lon) {
      const config = {
        headers: { Authorization: `Bearer ${this.token}` },
      };

      axios
        .post(
          "http://localhost:8080/evenements/",
          {
            titre: this.titre,
            description: this.description,
            date: this.date,
            heure: this.heure,
            latitude: lat,
            longitude: lon,
            adresse: this.adresse,
            codePostal: this.codePostal,
            ville: this.ville,
            pays: this.pays,
            type: this.type,
          },
          config
        )
        .then((response) => {
          this.rejoindreEvenement(response.data.evenements.id);
          this.$router.push("/successev");
        })
        .catch((error) => {
          this.$router.push("/errorev");
          console.log("Error ========>", error);
        });
    },

    rejoindreEvenement(id) {
      const config = {
        headers: { Authorization: `Bearer ${this.token}` },
      };
      axios
        .put(
          "http://localhost:8080/evenements/" + id + "/rejoindre",
          {
            nom: "",
            status: "2",
            message: "Bonjour, je suis le createur",
          },
          config
        )
        .then((response) => {})
        .catch((error) => {
          console.log("Error ========>", error);
        });
    },

    afficherEvenementsUser() {
      api({
        url: `http://localhost:8080/utilisateurs/` + this.id,
        method: "GET",
      })
        .then(
          (response) => {
            if (response.data.utilisateur[0].evenementsCrees[0].length > 0) {
              //response.data.utilisateur[0].evenementsCrees[0][0].evenementCree
              this.listeEvenements =
                response.data.utilisateur[0].evenementsCrees[0];
              for (
                var i = 0;
                i < response.data.utilisateur[0].evenementsCrees[0].length;
                i++
              ) {
                console.log(
                  response.data.utilisateur[0].evenementsCrees[0][i]
                    .evenementCree
                );
                this.listeEvenements[i] =
                  response.data.utilisateur[0].evenementsCrees[0][
                    i
                  ].evenementCree;
              }
            } else {
              this.listeEvenements = [];
              document.getElementById("messageVideE").style.display = "block";
            }
          },
          function(err) {
            //throw new Error("end of pagination");
            console.log("error");
          }
        )
        .catch((error) => {
          alert("Error :" + error);
        });
    },

    unEvenement(id) {
      api
        .get("http://localhost:8080/evenements/" + id)
        .then((response) => {
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

          this.idEvenement = id;

          this.geolocation(
            response.data.evenement[0].latitude,
            response.data.evenement[0].longitude
          );

          this.link =
            "http://localhost:8080/invitationevenement/" + this.idEvenement;
        })
        .catch((error) => {
          console.log("Error ========>", error);
        });
    },

    modifierEvenement(id) {
      if (this.motpasse == this.motpassev) {
        const config = {
          headers: { Authorization: `Bearer ${this.token}` },
        };
        axios
          .put(
            "http://localhost:8080/evenements/" + this.idEvenement,
            {
              titre: this.titreModal,
              description: this.descriptionModal,
              date: this.dateModal,
              heure: this.heureModal,
              latitude: "222.31",
              longitude: "133.2",
              adresse: this.adresseModal,
              codePostal: this.codePostalModal,
              ville: this.villeModal,
              pays: this.paysModal,
              type: this.typeModal,
            },
            config
          )
          .then((response) => {
            this.$router.push("/successme");
          })
          .catch((error) => {
            this.$router.push("/errorme");
            console.log("Error ========>", error);
          });
      } else { 
          }
    },
     
    suppEvenement(id) {
      console.log('ouhou')
      if(confirm('Voulez-vous supprimer cet événement ?')) {
        api({
          url: `http://localhost:8080/evenements/` + id,
          method: "DELETE",
        })
          .then((response) => {
            console.log("L'évenement est bien supprimé");
            location.reload();
          })
          .catch((error) => {
            console.log("Error ========>", error);
          });
      }
    },

    seDeconnecter() {
      this.$store.commit("setMembre", "");
      this.$router.push("/");
    },

    accueil() {
      this.$router.push("/home");
    },

    evenement() {
      this.$router.push("/evenement");
    },

    profil() {
      this.$router.push("/profil");
    },

    invitation() {
      this.$router.push("/invitation");
    },

    evenementPublic() {
      this.$router.push("/evenementPublic");
    },

    participant() {
      this.$router.push("/participant");
    },

    afficherEvenement() {},

    geolocation(lat, lon) {

      console.log(lat);
      console.log(lon);
      var latlng = {
        lng: lon,
        lat: lat,
      };

      var placesAutocomplete = places({
        appId: "pl27BM5LNVII",
        apiKey: "94c6b06e5b04d29852897181e10625d5",
        container: document.querySelector("#input-map"),
      }).configure({
        aroundLatLng: latlng.lat + "," + latlng.lng, // Paris latitude longitude
        aroundRadius: 10 * 1000, // 10km radius
        type: "address",
      });

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

      var markers = [];
      var markerslat = [];
      map.addLayer(osmLayer);

      var markerlat = L.marker(latlng, { opacity: 1 });
      markerlat.bindPopup("<h3>Votre événement est là</h3>");
      markerlat.addTo(map);
      markerslat.push(markerlat);

      placesAutocomplete.on("suggestions", handleOnSuggestions);
      placesAutocomplete.on("cursorchanged", handleOnCursorchanged);
      placesAutocomplete.on("change", handleOnChange);
      placesAutocomplete.on("clear", handleOnClear);

      function handleOnSuggestions(e) {
        markers.forEach(removeMarker);
        markers = [];

        if (e.suggestions.length === 0) {
          map.setView(new L.LatLng(latlng.lat, latlng.lng), 16);
          return;
        }

        e.suggestions.forEach(addMarker);
        findBestZoom();
      }

      function handleOnChange(e) {
        markers.forEach(function(marker, markerIndex) {
          if (markerIndex === e.suggestionIndex) {
            markers = [marker];
            marker.setOpacity(1);
            findBestZoom();
          } else {
            removeMarker(marker);
          }
        });
      }

      function handleOnClear() {
        map.setView(new L.LatLng(0, 0), 1);
        markers.forEach(removeMarker);
      }

      function handleOnCursorchanged(e) {
        markers.forEach(function(marker, markerIndex) {
          if (markerIndex === e.suggestionIndex) {
            marker.setOpacity(1);
            marker.setZIndexOffset(1000);
          } else {
            marker.setZIndexOffset(0);
            marker.setOpacity(0.5);
          }
        });
      }

      function addMarker(suggestion) {
        var marker = L.marker(suggestion.latlng, { opacity: 0.4 });
        console.log("suggestion");
        marker.bindPopup(
          "<h4>Nouvelle adresse de votre événement</h4><br><span>Les modifications seront prises en compte lorsque vous cliquez sur 'Accepter'.</span>"
        );
        marker.addTo(map);
        markers.push(marker);
      }

      function removeMarker(marker) {
        map.removeLayer(marker);
      }

      function findBestZoom() {
        var featureGroup = L.featureGroup(markers);
        map.fitBounds(featureGroup.getBounds().pad(0.5), { animate: true });
      }
    },

    reload() {
      //location.reload();
      //this.$router.push("/home");
      var container = L.DomUtil.get("map-example-container");
      if (container != null) {
        //container.outerHTML = ""; // Clear map generated HTML
        container._leaflet_id = null;
        //L.map("map-example-container");
      }
    },
  },
};
</script>

<style lang="scss" scoped>
@import url("https://fonts.googleapis.com/css2?family=Raleway:wght@300&display=swap");
@import "node_modules/bootstrap/scss/bootstrap.scss";
@import "node_modules/bootstrap-vue/src/index.scss";
@import "https://cdn.jsdelivr.net/leaflet/1/leaflet.css";

#map-example-container {
  height: 40vh;
}

* {
  font-family: "Raleway", sans-serif;
}

#messageVideE {
  text-align: center;
  font-size: 1.2em;
  display: none;
  color: rgb(126, 4, 4);
}

#messageCopie {
  text-align: center;
  font-size: 1.2em;
  display: none;
  margin-top: 1%;
  color: green;
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
  padding: 4em 0em 7em 0em;
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
  position: relative;
  background: rgb(48, 48, 78);
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
  margin-right: 0%;
  display: "";
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
/* Extra                                                                         */
/*********************************************************************************/

#three-column {
  text-align: center;
  color: rgba(0, 0, 0, 0.6);
}

#three-column .fa {
  display: block;
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

  & a {
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
  }
}

//modal

$base: #0f1923;
$white: #ece8e1;
$height: 7vh;
$transition: 0.3s ease-out all;

.modal {
  visibility: hidden;
  opacity: 0;
  z-index: 50;
  position: absolute;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  display: flex;
  align-items: center;
  justify-content: center;
  background: rgba(0, 0, 0, 0.719);
  height: 100vh;
  transition: all 0.4s;
}

.modal:target {
  visibility: visible;
  opacity: 1;
}

.modal__contentCreerEv {
  border-radius: 10px;
  position: relative;
  width: 100%;
  height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;

  & > .form {
    border-radius: 10px;
    box-shadow: 10px $base;
    background-color: rgb(255, 255, 255);
    padding: 3%;
    padding-bottom: 2%;
    font-size: 1.3vh;
    margin: 5%;
    width: 100%;

    & input,
    textarea,
    select {
      background-color: #30303015;
      height: 4vh;
      border: none;
      color: black;

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
        width: 50%;
        height: 5vh;
        border: none !important;
        background-color: rgb(48, 48, 78);
        color: white;
        cursor: pointer;

        &:hover {
          border: none !important;
          background-color: rgba(72, 72, 119, 0.822);
          transition: 0.5s;
        }
      }
    }
  }
}

.modal__contentVisualiserEv {
  border-radius: 10px;
  position: relative;
  width: 100%;
  height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;

  & > .form {
    border-radius: 10px;
    box-shadow: 10px $base;
    background-color: rgb(255, 255, 255);
    padding: 3%;
    padding-bottom: 2%;
    font-size: 1.3vh;
    margin: 5%;
    width: 100%;

    & input,
    textarea,
    select {
      background-color: #30303015;
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
        width: 50%;
        height: 5vh;
        border: none !important;
        background-color: rgb(48, 48, 78);
        color: white;
        cursor: pointer;

        &:hover {
          border: none !important;
          background-color: rgba(72, 72, 119, 0.822);
          transition: 0.5s;
        }
      }
    }
  }
}

.modal__contentGeo {
  border-radius: 10px;
  position: relative;
  width: 100%;
  height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;

  & > .form {
    border-radius: 10px;
    box-shadow: 10px $base;
    background-color: rgb(255, 255, 255);
    padding: 3%;
    padding-bottom: 2%;
    font-size: 1.3vh;
    margin: 5%;
    width: 100%;

    & input,
    textarea {
      background-color: #30303015;
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
        width: 50%;
        height: 5vh;
        border: none !important;
        background-color: rgb(48, 48, 78);
        color: white;
        cursor: pointer;

        &:hover {
          border: none !important;
          background-color: rgba(72, 72, 119, 0.822);
          transition: 0.5s;
        }
      }
    }
  }
}

.modal__close {
  position: absolute;
  top: 10px;
  right: 10px;
  color: #a6cff4;
  margin-right: 5%;
  font-size: 30px;
  text-decoration: none;

  &:hover {
    color: #a6cff4;
  }
}

#iconsModal {
  border: none;
  border-radius: 0;

  & a:hover {
    border-radius: 0;
    border: none;
    background: #f5f5f5 !important;
  }
}

#retour {
  background: rgba(255, 255, 255);
  color: grey;
  border-radius: 0px;
  height: 15px;
  justify-content: center;
  margin-left: 8.2%;

  &:hover {
    border: none;
    color: #484877ff;
  }
}
</style>
