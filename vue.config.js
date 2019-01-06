const path = require('path')

module.exports = {
  chainWebpack: config => {
    config.resolve.alias
      .set('styles', path.join(__dirname, 'src/styles'))
  },
  baseUrl: process.env.NODE_ENV === 'production'
      ? 'https://cdn.jsdelivr.net/npm/@fine.sh/front/dist/'
      : '/'
}
