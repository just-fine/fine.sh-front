import service from './service'
import $style from './console.module.styl'

export default
  name: 'console-projects'

  data: ->
    projects: []

  render: (h) ->
    <div class={$style.content}>
      <div class="alert alert-info">project count: {@projects.length}, today: {@today}</div>
      <ul>{
        (<li class={$style.item}>
          <a href={"https://#{project.repo_name}.fine.sh"} target="_blank">{project.repo_name}</a>
          <span class={$style.date}>create_at {@date project.created_at}</span>
          <a on-click={@go_block.bind @, project.user_id}>see author</a>
        </li>) for project in @projects
      }</ul>
    </div>

  mounted: ->
    @projects = await do service.find_projects

  computed:
    today: ->
      return 0 if not @projects or @projects.length is 0
      now = +new Date new Date().setHours 0
      next = (p for p in @projects when p.create_at > now)
      return next.length

  methods:
    date: (date) ->
      new Date date
        .toLocaleString 'zh-CN', { hour12: false }

    go_block: (id) ->
      @$router.push
        name: 'console_block'
        params: { id }


