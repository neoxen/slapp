app.factory('Dish', ['$resource', function($resource) { 
	function Dish() { 
		this.service = $resource('/api/v1/dishes/:dishId', {dishId: '@id'}); 
	}; 
	Dish.prototype.today = function() { 
		return this.service.query(); 
	}; 
	Dish.prototype.find = function(stId) { 
		this.service.query({dishId: stId}); 
	};
	return new Dish; 
}]);