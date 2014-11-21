app.controller('OrdersCtrl', ['$scope', 'Order', function($scope, Order) { 
	$scope.orders = Order.all(); 

	$scope.deleteOrder = function(id, idx) { 
		Order.delete(id);
		$scope.orders.splice(idx, 1); 
	};

	$scope.createOrder = function(id) { 
  		$(this).addClass('disabled');
	    $('#myModal').modal('show'); 

	    // var attr = {};
	    var newOrder = Order.create(id);
	    $scope.orders.push(newOrder);


	    $(this).removeClass('disabled');
	    $('#myModal').modal('hide'); 
	};
}]);