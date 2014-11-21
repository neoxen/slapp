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
	Order.prototype.create = function(stId) { 
		return this.service.save({id: stId}); 
	};
	return new Order; 
}]);