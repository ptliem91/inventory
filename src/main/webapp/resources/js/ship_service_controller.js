myApp.controller("shipServiceCtrl", function($scope, $http) {

	// get All ShipService
	$scope.shipServices = [];
	$scope.getAllShipService = function() {
		$http({
			method : 'GET',
			url : 'master/allShipService'
		}).then(function(response) {
			$scope.shipServices = response.data;
			
		}, function(error){
            console.log(error); //
        });
	};
	// call method to get all Ship Service
	$scope.getAllShipService();
	
	// getSelected Product
	$scope.clickedShipService = {};

	// Load more...
	$scope.limit = 10;	
    $scope.loadMore = function() {
      var increamented = $scope.limit + 10;
      $scope.limit = increamented > $scope.shipServices.length ? $scope.shipServices.length : increamented;
    };
    
    // Form submit
    $scope.checkOnSubmit = function(event, shipService) {
        if ($scope.shipServiceForm.$invalid) {
            // Cancel submit
            event.preventDefault();
            return false;
        }
        if(shipService.id != null && shipService.id != ''){
        	$scope.updateShipService(shipService);
        }else{        	
        	$scope.addNewShipService();
        }
        
        return true;
    }
    
    // Register shipService
	$scope.shipService = {
			'code' : '',
			'name' : ''
	};
    $scope.addNewShipService = function() {
    	
    	$http({
			method : 'POST',
			url : 'master/addShipService',
			data : angular.toJson($scope.shipService),
			headers : {
				'Content-Type' : 'application/json'
			}
		}).then(function(response) {
			$scope.os = 1;
			
			$scope.getAllShipService();
			$scope.shipService = {};
			
		}, function(reason) {
			$scope.oe = 0;
		});
    };
    
    // Edit shipService
    $scope.editShipService = function(shipService) {

    	$http({
    		method : 'GET',
			url : 'master/getShipServiceById/' + shipService.id
		}).then(function(response) {
			$scope.os = 1;
			
			$scope.shipService = response.data;
			
		}, function(reason) {
			$scope.oe = 0;
		});
    };
    
    // Update
    $scope.updateShipService = function(shipService) {

    	$http({
    		method : 'PUT',
			url : 'master/updateShipService',
			data : angular.toJson($scope.shipService)
			
		}).then(function(response) {
			$scope.os = 1;
			
			$scope.getAllShipService();
			$scope.shipService = {};
			
		}, function(reason) {
			$scope.oe = 0;
		});
    };
    
    // Delete
    $scope.deleteShipService = function(shipService) {

    	$http({
    		method : 'DELETE',
			url : 'master/deleteShipService/'  + shipService.id
			
		}).then(function(response) {
			$scope.os = 1;
			
			$scope.getAllShipService();
			
		}, function(reason) {
			$scope.oe = 0;
		});
    };

});