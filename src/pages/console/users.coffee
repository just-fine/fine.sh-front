import service from './service'
import $style from './console.module.styl'

export default
  name: 'console-users'

  data: ->
    users: []

  render: (h) ->
    <ul>
    {
      (<li class={$style.item}>
        <a href={"https://github.com/#{user.github_name}"} target="_blank">{user.github_name}</a>
        <span class={$style.date}>location {user.location or 'none'}</span>
        <span class={$style.date}>carete_at {@date user.created_at}</span>
        <a on-click={@go_block.bind @, user.id}>{(user.blocked and 'unblock') or 'block'} user</a>
      </li>) for user in @users
    }
    </ul>

  mounted: ->
    @users = await do service.find_users

  methods:
    date: (date) ->
      new Date date
        .toLocaleString 'zh-CN', { hour12: false }

    go_block: (id) ->
      @$router.push
        name: 'console_block'
        params: { id }

