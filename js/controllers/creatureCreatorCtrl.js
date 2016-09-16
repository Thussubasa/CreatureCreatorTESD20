angular.module("creatureCreator").controller("creatureCreatorCtrl", function ($scope, $http) {

	$scope.app = "Creature Creator";

	$scope.createNpc= function(npc) {
		$scope.npcs.push(angular.copy(npc));
		console.log($scope.npcs);
	};

	$scope.setRace = function(race){
		console.log(race);
	};

	$scope.flexible = function(atributo){
		if (atributo=="health") $scope.health.multiplicador = 1.1;
		if (atributo=="stamina") $scope.stamina.multiplicador = 1.1;
		if (atributo=="magicka") $scope.magicka.multiplicador= 1.1;
		console.log($scope.health.multiplicador);
	};

	$scope.setStamina = function(atributoinicial, atributolvl){
			$scope.npc.atributos.stamina.total = (atributoinicial * $scope.stamina.multiplicador) + atributolvl; 
			return $scope.npc.atributos.stamina.total;

	};


	$scope.setMagicka = function(atributoinicial, atributolvl){

			$scope.npc.atributos.magicka.total = (atributoinicial * $scope.magicka.multiplicador) + atributolvl;
			return $scope.npc.atributos.magicka.total;

	}; 


	$scope.setHealth = function(atributoinicial, atributolvl){
			$scope.npc.atributos.health.total = (atributoinicial * $scope.health.multiplicador) + atributolvl;
			return $scope.npc.atributos.health.total;

	}; 

	$scope.npcs = [{}];

	$scope.startpoints = 100;
	$scope.races = [
	{nome: "Breton", speed: 5},{nome: "Altmer", speed: 6},{nome: "Dummer", speed: 5},{nome: "Argonian", speed: 5},{nome: "Bosmer", speed: 6}, {nome: "Nord", speed: 5},
	{nome: "Redguard", speed: 5},{nome: "Khajiit", speed: 6},{nome: "Imperial", speed: 5 },{nome: "Orc", speed: 6}
	];

	$scope.intelligences = [
	{type: "Animalistic"},
	{type: "Primitive"},
	{type: "Intelligent"}
	];

	$scope.trainings = [
	{type: "Untrained"},
	{type: "Basic"},
	{type: "Trained"}
	];

	$scope.health= {inicial: 100, atual: 100, bonus: 100, multiplicador: 1};
	$scope.magicka= {inicial: 0, atual: 0, bonus: 0, multiplicador: 1};
	$scope.stamina= {inicial: 0, atual: 0, bonus: 0, multiplicador: 1};

	$scope.attributos=[{health: 0, magicka: 0, stamina: 0}];

});