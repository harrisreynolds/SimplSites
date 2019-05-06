import http from 'superagent'

export default class UserService {
    constructor() {
        this.baseUrl = ''
    }

    dev() {
        return new Promise((resolve, reject) => {
            http.get(this.baseUrl + '/api/v1/users/dev')
                .end(function (error, response) {

                    if (error) {
                        console.log('error')
                        console.log(error)
                        reject(error)
                        return
                    }

                    if (response.status === 200) {
                        console.log('success')
                        console.log(response)
                        const user = JSON.parse(response.text);
                        resolve(user)
                    }
                    else {
                        reject(response.statusText)
                    }
                })
        })
    }
}