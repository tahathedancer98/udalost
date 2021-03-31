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
    evenements: [],
    membres: []
  },
  mutations: {
    setMembre(state, membre){
      state.membre = membre;
    },
    setAdmin(state, admin){
      state.admin = admin;
    },
    setToken(state, token){
      state.token = token;
    },
    setMembres(state,membres){
      state.membres = membres;
    },
    setEvenements(state,evenements){
      state.evenenements = evenenements;
    }
  },
  actions: {
  },
  modules: {
  },
  plugins: [vuexLocal.plugin]
})
