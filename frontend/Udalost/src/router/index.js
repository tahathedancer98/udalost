import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'Login',
    component: () => import( '../views/Login.vue')
  },
  {
    path: '/home',
    name: 'Home',
    component: () => import( '../views/createur/Home.vue')
  },
  {
    path: '/loading',
    component: () => import('../views/general/Loading.vue')
  },
  {
    path: '/loadingadmin',
    component: () => import('../views/general/LoadingAdmin.vue')
  },
  {
    path: '/evenement',
    component: () => import('../views/createur/Evenement.vue')
  },
  {
    path: '/profil',
    component: () => import('../views/createur/Profil.vue')
  },
  {
    path: '/invitation',
    component: () => import('../views/createur/Invitation.vue')
  },
  {
    path: '/evenementPublic',
    component: () => import('../views/createur/EvenementPublic.vue')
  },
  {
    path: '/participant',
    component: () => import('../views/createur/Participant.vue')
  },
  {
    path: '/successcc',
    component: () => import('../views/Animations/SuccessCompteCree.vue')
  },
  {
    path: '/errorcc',
    component: () => import('../views/Animations/ErrorCompteCree.vue')
  },
  {
    path: '/successmp',
    component: () => import('../views/Animations/SuccessModifieProfil.vue')
  },
  {
    path: '/errormp',
    component: () => import('../views/Animations/ErrorModifierProfil.vue')
  },
  {
    path: '/successev',
    component: () => import('../views/Animations/SuccessEvCreer.vue')
  },
  {
    path: '/errorev',
    component: () => import('../views/Animations/ErrorEvCreer.vue')
  },
  {
    path: '/gestionEvenement',
    name: 'gestionEvenement',
    component: () => import( '../views/gestionnaire/GestionEvenement.vue')
  },
  {
    path: '/gestionCompte',
    name: 'gestionCompte',
    component: () => import( '../views/gestionnaire/GestionCompte.vue')
  },
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
