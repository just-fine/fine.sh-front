import { apis } from '../constants'

export default
  name: 'welcome'

  data: ->
    count: 0
    
  methods:
    login: () ->
      url = "#{apis.GITHUB_AUTH}?"
      url = url += "#{key}=#{val}&" for key, val of apis.GITHUB_AUTH_PARAMS
      window.open url

  render: (h) ->
    <div>
      fine, a minimalist document generator.
      <button class="btn" on-click={@login}>login with github</button>
    </div>
