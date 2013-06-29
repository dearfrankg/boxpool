
angular.module('productService', ['ngResource'])
  .factory 'Product', [
    '$resource', 'MONGOLAB_APIKEY'
    ($resource, MONGOLAB_APIKEY) ->

      # Product Model

      mongolabUrl = 'https://api.mongolab.com/api/1/databases/dmo/collections/products/:id'
      apiKey = MONGOLAB_APIKEY

      Product = $resource( 
        mongolabUrl
        { apiKey: apiKey }
        {
          update: { method: 'PUT' }
          destroy: { method: 'DELETE' }
        }
      )

      Product.prototype.update = (successCallback, errorCallback) ->
        # arguments for non-GET actions (update uses PUT action)
        # routeParams, post-data, successCallback, errorCallback
        Product.update(
          {id: this._id.$oid}
          angular.extend({}, this, {_id:undefined})
          successCallback
          errorCallback
        )


      Product.prototype.destroy = (successCallback, errorCallback) ->
        # arguments for GET actions
        # routeParams, success-cb, error-cb
        Product.remove(
          {id: this._id.$oid}
          successCallback
          errorCallback
        )



      return Product

  ]

