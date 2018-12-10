myApp.controller("masterCtrl", function($scope, $http) {

	// get All City
	$scope.cities = [];
	$scope.getAllCity = function() {
		$http({
			method : 'GET',
			url : 'master/allCity'
		}).then(function(response) {
			$scope.cities = response.data;
		}, function(error){
            console.log(error); //
        });
	};
	// call method to get all Customer
	$scope.getAllCity();
	
	// getSelected Product
	$scope.clickedCity = {};

	// Load more...
	$scope.limit = 10;	
    $scope.loadMore = function() {
      var increamented = $scope.limit + 10;
      $scope.limit = increamented > $scope.cities.length ? $scope.cities.length : increamented;
    };
    
    // Form submit
    $scope.checkOnSubmit = function(event, city) {
        if ($scope.addressForm.$invalid) {
            // Cancel submit
            event.preventDefault();
            return false;
        }
        if(city.id != null && city.id != ''){
        	$scope.updateCity(city);
        }else{        	
        	$scope.addNewCity();
        }
        
        return true;
    }
    
    // Register city
	$scope.city = {
			'code' : '',
			'name' : ''
	};
    $scope.addNewCity = function() {
    	
    	$http({
			method : 'POST',
			url : 'master/addCity',
			data : angular.toJson($scope.city),
			headers : {
				'Content-Type' : 'application/json'
			}
		}).then(function(response) {
			$scope.os = 1;
			
			$scope.getAllCity();
			$scope.city = {};
			
		}, function(reason) {
			$scope.oe = 0;
		});
    };
    
    // Edit city
    $scope.editCity = function(city) {

    	$http({
    		method : 'GET',
			url : 'master/getCityById/' + city.id
		}).then(function(response) {
			$scope.os = 1;
			
			$scope.city = response.data;
			
		}, function(reason) {
			$scope.oe = 0;
		});
    };
    
    // Update
    $scope.updateCity = function(city) {

    	$http({
    		method : 'PUT',
			url : 'master/updateCity',
			data : angular.toJson($scope.city)
			
		}).then(function(response) {
			$scope.os = 1;
			
			$scope.getAllCity();
			$scope.city = {};
			
		}, function(reason) {
			$scope.oe = 0;
		});
    };
    
    // Delete
    $scope.deleteCity = function(city) {

    	$http({
    		method : 'DELETE',
			url : 'master/deleteCity/'  + city.id
			
		}).then(function(response) {
			$scope.os = 1;
			
			$scope.getAllCity();
			
		}, function(reason) {
			$scope.oe = 0;
		});
    };

});