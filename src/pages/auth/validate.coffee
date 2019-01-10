import service from './service'
import { apis } from '../../constants'

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
      <div class="alert alert-error">{@$t 'validate.not_found'}</div>

    main: (h) ->
      <div>
        <h2>{@$t 'validate.title1'}</h2> <br/>
        <div class="alert alert-info">{@$t 'validate.info1'}</div>
        <pre>
          <p>{@$t 'validate.info2'}</p>
          <p>{@$t 'validate.info3'}</p>
        <button class="btn btn-primary btn-ghost" on-click={@validate}>{@$t 'validate.btn1'}</button>
        </pre>
      </div>
  
  render: (h) ->
    <div>
      <repo-slogan/>
      {(@id and @main h) or @not_found h}
      <repo-summary/>
    </div>
    
  
