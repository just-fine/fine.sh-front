import axios from 'axios'

HOST = if process.env.NODE_ENV is 'development' then \
  'http://127.0.0.1:1337/api/v1' else 'https://api.fine.sh/api/v1'

instance = axios.create
  baseURL: HOST
  timeout: 20000,
  headers:
    'Content-Type': 'application/json'
  validateStatus: (status) -> 100 < status < 510

http_status =
  500: 'server_error'
  400: 'bad_request'
  403: 'forbidden'
  404: 'not_found'
  204: 'no_content'
  201: 'created'
  200: 'ok'

mixin_status_to_response = (obj, name, val = true) ->
  Object.defineProperty obj, "$#{name}", { get: () -> val }
  obj

###
  check http status in your code:
    data = await request params
    console.log res.$status    ->>>>>>   status name, like 'forbidden'
    console.log res.$forbidden ->>>>>>   boolean value
###
instance.interceptors.response.use (res) ->
  return res.data if res.status is 200
  return {} if res.status is 204
  status_name = http_status[res.status] || 'unkown_error'
  res.data ?= {}
  (typeof res.data) isnt 'object' and res.data = {}
  
  if res.status > 240 then \
    res.data = mixin_status_to_response res.data, 'has_error'
  res.data = mixin_status_to_response res.data, 'status', status_name
  mixin_status_to_response res.data, status_name

export default instance
