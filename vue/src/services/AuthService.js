import axios from 'axios';


const http = axios.create({
  baseURL: "http://54.165.31.227:9000"
})
export default {

  login(user) {
    return http.post('/login', user)
  },

  register(user) {
    return http.post('/register', user)
  }

}
