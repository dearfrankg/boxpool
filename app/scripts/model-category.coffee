
angular.module('categoryService', ['ngResource'])
  .factory 'Category', [
    '$resource', 'MONGOLAB_APIKEY'
    ($resource, MONGOLAB_APIKEY) ->

      # Category Model

      mongolabUrl = 'https://api.mongolab.com/api/1/databases/dmo/collections/categories/:id'
      apiKey = MONGOLAB_APIKEY

      Category = $resource( 
        mongolabUrl
        { apiKey: apiKey }
        {
          update: { method: 'PUT' }
          destroy: { method: 'DELETE' }
        }
      )

      Category.prototype.update = (successCallback, errorCallback) ->
        # arguments for non-GET actions (update uses PUT action)
        # routeParams, post-data, successCallback, errorCallback
        Category.update(
          {id: this._id.$oid}
          angular.extend({}, this, {_id:undefined})
          successCallback
          errorCallback
        )


      Category.prototype.destroy = (successCallback, errorCallback) ->
        # arguments for GET actions
        # routeParams, success-cb, error-cb
        Category.remove(
          {id: this._id.$oid}
          successCallback
          errorCallback
        )



      return Category

  ]

