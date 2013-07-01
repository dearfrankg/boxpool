
angular.module('pageService', ['ngResource'])
  .factory 'Page', [
    '$resource', 'MONGOLAB_APIKEY'
    ($resource, MONGOLAB_APIKEY) ->

      # Page Model

      mongolabUrl = 'https://api.mongolab.com/api/1/databases/dmo/collections/pages/:id'
      apiKey = MONGOLAB_APIKEY

      Page = $resource( 
        mongolabUrl
        { apiKey: apiKey }
        {
          update: { method: 'PUT' }
          destroy: { method: 'DELETE' }
        }
      )

      Page.prototype.update = (successCallback, errorCallback) ->
        # arguments for non-GET actions (update uses PUT action)
        # routeParams, post-data, successCallback, errorCallback
        Page.update(
          {id: this._id.$oid}
          angular.extend({}, this, {_id:undefined})
          successCallback
          errorCallback
        )


      Page.prototype.destroy = (successCallback, errorCallback) ->
        # arguments for GET actions
        # routeParams, success-cb, error-cb
        Page.remove(
          {id: this._id.$oid}
          successCallback
          errorCallback
        )



      return Page

  ]

