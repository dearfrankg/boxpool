'use strict';

# Services 

angular.module('productService', ['ngResource'])
.factory('Product', ($resource) ->
  return $resource( 'products/:productID.json', {}, {
    query: { method:'GET', params:{productID:'products'}, isArray:true }
  })
)
.factory('ProductCategory', ($resource) ->
  return $resource( 'products/:productID.json', {}, {
    query: { method:'GET', params:{productID:'categories'}, isArray:true }
  })
)
