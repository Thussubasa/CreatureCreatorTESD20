angular.module("creatureCreator").config(function ($routeProvider) {
	$routeProvider.when("/race", {
		templateUrl: "view/race.html"
	});

	$routeProvider.when("/skill", {
		templateUrl: "view/skill.html"
	});

$routeProvider.otherwise({redirectTo: "/"});
});