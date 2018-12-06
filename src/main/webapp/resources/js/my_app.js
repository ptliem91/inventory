var myApp = angular.module("myApp", ['ngBootbox']);

myApp
		.controller(
				"appCtrl",
				function($scope, $http, $ngBootbox) {

					$scope.oid = "";
					$scope.orderType = "sell";
					$scope.orderDate = new Date();
					$scope.finalTotal = 0;
					$scope.shipStatus = "2"; // Đã gửi
					$scope.shipService = "1"; // GHTK

					// get All Product
					$scope.products = [];
					$scope.getAllProduct = function() {
						$http({
							method : 'GET',
							url : 'products/allProduct'
						}).then(function(response) {
							$scope.products = response.data;
						});
					};
					// call method to get all products
					$scope.getAllProduct();

					// getSelected Product
					$scope.clickedProduct = {};

					// get All Customer
					$scope.getAllCustomer = function() {
						$http({
							method : 'GET',
							url : 'customers/allCustomer'
						}).then(function(response) {
							$scope.customers = response.data;
						});
					};
					// call method to get all Customer
					$scope.getAllCustomer();

					// getSelected Customer
					$scope.clickedCustomer = {};
					
					// get All Ship Service
					$scope.shipServices = [];
					$scope.getAllShipService = function() {
						$http({
							method : 'GET',
							url : 'master/allShipService'
						}).then(function(response) {
							$scope.shipServices = response.data;
						});
					};
					// call method to get all Ship Service
					$scope.getAllShipService();
					
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

					// order logic control
					$scope.qty = 0;
					$scope.total = 0;

					// add to cart
					$scope.cartProduct = [];
					$scope.finalTotal = 0;
					$scope.addToCart = function() {

						$scope.cp = {};
						$scope.cp = $scope.clickedProduct;
						$scope.cp.cartQty = 1;
						$scope.cp.subTotal = $scope.cp.cartQty
								* $scope.cp.price;

						if ($scope.cartProduct.length === 0) {
							$scope.cartProduct.push($scope.cp);
							$scope.finalTotal += $scope.cp.subTotal;
							// alert("first insert");
						} else if ($scope.cartProduct.length > 0) {
							for (var i = 0; i < $scope.cartProduct.length; i++) {
								if ($scope.cartProduct[i].pid === $scope.cp.pid) {
									$ngBootbox.alert('Product ( ' + $scope.cartProduct[i].pname + ' ) already available in Cart!')
								    	.then(function() {
								    		console.log('Alert closed');
								    });
									break;
								}
							}
							if (i === $scope.cartProduct.length) {
								$scope.cartProduct.push($scope.cp);
								$scope.finalTotal += $scope.cp.subTotal;
							}
						}

					};

					// remove from cart
					$scope.rCkickedProduct = {};
					$scope.removeProduct = function(product) {
						$scope.removableProduct = product;
						$scope.value = -1;
						// alert($scope.cartProduct.indexOf($scope.rClickedProduct));
						$scope.value = $scope.cartProduct
								.indexOf($scope.removableProduct);
						if ($scope.value >= 0) {
							$scope.cartProduct.splice($scope.value, 1);
						}
					};

					// CheckOut
					$scope.checkOut = function() {
						$scope.orderDetails = {
							'odid' : '',
							'oid' : '',
							'pid' : '',
							'price' : '',
							'qty' : ''
						};
						$scope.order = {
							'oid' : '',
							'cid' : '',
							'total' : '',
							'orderType' : '',
							'orderDate' : '',
							'shipService' : '',
							'shipStatus' : ''
						};

						// make order perform
						$scope.order.cid = $scope.clickedCustomer.cid;
						$scope.order.total = $scope.finalTotal;
						$scope.order.orderType = $scope.orderType;
						$scope.order.orderDate = $scope.orderDate;
						$scope.order.shipService = $scope.shipService;
						$scope.order.shipStatus = $scope.shipStatus;

						$http({
							method : 'POST',
							url : 'orders/order',
							data : angular.toJson($scope.order),
							headers : {
								'Content-Type' : 'application/json'
							}
						}).then(function(response) {
							$scope.os = 1;
						}, function(reason) {
							$scope.oe = 0;
						});

						// make order details perform
						for (var i = 0; i < $scope.cartProduct.length; i++) {
							$scope.orderDetails.oid = $scope.oid;
							$scope.orderDetails.pid = $scope.cartProduct[i].pid;
							$scope.orderDetails.price = $scope.cartProduct[i].price;
							$scope.orderDetails.qty = $scope.cartProduct[i].cartQty;
							// alert("loop: " + (i + 1));
							$http({
								method : 'POST',
								url : 'orderdetails/orderdetail',
								data : angular.toJson($scope.orderDetails),
								headers : {
									'Content-Type' : 'application/json'
								}
							}).then(function(response) {
								$scope.ods = 1;
							}, function(reason) {
								$scope.ode = 0;
							});

							// make product update perform
							$scope.updatedProduct = {
								'pid' : '',
								'pname' : '',
								'price' : '',
								'qty' : ''
							};

							// alert($scope.productsAgain.length);
							for (var j = 0; j < $scope.productsAgain.length; j++) {
								// alert("enter to loop");
								if ($scope.productsAgain[j].pid === $scope.orderDetails.pid) {
									// alert("product stock: " +
									// $scope.productsAgain[i].qty);
									// alert("cart qty: " +
									// $scope.orderDetails.qty);
									if ($scope.orderType === 'sell') {
										$scope.changedQty = $scope.productsAgain[j].qty
												- $scope.orderDetails.qty;
									} else {
										$scope.changedQty = parseInt($scope.productsAgain[j].qty)
												+ parseInt($scope.orderDetails.qty);
									}
									// alert("changable qty: " +
									// $scope.changedQty);
									$scope.updatedProduct.pid = $scope.productsAgain[j].pid;
									$scope.updatedProduct.pname = $scope.productsAgain[j].pname;
									$scope.updatedProduct.price = $scope.productsAgain[j].price;
									$scope.updatedProduct.qty = $scope.changedQty;
								}
							}

							$http({
								method : 'PUT',
								url : 'products/product',
								data : angular.toJson($scope.updatedProduct),
								headers : {
									'Content-Type' : 'application/json'
								}
							}).then(function(response) {
								$scope.ps = 1;
							}, function(reason) {
								$scope.pe = 0;
							});

						}

					};

					// safty
					$scope.productsAgain = [];
					$scope.productAgainRequest = function() {
						$http({
							method : 'GET',
							url : 'products/allProduct'
						}).then(function(response) {
							$scope.productsAgain = response.data;
						});
					};
					$scope.productAgainRequest();

					// increase and decrease cart product qty
					$scope.increaseQty = function(product) {
						// alert("hi");
						$scope.qtyChangedProduct = product;
						$scope.qtyChangedProduct.cartQty = parseInt($scope.qtyChangedProduct.cartQty) + 1;
						for (var i = 0; i < $scope.cartProduct.length; i++) {
							if ($scope.cartProduct[i].pid === $scope.qtyChangedProduct.pid) {
								$scope.cartProduct[i].cartQty = $scope.qtyChangedProduct.cartQty;
							}
						}

						$scope.finalTotal = 0;
						for (var i = 0; i < $scope.cartProduct.length; i++) {
							$scope.finalTotal = $scope.finalTotal
									+ ($scope.cartProduct[i].price * $scope.cartProduct[i].cartQty);
						}
					};

					$scope.decreaseQty = function(product) {
						$scope.qtyChangedProduct = product;
						$scope.qtyChangedProduct.cartQty = parseInt($scope.qtyChangedProduct.cartQty) - 1;
						if ($scope.qtyChangedProduct.cartQty < 1) {
							$scope.qtyChangedProduct.cartQty = 1;
						}
						for (var i = 0; i < $scope.cartProduct.length; i++) {
							if ($scope.cartProduct[i].pid === $scope.qtyChangedProduct.pid) {
								$scope.cartProduct[i].cartQty = $scope.qtyChangedProduct.cartQty;
							}
						}

						$scope.finalTotal = 0;
						for (var i = 0; i < $scope.cartProduct.length; i++) {
							$scope.finalTotal = $scope.finalTotal
									+ ($scope.cartProduct[i].price * $scope.cartProduct[i].cartQty);
						}
					};

				});

