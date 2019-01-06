import service from './service'
import { apis } from '../../constants'
import './validate.scss'

export default
  name: 'validate'
  
  data: ->
    id: 0
  
  mounted: ->
    @id = @$route.query.command_id
    do @check_user

  methods:
    
    check_user: () ->
      @user = await do service.find_user
  
    validate: () ->
      url = "#{apis.GITHUB_AUTH}?"
      url = url += "#{key}=#{val}&" for key, val of apis.GITHUB_AUTH_PARAMS
      url = url.replace (new RegExp "(#{apis.GITHUB_AUTH_PARAMS.redirect_uri})"), "$1?command_id=#{@id}"
      window.location.href = url

    not_found: (h) ->
      <div>未找到页面</div>
      
    main: (h) ->
      <div class="validate-box">
        <p>此验证页面的有效期为 3 分钟</p>
        您正在验证一个由 @fine/cli(命令行工具) 发起的登录请求，如果您从没有发起过这样的请求，请不要点击下方的验证。
        
        <button class="btn" on-click={@validate}>验证登录</button>
      </div>
  
  render: (h) ->
    <div>
      {(@id and @main h) or @not_found h}
    </div>
    
  
