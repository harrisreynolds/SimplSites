import ContentPane from './layout/ContentPane.vue'
import Home from './components/Home.vue'
import Account from './components/Account.vue'
import Analytics from './components/Analytics.vue'
import Components from './components/Components.vue'

const routes = [
    {
        path: '/',
        component: ContentPane,
        redirect: '/app/home'
    },
    {
        path: '/app',
        component: ContentPane,
        redirect: '/app/home',
        children: [
            {
                path: 'home',
                name: 'home',
                component: Home
            },
            {
                path: 'components',
                name: 'components',
                component: Components
            },
            {
                path: 'analytics',
                name: 'analytics',
                component: Analytics
            },
            {
                path: 'account',
                name: 'account',
                component: Account
            }
        ]
    }
]

export default routes