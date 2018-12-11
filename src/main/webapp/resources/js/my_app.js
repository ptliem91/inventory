var myApp = angular.module("myApp", ['ngBootbox', 'zingchart-angularjs']);

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

					// order logic control
					$scope.qty = 0;
					$scope.total = 0;
					$scope.priceSaleProd = 0;
					
					// Cal total
					$scope.setPriceSale = function() {
						$scope.priceSaleProd = $scope.clickedProduct.priceSale;
//						$scope.calTotal();
					};
					
//					$scope.calTotal = function() {
//						if($scope.qty > $scope.clickedProduct.qty){
//							$ngBootbox.alert('Stock of this product ( ' + $scope.clickedProduct.pname + ' ) is not enough!')
//							.then(function() {
//								$scope.total = 0;
//							});
//						}else{					
//							$scope.total = $scope.priceSaleProd * $scope.qty;
//						}
//					};

					// Add to cart
					$scope.cartProduct = [];
					$scope.finalTotal = 0;
					$scope.addToCart = function() {

						$scope.cp = {};
						$scope.cp = $scope.clickedProduct;
						
						$scope.cp.cartQty = $scope.qty;
						$scope.cp.subTotal = $scope.cp.cartQty * $scope.priceSaleProd;

						if ($scope.cartProduct.length === 0) {
							$scope.cartProduct.push($scope.cp);
							// Get price sale changed
							$scope.cartProduct[0].priceSale = $scope.priceSaleProd;
							
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
								// Get price sale changed
								$scope.cartProduct[i].priceSale = $scope.priceSaleProd;
								
								$scope.finalTotal += $scope.cp.subTotal;
							}
						}
					};

					// Remove from cart
					$scope.rCkickedProduct = {};
					$scope.removeProduct = function(product) {
						$scope.removableProduct = product;
						$scope.value = -1; // default index
						
						$scope.value = $scope.cartProduct.indexOf($scope.removableProduct);
						if ($scope.value >= 0) {
							$scope.cartProduct.splice($scope.value, 1);
							
							$scope.updateTotalCart($scope.qtyChangedProduct, true);
						}
					};

					// CheckOut
					$scope.checkOut = function() {
						$scope.orderDetails = {
							'odid' : '',
							'oid' : '',
							'pid' : '',
							'price' : '',
							'priceSale' : '',
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

						// Make order perform
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

						// Make order details perform
						for (var i = 0; i < $scope.cartProduct.length; i++) {
							$scope.orderDetails.oid = $scope.oid;
							$scope.orderDetails.pid = $scope.cartProduct[i].pid;
							$scope.orderDetails.price = $scope.cartProduct[i].price;
							$scope.orderDetails.priceSale = $scope.cartProduct[i].priceSale;
							$scope.orderDetails.qty = $scope.cartProduct[i].cartQty;
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
								'code' : '',
								'pname' : '',
								'price' : '',
								'priceSale' : '',
								'qty' : '',
								'buyDate' : ''
							};

							// alert($scope.productsAgain.length);
							for (var j = 0; j < $scope.productsAgain.length; j++) {
								if ($scope.productsAgain[j].pid === $scope.orderDetails.pid) {
									if ($scope.orderType === 'sell') {
										$scope.changedQty = $scope.productsAgain[j].qty
												- $scope.orderDetails.qty;
									} else {
										$scope.changedQty = parseInt($scope.productsAgain[j].qty)
												+ parseInt($scope.orderDetails.qty);
									}
									
									$scope.updatedProduct.pid = $scope.productsAgain[j].pid;
									$scope.updatedProduct.code = $scope.productsAgain[j].code;
									$scope.updatedProduct.pname = $scope.productsAgain[j].pname;
									$scope.updatedProduct.price = $scope.productsAgain[j].price;
									$scope.updatedProduct.priceSale = $scope.productsAgain[j].priceSale;
									$scope.updatedProduct.qty = $scope.changedQty;
									$scope.updatedProduct.buyDate = $scope.productsAgain[j].buyDate;
								}
							}

							$http({
								method : 'PUT',
								url : 'products/updateProduct',
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

					// Safty
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

					// Increase and Decrease cart product qty
					$scope.increaseQty = function(product) {
						$scope.qtyChangedProduct = product;
						$scope.qtyChangedProduct.cartQty = parseInt($scope.qtyChangedProduct.cartQty) + 1;
						
						$scope.updateTotalCart($scope.qtyChangedProduct, false);
					};

					$scope.decreaseQty = function(product) {
						$scope.qtyChangedProduct = product;
						$scope.qtyChangedProduct.cartQty = parseInt($scope.qtyChangedProduct.cartQty) - 1;
						if ($scope.qtyChangedProduct.cartQty < 1) {
							$scope.qtyChangedProduct.cartQty = 1;
						}
						
						$scope.updateTotalCart($scope.qtyChangedProduct, false);
					};
					
					// Function >> Update total for Cart
					$scope.updateTotalCart = function(changedProduct, isRemove) {
						if(!isRemove){
							for (var i = 0; i < $scope.cartProduct.length; i++) {
								if ($scope.cartProduct[i].pid === changedProduct.pid) {
									$scope.cartProduct[i].cartQty = changedProduct.cartQty;
									$scope.cartProduct[i].subTotal = $scope.cartProduct[i].priceSale * $scope.cartProduct[i].cartQty;
								}
							}
						}					

						$scope.finalTotal = 0;
						for (var i = 0; i < $scope.cartProduct.length; i++) {
							$scope.finalTotal = $scope.finalTotal + ($scope.cartProduct[i].priceSale * $scope.cartProduct[i].cartQty);
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
