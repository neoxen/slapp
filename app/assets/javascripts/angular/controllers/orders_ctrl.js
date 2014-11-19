app.controller('OrdersCtrl', ['$scope', 'Order', function($scope, Order) { 
	$scope.orders = Order.all(); 

	$scope.deleteOrder = function(id, idx) { 
		Order.delete(id);
		$scope.orders.splice(idx, 1); 
	};
}]);