myApp.controller("orderDetailsChartCtrl", function($scope, $http) {

	// get all orders info
	$scope.orders = [];
	$scope.getAllOrders = function() {
		$http({
			method : 'GET',
			url : 'orders/order'
		}).then(function(response) {
			$scope.orders = response.data;
		});
	};
	// call method to get all orders info
	$scope.getAllOrders();
	
	// get All Product
	$scope.products = [];
	$scope.getAllProduct = function() {
		$http({
			method : 'GET',
			url : 'products/allProduct'
		}).then(function(response) {
			$scope.products = response.data;
		});
	};
	// call method to get all products
	$scope.getAllProduct();
	
	// get All Ship Service
	$scope.shipServices = [];
	$scope.getAllShipService = function() {
		$http({
			method : 'GET',
			url : 'master/allShipService'
		}).then(function(response) {
			$scope.shipServices = response.data;
		});
	};
	// call method to get all Ship Service
	$scope.getAllShipService();
	
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
	
	// get All Customer
	$scope.customers = [];
	$scope.getAllCustomer = function() {
		$http({
			method : 'GET',
			url : 'customers/allCustomer'
		}).then(function(response) {
			$scope.customers = response.data;
		});
	};
	// call method to get all Customer
	$scope.getAllCustomer();

	// get order details info by order id
	$scope.clickedItem = {};
	$scope.findOd = function(order) {
		$scope.clickedItem = order;

		$http({
			method : 'GET',
			url : 'orderdetails/getOdDetailsByOID/' + $scope.clickedItem.oid
		}).then(function(response) {
			$scope.orderDetails = response.data;
		});

	};

	// Load more...
	$scope.limit = 10;	
    $scope.loadMore = function() {
      var increamented = $scope.limit + 10;
      $scope.limit = increamented > $scope.orders.length ? $scope.orders.length : increamented;
    };
    
    // 
    $scope.setSelectedOd = function(order) {
		$scope.clickedItem = order;
	};
    $scope.customDialogButtons = {
            main: {
                label: "Thất Bại!",
                className: "bg-danger",
                callback: function() {
                	$scope.updateShipStatusOd($scope.clickedItem, 5);
                }
            },
            danger: {
            	label: "Thành Công",
            	className: "bg-success",
            	callback: function() {
                	$scope.updateShipStatusOd($scope.clickedItem, 4);
            	}
            },
            success: {
                label: "Đã Gửi",
                className: "bg-warning",
                callback: function() {
                	$scope.updateShipStatusOd($scope.clickedItem, 3);
                }
            },
            warning: {
                label: "Chưa Gửi",
                className: "bg-info",
                callback: function() {
                	$scope.updateShipStatusOd($scope.clickedItem, 2);
                }
            }
    };
    
    $scope.updateShipStatusOd = function(order, status) {
    	var orderUpdate  = order;
    	orderUpdate.shipStatus = status;
    	
		$http({
			method : 'PUT',
			url : 'orders/updateOrder',
			data : angular.toJson(orderUpdate)
			
		}).then(function(response) {
			$scope.os = 1;
			
			$scope.getAllOrders();			
			
		}, function(reason) {
			$scope.oe = 0;
		});
	};

});
