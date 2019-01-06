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
      <h2>什么是 fine</h2>
      <blockquote>
        fine 是帮助你在无服务器的环境下快速生成文档站点的工具，你可以用它为自己的项目快速生成文档而不用关心样式、部署、页面的问题。
      </blockquote>
      <blockquote>甚至你可以用 fine 来生成自己的博客，fine 为任何一个项目都提供了独特的域名。</blockquote>
      <blockquote>当然，最重要的是，fine 是免费的。</blockquote>
      <br/><br/>

      <h2>怎么使用 fine</h2>
      <div class="alert alert-info">
        首先你需要准备一个包含 markdown 文件 (.md) 的项目，fine 的工作是帮助你把 markdown 文件转化成站点并部署它们。
      </div>
      <p>切换到你的项目目录下，输入以下命令：</p>
      <pre><code>npx @fine.sh/cli</code></pre>
      <p>没有了？</p>
      <p>是的。<code>npx</code> 允许你临时使用一个包，完成会立刻清除。你可以用这条命令试试这个 fine 是如何帮你生成一个文档站点的。</p>
      <p><b>如果你需要使用 fine，建议安装 fine 到全局: </b></p>
      <pre><code>npm i @fine.sh/cli -g</code></pre>
      <br/><br/>

      <h2>使用指南</h2>
      <p>你可以选择快速部署模式在几秒内生成一个站点，当然也可以让 fine.sh/cli 在项目目录下生成一个配置文件，这样你就可以拥有一个特别的域名。</p>
      <p>举例来说，如果你配置的项目名称是 'love'，理所应当的，当你运行完成后就会得到一个 'love.fine.sh' 的域名。这是你专属的。</p>
      <p>当你修改了一些文档想要再次使用它时，不用担心，只需要输入:</p>
      <pre><code>fine</code></pre>
      <p>事就这样成了。</p>
      <br/><br/>

      <h2>更多命令</h2>
      <ul>
        <li><code>fine login</code>  ---   登录</li>
        <li><code>fine ls</code> ---   查看我的项目</li>
        <li><code>fine who</code>  ---   查看我的信息</li>
        <li><code>fine rm</code> ---   根据提示移除一个项目</li>
      </ul>
      <br/><br/>

      <h2>约定</h2>
      <p>虽然你可以通过 fine.sh 免费发布文档站点，但仍旧要对其中内容负责。</p>
      <ul>
        <li>fine.sh 只能发布非盈利性质的文档站点。</li>
        <li><b>如果你的独有站点中的内容不符合文档站点，或是包含违反法律、社会道德、引起他人强烈不适的内容，fine.sh 有权利在不告知的情况下屏蔽您的站点同时协助相关部门的调查取证工作。</b></li>
      </ul>
      <br/><br/>

      <div class="alert alert-success">
        <p>fine 目前仍旧处于测试版本，我们会不断补充更多的功能，同时也尽可能的提高它的健壮性。</p>
        <p>你可以在 <a href="https://github.com/WittBulter/fine.sh-cli/issues/new" target="_blank">这里</a> 留下建议和反馈。</p>
      </div>



      <br/><br/><br/><br/><br/><br/>
      <repo-summary/>
    </div>
