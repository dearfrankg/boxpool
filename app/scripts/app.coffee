'use strict'

angular.module('boxpoolApp', [
  'ngCookies', 'pageService', 'categoryService', 'productService', 'ui.bootstrap' ])

    .constant('MONGOLAB_APIKEY', "503f0450e4b04102cdfdc589")

    .constant('PASSWORD', "kristal")

    .config(['$routeProvider', ($routeProvider) ->
      $routeProvider

        # home

        .when '/',
          templateUrl: 'views/main.html'


        # login

        .when '/login',
          templateUrl: 'views/login.html'


        # products

        .when '/products',
          templateUrl: 'views/product_list_full.html'
          controller: 'ProductListCtrl'


        # edit pages
          
        .when '/pages/new',
          templateUrl: 'views/page_detail.html'
          controller: 'PageCreateCtrl'
        .when '/pages/:pageID',
          templateUrl: 'views/page_detail.html'
          controller: 'PageEditCtrl'
        .when '/pages',
          templateUrl: 'views/page_list.html'
          controller: 'PageListCtrl'
        

        # edit categories
          
        .when '/categories/new',
          templateUrl: 'views/category_detail.html'
          controller: 'CategoryCreateCtrl'
        .when '/categories/:categoryID',
          templateUrl: 'views/category_detail.html'
          controller: 'CategoryEditCtrl'
        .when '/categories',
          templateUrl: 'views/category_list.html'
          controller: 'CategoryListCtrl'
        

        # edit products
          
        .when '/products/new',
          templateUrl: 'views/product_detail.html'
          controller: 'ProductCreateCtrl'
        .when '/products/:productID',
          templateUrl: 'views/product_detail.html'
          controller: 'ProductEditCtrl'
        .when '/edit-products',
          templateUrl: 'views/product_list.html'
          controller: 'ProductListCtrl'



        .otherwise
          redirectTo: '/'


  ])
  .factory('categoryList', [ 
    'Category', '$q', '$filter', 
    (Category, $q, $filter) ->
      defer = $q.defer()
      Category.query (categoryList) ->
        defer.resolve $filter('orderBy')(categoryList, 'name')
      return defer.promise
  ])
























