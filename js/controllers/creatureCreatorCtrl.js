angular.module("creatureCreator").controller("creatureCreatorCtrl", function ($scope, $http) {

	
	$scope.app = "Creature Creator";

	$scope.npcs = [{name: "", level: "", race: "", role: "",intelligence: "", training: "", attributos: "", speed: "", dodge: "", damageReduction: "", diseaseResistance: ""}];
	var modDodge= 5;
	var baseDR=0;
	var baseMagicResistence = 8;

	$scope.startpoints = 100;
	
	$scope.races = [
	{nome: "Breton", type: "Humanoid", basespeed: 5},{nome: "Altmer", type: "Humanoid", basespeed: 6},
	{nome: "Dummer", type: "Humanoid", basespeed: 5},{nome: "Argonian", type: "Humanoid", basespeed: 5},
	{nome: "Bosmer", type: "Humanoid", basespeed: 6}, {nome: "Nord", type: "Humanoid", basespeed: 5},
	{nome: "Redguard", type: "Humanoid", basespeed: 5},{nome: "Khajiit", type: "Humanoid", basespeed: 6},
	{nome: "Imperial", type: "Humanoid" ,basespeed: 5 },{nome: "Orc", type: "Humanoid", basespeed: 6}
	];

	$scope.roles = [{nome: "Defender"}, {nome: "Brawler"}, {nome: "Flanker"},{nome: "Sniper"},{nome: "Sweeper"}, {nome: "Supporter"}];

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

	

	$scope.createNpc= function(npc) {
		$scope.npcs.push(angular.copy(npc));
		console.log($scope.npcs);
	};

	$scope.setRace = function(race){
		if (race.nome == "Altmer") $scope.altmerTraits();
		if (race.nome == "Redguard") $scope.redguardTraits();
		if (race.nome == "Breton") $scope.bretonTraits();
	};

	$scope.altmerTraits = function(npc){
		$scope.npc.magicResistence = baseMagicResistence;
		$scope.magicka.multiplicador = 1.2;
//		$scope.npc.diseaseResistance = 5 + Math.floor(npc.lvl/2);

};

$scope.redguardTraits = function(npc){
	$scope.npc.magicResistence = baseMagicResistence;
	$scope.stamina.multiplicador = 1.2;
	$scope.npc.atributos.stamina.inicial = 10;
};

$scope.bretonTraits = function(npc){
	$scope.npc.magicResistence = 12;
	$scope.magicka.multiplicador = 1.1;

}

$scope.imperialTraits = function(atributo){
	$scope.npc.magicResistence = baseMagicResistence;
	if (atributo=="health") $scope.health.multiplicador = 1.1;
	if (atributo=="stamina") $scope.stamina.multiplicador = 1.1;
	if (atributo=="magicka") $scope.magicka.multiplicador= 1.1;

		// Adcionar Voice of the Emperor e Might of the Empire
	};

	$scope.setStamina = function(atributoinicial, atributolvl){
		$scope.npc.atributos.stamina.total = Math.floor(atributoinicial * $scope.stamina.multiplicador) + atributolvl; 
		setSpeed($scope.npc);

	};


	$scope.setMagicka = function(atributoinicial, atributolvl){
		$scope.npc.atributos.magicka.total = Math.floor(atributoinicial * $scope.magicka.multiplicador) + atributolvl;
		Math.floor($scope.npc.atributos.magicka.total);

	}; 


	$scope.setHealth = function(atributoinicial, atributolvl){
		$scope.npc.atributos.health.total = Math.floor(atributoinicial * $scope.health.multiplicador) + atributolvl;
		setDamageReduction($scope.npc);

	};

	function setSpeed(npc){
		var modStamina = Math.floor(npc.atributos.stamina.total / 50);
		$scope.npc.speed = npc.race.basespeed + modStamina;
		setDodge($scope.npc);
	}; 

	function setDodge(npc){
		$scope.npc.dodge= npc.speed + modDodge;
	};
	
	function setDamageReduction(npc){
		var modHealth =  Math.floor(npc.atributos.health.total / 50);
		$scope.npc.damageReduction = baseDR + modHealth;
		console.log($scope.npc.damageReduction);
	};	


});