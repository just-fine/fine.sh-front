const path = require('path')

module.exports = {
  devServer: {
      proxy: 'http://localhost:1337'
  },

  productionSourceMap: false,

  chainWebpack: config => {
    config.resolve.alias
      .set('styles', path.join(__dirname, 'src/styles'))
  },

  baseUrl: '/',
}
