@CookiesController =
  extends: BaseController
  template: '#cookies_tmpl'
  store: @store
  methods:
    close: ->
      Cookies.set 'accepted_cookies', true, path: '/'
      store.commit 'setCookies', true
