import service from './service'
import $style from './console.module.styl'

export default 
  name: 'console-slot'

  data: ->
    is_admin: false
    menus: [
      { name: 'projects', active: yes }
      { name: 'users' }
    ]

  render: (h) ->
    <div class={$style.console}>
      <div class="btn-group">
        {
          (<button class={'btn btn-success ' + (menu.active and 'btn-ghost active')} key={menu.name}
            on-click={@toggle.bind @, menu.name} >
            {menu.name}
          </button>) for menu in @menus
        }
      </div>
      <router-view></router-view>
    </div>


  mounted: ->
    result = await do service.check_admin
    return do @back if not result.$ok

  methods:
    back: ->
      @$router.push '/'

    toggle: (name) ->
      @$router.push
        name: "console_#{name}"
      @menus = @menus.map (menu) ->
        status = (menu.name is name and yes) or no
        Object.assign {}, menu, { active: status }



