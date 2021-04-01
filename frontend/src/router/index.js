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
    path: '/participant/:id',
    component: () => import('../views/createur/Participant.vue')
  },
  {
    path: '/participanttous/:id',
    component: () => import('../views/createur/Participant.vue')
  },
  {
    path: '/participantaccepte/:id',
    component: () => import('../views/createur/ParticipantAccepte.vue')
  },
  {
    path: '/participantrefuse/:id',
    component: () => import('../views/createur/ParticipantRefuse.vue')
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
    path: '/successme',
    component: () => import('../views/Animations/SuccessModifierEv.vue')
  },
  {
    path: '/errorme',
    component: () => import('../views/Animations/ErrorModifierEv.vue')
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
    path: '/invitationevenement/:id',
    name: 'invitationevenement',
    component: () => import('../views/participant/Invitation.vue')
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
  },{
  path: '/acepteInvitation',
  component: () => import('../views/Animations/AccepterInvitation.vue')
  },
  {
  path: '/refuseInvitation',
  component: () => import('../views/Animations/RefuserInvitation.vue')
  },
  {
  path: '/acepteInvitationAuth',
  component: () => import('../views/Animations/AccepterInvitationAuth.vue')
  },
  {
  path: '/refuseInvitationAuth',
  component: () => import('../views/Animations/RefuserInvitationAuth.vue')
},
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})


export default router
