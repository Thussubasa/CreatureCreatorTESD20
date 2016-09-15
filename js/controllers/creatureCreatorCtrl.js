angular.module("creatureCreator").controller("creatureCreatorCtrl", function ($scope, $http) {

	$scope.app = "Creature Creator";



	// $scope.npc = function(race, lvl, attributos, inteligecia, treino){
	// 	this.race = race;
	// 	this.attributos = attributos;
	// 	this.inteligecia = inteligecia;
	// 	this.treino = treino;
	// 	this.lvl = lvl;
	// };

	$scope.createNpc= function(npc) {
		$scope.npcs.push(angular.copy(npc));
	console.log($scope.npcs);
	};

	$scope.setRace = function(race){
		console.log(race);
	};

	$scope.flexible = function(atributo){
		if (atributo=="health") $scope.health.multiplicador = 1.1;
		console.log(atributo);
	};

	function isHealth(){

	};

	function isMagicka(){



	};

	function isStamina(){

	};

	// $scope.traitMulti = function(atributo){
	// 	if (Object.keys(atributo).find(){

	// 	})){}
	// 	atributo = atributo*$scope.

	// };
	$scope.npcs = [{}];

	$scope.startpoints = 100;
	$scope.races = [
	{nome: "Breton"},{nome: "Altmer"},{nome: "Dummer"},{nome: "Argonian"},{nome: "Bosmer"}, {nome: "Nord"},
	{nome: "Redguard"},{nome: "Khajiit"},{nome: "Imperial"},{nome: "Orc"}
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

	$scope.health= {inicial: 0, atual: 0, bonus: 0, multiplicador: 1};
	$scope.magicka= {inicial: 0, atual: 0, bonus: 0, multiplicador: 1};
	$scope.stamina= {inicial: 0, atual: 0, bonus: 0, multiplicador: 1};

	$scope.attributos=[{health: 0, magicka: 0, stamina: 0}];

});