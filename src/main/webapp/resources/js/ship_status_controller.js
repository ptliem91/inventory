myApp.controller("shipStatusCtrl", function($scope, $http) {

	// get All Ship Status
	$scope.shipStatuses = [];
	$scope.getAllShipStatus = function() {
		$http({
			method : 'GET',
			url : 'master/allShipStatus'
		}).then(function(response) {
			$scope.shipStatuses = response.data;
			
		}, function(error){
            console.log(error); //
        });
	};
	// call method to get all Ship Status
	$scope.getAllShipStatus();
	
	// getSelected Product
	$scope.clickedShipStatus = {};

	// Load more...
	$scope.limit = 10;	
    $scope.loadMore = function() {
      var increamented = $scope.limit + 10;
      $scope.limit = increamented > $scope.shipStatuses.length ? $scope.shipStatuses.length : increamented;
    };
    
    // Register shipStatus
	$scope.shipStatus = {
			'code' : '',
			'status' : ''
	};
    $scope.addNewShipStatus = function() {
    	
    	$http({
			method : 'POST',
			url : 'master/addShipStatus',
			data : angular.toJson($scope.shipStatus),
			headers : {
				'Content-Type' : 'application/json'
			}
		}).then(function(response) {
			$scope.os = 1;
			
			$scope.getAllShipStatus();
			$scope.shipStatus = {};
			
		}, function(reason) {
			$scope.oe = 0;
		});
    };
    
    // Edit shipStatus
    $scope.editShipStatus = function(shipStatus) {

    	$http({
    		method : 'GET',
			url : 'master/getShipStatusById/' + shipStatus.id
		}).then(function(response) {
			$scope.os = 1;
			
			$scope.shipStatus = response.data;
			
		}, function(reason) {
			$scope.oe = 0;
		});
    };
    
    // Update
    $scope.updateShipStatus = function(shipStatus) {

    	$http({
    		method : 'PUT',
			url : 'master/updateShipStatus',
			data : angular.toJson($scope.shipStatus)
			
		}).then(function(response) {
			$scope.os = 1;
			
			$scope.getAllShipStatus();
			$scope.shipStatus = {};
			
		}, function(reason) {
			$scope.oe = 0;
		});
    };
    
    // Delete
    $scope.deleteShipStatus = function(shipStatus) {

    	$http({
    		method : 'DELETE',
			url : 'master/deleteShipStatus/'  + shipStatus.id
			
		}).then(function(response) {
			$scope.os = 1;
			
			$scope.getAllShipStatus();
			
		}, function(reason) {
			$scope.oe = 0;
		});
    };

});