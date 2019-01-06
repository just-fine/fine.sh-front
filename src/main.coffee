import vue from 'vue'
import app from './app'
import routers from './routers'
import component from './components'
import 'hack'

vue.config?.productionTip = false
component vue
new vue
  el: '#app'
  router: routers
  render: (h) -> h app
