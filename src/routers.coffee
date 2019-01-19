import Vue from 'vue'
import Router from 'vue-router'
import { slot, github, welcome, validate, console_slot, console_projects } from './pages/index'
Vue.use Router

export default new Router
  mode: 'history'
  routes: [
    { path: '/', name: 'welcome', component: welcome }
    {
      path: '/auth', component: slot, children: [
        { path: 'github', name: 'github', component: github }
        { path: 'validate', name: 'validate', component: validate }
      ]
    }
    {
      path: '/console', component: console_slot, children: [
        { path: '', name: 'console_projects', component: console_projects }
      ]
    }
  
  ]
