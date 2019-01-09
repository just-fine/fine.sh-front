import service from './service'

DEFAULT_STATUS = '正在验证中...'
export default
  name: 'github'
  
  data: ->
    user: null
    status: DEFAULT_STATUS

  computed:
    is_loading: -> @status is DEFAULT_STATUS

  mounted: () ->
    { code, command_id } = @$route.query
    @command_id = command_id
    return if not code
    @createSession(code)
  
  methods:
    createSession: (code) ->
      user = await service.create_session(code)
      return @set_status user.$status if user.$has_error
      return do @update_cli_token if @command_id
      @status = '登录成功'

    set_status: (name) ->
      status_map =
        bad_request: '验证信息已经过期'
        server_error: '系统错误'
        forbidden: '鉴权失败'
      this.status = status_map[name] or '未知错误'
      
    # update cli token require authorized
    update_cli_token: () ->
      updated = await service.update_session_for_cli @command_id
      return @set_status updated.$status if updated.$has_error
      @status = '@fine/cli (命令行工具) 发起的登录已完成，请返回命令行继续操作。'

  render: (h) ->
    <div>
      <repo-slogan/>
      <div>
        <h2>正在校验您的信息</h2>
        <pre>
          我们正在向 github 校验您的信息，这可能需要一些时间。
        </pre>
        <div class=" alert alert-info">
          { @is_loading and (<span class="loading"></span>) }
          { @status }
        </div>
      </div>
      <repo-summary/>
    </div>
