import service from './service'
import $style from './console.module.styl'

export default
  name: 'console-projects'

  data: ->
    projects: []

  render: (h) ->
    <ul>
      {
        (<li>
          <a href={"https://#{project.repo_name}.fine.sh"} target="_blank">{project.repo_name}</a>
          <span class={$style.date}>create_at {@date project.created_at}</span>
          <a href="">see author</a>
        </li>) for project in @projects
      }
    </ul>

  mounted: ->
    @projects = await do service.find_projects

  methods:
    date: (date) ->
      new Date date
        .toLocaleString 'zh-CN', { hour12: false }

