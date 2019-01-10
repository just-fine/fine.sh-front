
export default
  name: 'app'

  render: (h) ->
    <div id="app" class="hack container">
      <router-view></router-view>
    </div>

  mounted: ->
    locale = @$route.query.locale

    @$i18n.locale = (locale is 'cn' and 'zh-CN') or 'en-US'
