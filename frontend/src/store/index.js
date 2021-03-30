import Vue from 'vue'
import Vuex from 'vuex'
import VuexPersistence from 'vuex-persist'

const vuexLocal = new VuexPersistence({
  storage: window.localStorage
})

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    membre:false,
    admin:false,
    token:false,
    conversations: [],
    evenements:[],
    membres: []
  },
  mutations: {
    setMembre(state, membre){
      state.membre = membre;
    },
    setEvenement(state,evenement){
      state.membre = evenement;
    },
    setAdmin(state, admin){
      state.admin = admin;
    },
    setToken(state, token){
      state.token = token;
    },
    setMembres(state,membres){
      state.membres = membres;
    }
  },
  actions: {
  },
  modules: {
  },
  plugins: [vuexLocal.plugin]
})
