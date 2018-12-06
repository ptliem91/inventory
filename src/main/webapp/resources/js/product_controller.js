myApp.controller("productCtrl", function($scope, $http) {

	// get All Product
	$scope.products = [];
	$scope.getAllProduct = function() {
		$http({
			method : 'GET',
			url : 'products/allProduct'
		}).then(function(response) {
			
			$scope.products = response.data;
		}, function(error){
            console.log(error); //
        });
	};
	// call method to get all Products
	$scope.getAllProduct();
	
	// getSelected Product
	$scope.clickedProduct = {};

	// Load more...
	$scope.limit = 10;
    $scope.loadMore = function() {
      var increamented = $scope.limit + 10;
      $scope.limit = increamented > $scope.products.length ? $scope.products.length : increamented;
    };
    
    // Register product
	$scope.product = {
			'code' : '',
			'pname' : '',
			'price' : '',
			'priceSale' : '',
			'qty' : '',
			'buyDate' : '',
			'createDate' : '',
			'updateDate' : ''
	};
    $scope.addNewProduct = function() {
    	
    	$http({
			method : 'POST',
			url : 'products/addProduct',
			data : angular.toJson($scope.product),
			
			headers : {
				'Content-Type' : 'application/json'
			}
		}).then(function(response) {
			$scope.os = 1;
			
			$scope.getAllProduct();
			$scope.product = {};
			
		}, function(reason) {
			$scope.oe = 0;
		});
    };
    
    // Edit product
    $scope.editProduct = function(product) {

    	$http({
    		method : 'GET',
			url : 'products/getProductById/' + product.pid
		}).then(function(response) {
			$scope.os = 1;
			
			$scope.product = response.data;
			// Format date
			$scope.product.buyDate = new Date($scope.product.buyDate);
			
		}, function(reason) {
			$scope.oe = 0;
		});
    };
    
    // Update
    $scope.updateProduct = function(product) {

    	$http({
    		method : 'PUT',
			url : 'products/updateProduct',
			data : angular.toJson($scope.product)
			
		}).then(function(response) {
			$scope.os = 1;
			
			$scope.getAllProduct();
			$scope.product = {};
			
		}, function(reason) {
			$scope.oe = 0;
		});
    };
    
    // Delete
    $scope.deleteProduct = function(product) {

    	$http({
    		method : 'DELETE',
			url : 'products/deleteProduct/'  + product.pid
			
		}).then(function(response) {
			$scope.os = 1;
			
			$scope.getAllProduct();
			
		}, function(reason) {
			$scope.oe = 0;
		});
    };

});