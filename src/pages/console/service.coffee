import { axios } from '../../utils'
import { apis } from '../../constants/index'

export default
  check_admin: ->
    axios.get apis.ADMIN

  find_projects: ->
    axios.get apis.PROJECTS

  find_users: ->
    axios.get apis.ALL_USERS

  find_user_by_id: (id) ->
    axios.get "#{apis.USERS}/#{id}"

  block_user_by_id: (id) ->
    axios.put "#{apis.USERS}/#{id}/blocked"



