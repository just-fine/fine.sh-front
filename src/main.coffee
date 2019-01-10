import vue from 'vue'
import app from './app'
import routers from './routers'
import component from './components'
import vue_i18n from 'vue-i18n'
import locales from '../locales'
import 'hack'

component vue
vue.use vue_i18n
i18n = new vue_i18n
  locale: 'en-US'
  messages: locales

vue.config?.productionTip = false

new vue
  i18n: i18n
  el: '#app'
  router: routers
  render: (h) -> h app
