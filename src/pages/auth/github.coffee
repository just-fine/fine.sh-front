import service from './service'

export default
  name: 'github'
  
  data: ->
    user: null
    default_status: @$t 'github.wait'
    status: @$t 'github.wait'

  computed:
    is_loading: -> @status is @default_status

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
      @status = @$t 'github.success'

    set_status: (name) ->
      status_map =
        bad_request: @$t 'github.bad_request'
        server_error: @$t 'github.server_error'
        forbidden: @$t 'github.forbidden'
      @status = status_map[name] or @$t 'github.unknown'
      
    # update cli token require authorized
    update_cli_token: () ->
      updated = await service.update_session_for_cli @command_id
      return @set_status updated.$status if updated.$has_error
      @status = @$t 'github.cli_success'

  render: (h) ->
    <div>
      <repo-slogan/>
      <div>
        <h2>{@$t 'github.title1'}</h2>
        <pre>
          {@$t 'github.verify1'}
        </pre>
        <div class=" alert alert-info">
          { @is_loading and (<span class="loading"></span>) }
          { @status }
        </div>
      </div>
      <repo-summary/>
    </div>
