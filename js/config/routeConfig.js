angular.module("creatureCreator").config(function ($routeProvider) {
	$routeProvider.when("/race", {
		templateUrl: "view/race.html"
	});

//	$routeProvider.otherwise({redirectTo: "/race"});
});