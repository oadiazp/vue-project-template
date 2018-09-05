class @GraphQLModel
  graphql: (query) ->
    new Promise (resolve, reject) ->
      $.ajax
        url: '/graphql/'
        type: 'post'
        data: query
        processData: false
        contentType: 'application/graphql'
        dataType: 'json'
        success: (response) ->
          resolve response
        error: (response) ->
          reject response
  update: (url, data) ->
    new Promise (resolve, reject) ->
      $.ajax
        url: url
        type: 'patch'
        data: data
        dataType: 'json'
        success: (response) ->
          resolve response
        error: (response) ->
          reject response



