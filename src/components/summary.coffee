import './component.scss'

export default
  name: 'repo-summary'

  render: (h) ->
    <div class="summary">
      <a href="https://github.com/just-fine/fine.sh-cli" class="cell" target="_blank">在 github 上查看</a>
      <a href="https://fine.sh/" class="cell" target="_blank">主页</a>
    </div>
