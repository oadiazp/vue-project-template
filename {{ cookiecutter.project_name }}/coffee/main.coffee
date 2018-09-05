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

  app = new Vue
    router: router
    store: @store
    computed:
      cookies: ->
        Cookies.get 'accepted_cookies'
    components:
      navbar: NavbarController
      cookies: CookiesController

  app.$mount '.main-container'
