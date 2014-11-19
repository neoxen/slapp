app.factory('Order', ['$resource', function($resource) { 
	function Order() { 
		this.service = $resource('/api/v1/orders/:orderId', {orderId: '@id'}); 
	}; 
	Order.prototype.all = function() { 
		return this.service.query(); 
	}; 
	Order.prototype.delete = function(stId) { 
		this.service.remove({orderId: stId}); 
	};
	return new Order; 
}]);