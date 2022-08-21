import Vue from 'vue'
import VueRouter from 'vue-router'
 
Vue.use(VueRouter)
 
  const routes = [
  {
    path: '/',
    name: 'signup',
    component: () => import('../components/registration.vue')
  },
  {
    path: '/login',
    name: 'login',
    component: () => import('../components/login.vue')
  },
  {
    path: '/forgotpwd',
    name: 'forgotpwd',
    component: () => import('../components/forgotpwd.vue')
  },
  {
    path: '/list_user',
    name: 'list_user',
    component: () => import('../components/list_user.vue')
  },
]
 
const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})
 
export default router