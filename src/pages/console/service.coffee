import { axios } from '../../utils'
import { apis } from '../../constants/index'

export default
  check_admin: ->
    axios.get apis.ADMIN

  find_projects: ->
    axios.get apis.PROJECTS



