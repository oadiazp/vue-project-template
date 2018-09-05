@NavbarController =
  extends: BaseController
  store: @store
  template: '#navbar_tmpl'
  computed:
    picture: ->
      store.getters.profilePicture