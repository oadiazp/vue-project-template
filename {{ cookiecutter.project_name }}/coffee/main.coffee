$ ->
  routes = [
#    {
#      path: '/'
#      component: HomeController
#      name: 'home'
#    },
#    {
#      path: '/accounts/profile'
#      name: 'profile'
#      component: ProfileController
#      children: [
#        {
#          path: 'general-info'
#          name: 'general-info'
#          component: GeneralInfoController
#        },
#        {
#          path: 'address'
#          name: 'address'
#          component: AddressController
#        },
#        {
#          path: 'credentials'
#          name: 'credentials'
#          component: CredentialsController
#        },
#        {
#          path: 'procedures/:uuid/payment'
#          name: 'payment'
#          component: PaymentController
#        },
#      ]
#    }
  ]

  router = new VueRouter
    mode: 'history'
    routes: routes

    Vue.use VueI18n

  messages =
    en:
      message:
        hello: 'Hello world!'
    ja:
      message:
        hello: 'こんにちは、世界'

  i18n = new VueI18n
    locale: 'ja',
    messages: messages

  app = new Vue
    router: router
    store: @store
    i18n: i18n
    computed:
      cookies: ->
        Cookies.get 'accepted_cookies'
    components:
      navbar: NavbarController
      cookies: CookiesController

  app.$mount '.main-container'
