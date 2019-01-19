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
      <repo-slogan/>
      <h2>{@$t 'welcome.title1'}</h2>
      <blockquote>{@$t 'welcome.quote1'}</blockquote>
      <blockquote>{@$t 'welcome.quote2'}</blockquote>
      <blockquote>{@$t 'welcome.quote3'}</blockquote>
      <br/><br/>

      <h2>{@$t 'welcome.title2'}</h2>
      <div class="alert alert-info" domPropsInnerHTML={@$t 'welcome.required', {nodejs: '<a href="https://nodejs.org/" target="_blank">NodeJS >8.0</a>'}}></div>
      <p>{@$t 'welcome.usage1'} {@$t 'welcome.usage2'}</p>
      <pre><code>npx @fine.sh/cli</code></pre>
      <p>{@$t 'welcome.usage3'}</p>
      <p>{@$t 'welcome.usage4'}</p>
      <p><b>{@$t 'welcome.usage5'}</b></p>
      <pre><code>npm i @fine.sh/cli -g</code></pre>
      <br/><br/>

      <h2>{@$t 'welcome.title3'}</h2>
      <p>{@$t 'welcome.guide1'}</p>
      <p>{@$t 'welcome.guide2'}</p>
      <p>{@$t 'welcome.guide3'}</p>
      <pre><code>fine</code></pre>
      <p>{@$t 'welcome.guide4'}</p>
      <br/><br/>

      <h2>{@$t 'welcome.title4'}</h2>
      <ul>
        <li><code>fine login</code>  ---   {@$t 'welcome.command1'}</li>
        <li><code>fine ls</code> ---   {@$t 'welcome.command2'}</li>
        <li><code>fine who</code>  ---   {@$t 'welcome.command3'}</li>
        <li><code>fine rm</code> ---   {@$t 'welcome.command4'}</li>
        <li><code>fine report</code> ---   {@$t 'welcome.command5'}</li>
      </ul>
      <br/><br/>

      <h2>{@$t 'welcome.title5'}</h2>
      <p>{@$t 'welcome.rule1'}</p>
      <ul>
        <li>{@$t 'welcome.rule2'}</li>
        <li><b>{@$t 'welcome.rule3'}</b></li>
      </ul>
      <br/><br/>

      <div class="alert alert-success">
        <p>{@$t 'welcome.issue1'}</p>
        <p domPropsInnerHTML={@$t 'welcome.issue2', {here: '<a href="https://github.com/just-fine/fine.sh-cli/issues/new" target="_blank">issue</a>'}}></p>
      </div>



      <br/><br/><br/><br/><br/><br/>
      <repo-summary/>
    </div>
