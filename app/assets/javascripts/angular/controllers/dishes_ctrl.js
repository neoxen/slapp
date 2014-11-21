app.controller('DishesCtrl', ['$scope', 'Dish', function($scope, Dish) { 
	$scope.dishes = Dish.today(); 
}]);