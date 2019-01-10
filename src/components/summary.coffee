import './component.scss'

export default
  name: 'repo-summary'

  computed:
    is_cn: ->
      @$route.query.locale is 'cn'
    label: ->
      (@is_cn and 'English') or '中文 / Chinese'

  methods:
    replace: ->
      locale = (@is_cn and 'us') or 'cn'
      @$router.replace
        query: Object.assign {}, @$route.query, { locale }
      do location.reload

  render: (h) ->
    <div class="summary">
      <a href="javascript:;" on-click={@replace} class="cell" target="_blank">{@label}</a>
      <a href="https://github.com/just-fine/fine.sh-cli" class="cell" target="_blank">See on github</a>
      <a href="https://fine.sh/" class="cell" target="_blank">home page</a>
    </div>
