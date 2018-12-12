myApp.controller("ordersByMonthChartCtrl", function($scope, $http) {
	
	var chartData = [];
	var chartScaleX = [];
	
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
	
	// get orders sum by date
	$scope.ordersDto = [];
	$scope.getSumByDate = function() {
		$http({
			method : 'GET',
			url : 'orders/sumByMonth'
		}).then(function(response) {
			$scope.ordersDto = response.data;
			
			$scope.ordersDto.forEach(function(orders) {
				chartData.push(orders.sumByDate);
				chartScaleX.push(orders.monthYear);
			});
		});
	};
	// call method to get all orders info
	$scope.getSumByDate();

	$scope.ordersByMonthJson = {
		type : 'line',

		title : {
			text : "",  //Drag the bottom right corner to resize
			fontSize : 16,
			fontColor : "#fff"
		},

		backgroundColor : "#2bbb9a",
		globals : {
			shadow : false,
			fontFamily : "Arial"
		},

		scaleX : {
			labels: chartScaleX,
			maxItems: 7,
			lineColor : "white",
			lineWidth: "2px",
			tick : {
				lineColor : "white",
				lineWidth: "1px"
			},
			item : {
				fontColor : "white"
			},
			guide : {
				visible : false
			}
		},

		scaleY : {
			lineColor : "white",
			tick : {
				lineColor : "white",
			},
			guide : {
				lineStyle : "solid",
				lineColor : "#249178"
			},
			item : {
				fontColor : "white"
			},
			
			format:"%v VNĐ",
			decimalsSeparator: ",", //To set the decimal mark type.
			thousandsSeparator: ",",
		},

		tooltip : {
			visible : false
		},
		
		plotarea: {
		    margin: 'dynamic'
		},

		crosshairX : {
			lineColor : "#fff",
			scaleLabel : {
				backgroundColor : "#fff",
				fontColor : "#323232"
			},
			plotLabel : {
				backgroundColor : "#fff",
				fontColor : "#323232",
				text : "%v",
				borderColor : "transparent"
			}
		},

		plot : {
			lineWidth: "2px",
			lineColor : "#FFF",
			aspect : "spline",
			marker : {
				visible : false
			},
			valueBox:{
                thousandsSeparator: ","
            }
		},

		series : [ {
			values : chartData
		} ]
	};
});
