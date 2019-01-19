export default
  welcome:
    title1: '什么是 Fine'
    quote1: 'Fine 是帮助你在无服务器的环境下快速生成静态网站的工具，你可以用它为自己的项目快速生成文档而不用关心样式、部署、页面的问题。'
    quote2: '甚至你可以用 Fine 来生成自己的博客，Fine 为任何一个项目都提供了独特的域名。'
    quote3: '当然，最重要的是，Fine 是免费的。'

    title2: '怎么使用 Fine ?'
    required: 'Fine 依赖于 {nodejs}.'
    usage1: '首先你需要准备一个包含 markdown 文件 (.md) 的项目，fine 的工作是帮助你把 markdown 文件转化成静态网站并部署。'
    usage2: '在命令行中切换到你的项目目录下，输入以下命令：'
    usage3: '没有了？'
    usage4: '是的，很酷吧？ `npx` 是 npm 的一个子命令，它允许你临时使用一个包并在完成后自动清除。你可以用这条命令试试 fine 是如何帮你生成一个文档站点的。'
    usage5: '如果你需要使用 fine，建议安装 fine 到全局: '

    title3: '使用指南'
    guide1: '你可以立即在几秒内部署站点，当然也可以让 fine.sh/cli 在项目目录下生成一个配置文件，这样你就可以拥有一个特别的域名。'
    guide2: '举例来说，如果你配置的项目名称是 \'love\'，理所应当的，当你运行完成后就会得到一个 \'love.fine.sh\' 的域名。这是你专属的。'
    guide3: '当你修改了一些文档想要再次使用它时，不用担心，只需要输入:'
    guide4: '事就这样成了。'

    title4: '更多命令'
    command1: '登录'
    command2: '查看我的项目'
    command3: '我的信息'
    command4: '根据提示移除一个项目'
    command5: '提交一个 Bug 或问题'

    title5: '约定'
    rule1: '虽然你可以通过 fine.sh 免费发布文档站点，但仍旧要对其中内容负责。'
    rule2: 'fine.sh 只能发布非盈利性质的文档站点。'
    rule3: '如果你的独有站点中的内容不符合文档站点，或是包含违反法律、社会道德、引起他人强烈不适的内容，fine.sh 有权利在不告知的情况下屏蔽您的站点同时协助相关部门的调查取证工作。'

    issue1: '目前仍旧处于测试版本，我们会不断补充更多的功能，同时也尽可能的提高它的健壮性。'
    issue2: '你可以在 {here} 留下建议和反馈'

  github:
    title1: '正在校验您的信息'
    verify1: '我们正在向 github 校验您的信息，这可能需要一些时间。'

    forbidden: '鉴权失败'
    server_error: '系统出现了一些异常'
    bad_request: '验证信息已经过期'
    unknown: '未知错误'
    success: '登录成功'
    wait: '正在验证中...'
    cli_success: '@fine/cli (命令行工具) 发起的登录已完成，请返回命令行继续操作。'

  validate:
    title1: '登录验证'
    not_found: '未找到页面'
    info1: '您正在验证一个由 @fine/cli(命令行工具) 发起的登录请求，如果您从没有发起过这样的请求，请不要点击下方的验证。'
    info2: '点击按钮将会要求 github 授权，授权后将自动完成 @fine/cli 的登录过程。'
    info3: '此验证页面的有效期为 3 分钟'
    btn1: '验证登录'



