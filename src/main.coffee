import vue from 'vue'
import app from './app'
import routers from './routers'
import component from './components'
import 'styles/shared/index.scss'

vue.config?.productionTip = false
component vue
new vue
  el: '#app'
  router: routers
  render: (h) -> h app
