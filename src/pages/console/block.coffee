import service from './service'
import $style from './console.module.styl'

export default
  name: 'console-users'

  data: ->
    user: {}
    projects: []
    is_loading: off
    message: ''
    id: null

  render: (h) ->
    <div class={$style.content}>
      {(@id and @render_user h) or (<div class="alert alert-info">nothing</div>)}
      {(@id and @render_block h) or (<span></span>)}
      <h1>projects:</h1>
      {(@id and @projects.length isnt 0 and @render_projects h) or
        (<div class="alert alert-info">not found project</div>)
      }
    </div>

  mounted: ->
    @id = @$route.params.id
    return if not @id
    result = await service.find_user_by_id @id
    @user = result.user
    @projects = result.projects

  methods:
    render_user: (h) ->
      <div class="media">
        <div class="media-left">
          <div class="avatarholder">
            {@user.avatar_url and (<img class={$style.avatar} src={@user.avatar_url}/>)}
          </div>
        </div>
        <div class="media-body">
          <div class="media-heading">{@user.github_name} @{@user.name or 'none'}</div>
          <div class="media-content">
            location: {@user.location or 'none'}, carete_at: {@date @user.created_at}, <span>  email: {@user.email or 'none'}</span>
          </div>
        </div>
      </div>

    render_projects: (h) ->
      <ul>{
        (<li class={$style.item}>
          <a href={"https://#{project.repo_name}.fine.sh"} target="_blank">{project.repo_name}</a>
          <span class={$style.date}>create_at {@date project.created_at}</span>
        </li>) for project in @projects
      }</ul>

    render_block: (h) ->
      <div class={$style.blockBtn}>
        <div class="btn btn-error btn-ghost" on-click={@block_user}>
          {@is_loading and (<span class="loading"></span>)}
          {(@user.blocked and 'unblock') or 'block'} {@user.github_name}
        </div>
        {@message and (<div class="alert alert-info"> {@message} </div>)}
      </div>

    date: (date) ->
      new Date date
        .toLocaleString 'zh-CN', { hour12: false }

    block_user: () ->
      @is_loading = on
      result = await service.block_user_by_id @user.id
      @is_loading = off
      if result.$ok
        @message = 'blocked'
        do location.reload
      else
        @message = result.$status





