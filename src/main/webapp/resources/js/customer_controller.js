myApp.controller("customerCtrl", function($scope, $http) {

	// get All Customer
	$scope.customers = [];
	$scope.getAllCustomer = function() {
		$http({
			method : 'GET',
			url : 'customers/allCustomer'
		}).then(function(response) {
			
			$scope.customers = response.data;
		}, function(error){
            console.log(error); //
        });
	};
	// call method to get all Customers
	$scope.getAllCustomer();
	
	// get All City
	$scope.cities = [];
	$scope.getAllCity = function() {
		$http({
			method : 'GET',
			url : 'master/allCity'
		}).then(function(response) {
			$scope.cities = response.data;
		});
	};
	// call method to get all Customer
	$scope.getAllCity();
	
	// getSelected Customer
	$scope.clickedCustomer = {};

	// Load more...
	$scope.limit = 10;
    $scope.loadMore = function() {
      var increamented = $scope.limit + 10;
      $scope.limit = increamented > $scope.customers.length ? $scope.customers.length : increamented;
    };
    
    // Register customer
	$scope.customer = {
			'cname' : '',
			'phone' : '',
			'cityId' : ''
	};
    $scope.addNewCustomer = function() {
    	$http({
			method : 'POST',
			url : 'customers/addCustomer',
			data : angular.toJson($scope.customer),

		}).then(function(response) {
			$scope.os = 1;
			
			$scope.getAllCustomer();
			$scope.customer = {};
			
		}, function(reason) {
			$scope.oe = 0;
		});
    };
    
    // Edit customer
    $scope.editCustomer = function(customer) {

    	$http({
    		method : 'GET',
			url : 'customers/getCustomerById/' + customer.cid
		}).then(function(response) {
			$scope.os = 1;
			
			$scope.customer = response.data;
			
		}, function(reason) {
			$scope.oe = 0;
		});
    };
    
    // Update
    $scope.updateCustomer = function(customer) {

    	$http({
    		method : 'PUT',
			url : 'customers/updateCustomer',
			data : angular.toJson($scope.customer)
			
		}).then(function(response) {
			$scope.os = 1;
			
			$scope.getAllCustomer();
			$scope.customer = {};
			
		}, function(reason) {
			$scope.oe = 0;
		});
    };
    
    // Delete
    $scope.deleteCustomer = function(customer) {

    	$http({
    		method : 'DELETE',
			url : 'customers/deleteCustomer/'  + customer.cid
			
		}).then(function(response) {
			$scope.os = 1;
			
			$scope.getAllCustomer();
			
		}, function(reason) {
			$scope.oe = 0;
		});
    };

});