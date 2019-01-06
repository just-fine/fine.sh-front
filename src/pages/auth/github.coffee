import service from './service'

export default
  name: 'github'
  
  data: ->
    user: null
    status: 'validating...'
  
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
      this.status = status_map[name] or '未知错误'
      
    # update cli token require authorized
    update_cli_token: () ->
      updated = await service.update_session_for_cli @command_id
      return @set_status updated.$status if updated.$has_error
      @status = '@fine/cli (命令行工具) 发起的登录已完成，请返回命令行继续操作。'

  render: (h) ->
    <div>
      { @status }
    </div>
