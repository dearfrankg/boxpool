'use strict';

# Services 

angular.module('productServices', ['ngResource'])
.factory('Product', ($resource) ->
  return $resource( 'products/:productID.json', {}, {
    query: { method:'GET', params:{productID:'products'}, isArray:true }
  })
)
