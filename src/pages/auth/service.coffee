import { axios } from '../../utils'
import { apis } from '../../constants/index'

export default
  create_session: (code) ->
    axios.post apis.SESSIONS, { code, type: 'github' }
    
  update_session_for_cli: (command_id) ->
    axios.patch "#{apis.SESSIONS}/command/#{command_id}"

  find_user: () ->
    axios.get apis.USER

