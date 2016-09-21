angular.module("creatureCreator").controller("raceCtrl", function ($scope, $http) {
	$scope.npc = {
		atributos: {
			magicka: {}, stamina:{}, health:{}
		}, race: {}, lvl:0, role:{}, resistances: {}
	}
	$scope.teste = 1;
	$scope.app = "Creature Creator";


	$scope.npcs = [{}];
	var modDodge= 5;
	var baseDR=0;
	var baseMagicResistance = 8;

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

	$scope.health= {inicial: 100, atual: 100, bonus: 100, multiplicador: 1, minValue: 15};
	$scope.magicka= {inicial: 0, atual: 0, bonus: 0, multiplicador: 1, minValue: 0};
	$scope.stamina= {inicial: 0, atual: 0, bonus: 0, multiplicador: 1, minValue: 0};


	$scope.atributos=[{health: 0, magicka: 0, stamina: 0}];

	$scope.$watch('npc.atributos.magicka.inicial', function() {
		$scope.setMagicka($scope.npc.atributos.magicka.inicial, 0);
		if ($scope.npc.race.nome == "Altmer"){
			if($scope.npc.atributos.magicka.inicial == 10 ) {
				$scope.startpoints = 110;
			}else{
				$scope.startpoints = 100;
			}
		}
	});
	$scope.$watch('npc.atributos.health.inicial', function() {
		$scope.setHealth($scope.npc.atributos.health.inicial, 0);
	});
	$scope.$watch('npc.atributos.stamina.inicial', function() {
		$scope.setStamina($scope.npc.atributos.stamina.inicial, 0);
		if ($scope.npc.race.nome == "Redguard"){
			if($scope.npc.atributos.stamina.inicial == 10 ) {
				$scope.startpoints = 110;
			}else{
				$scope.startpoints = 100;
			}
		}
	});
	$scope.$watch('npc.lvl', function(){
		if ($scope.npc.race.nome == "Altmer") altmerTraits();
		if ($scope.npc.race.nome == "Argonian") argonianTraits();
		if ($scope.npc.race.nome == "Redguard") redguardTraits();
		if ($scope.npc.race.nome == "Breton") bretonTraits();
		if ($scope.npc.race.nome == "Bosmer") bosmerTraits();
		if ($scope.npc.race.nome == "Imperial") imperialTraits();
		if ($scope.npc.race.nome == "Nord") nordTraits();
		if ($scope.npc.race.nome == "Dummer") dummerTraits();
		if ($scope.npc.race.nome == "Orc") orcTraits();
		if ($scope.npc.race.nome == "Khajiit") khajithTraits();
	});



	$scope.createNpc= function(npc) {
		$scope.npcs.push(angular.copy(npc));
		console.log($scope.npcs);
	};

	$scope.setRace = function(race){
		if (race.nome == "Altmer") altmerTraits();
		if (race.nome == "Redguard") redguardTraits();
		if (race.nome == "Breton") bretonTraits();
		if (race.nome == "Argonian") argonianTraits();
		if (race.nome == "Bosmer") bosmerTraits();
		if (race.nome == "Imperial") imperialTraits();
		if (race.nome == "Nord") nordTraits();
		if (race.nome == "Dummer") dummerTraits();
		if (race.nome == "Orc") orcTraits();
		if (race.nome == "Khajiit") khajithTraits();


		
	};

	function baseMinvalue(){
		$scope.stamina.minValue = 0;
		$scope.magicka.minValue =0;
		$scope.health.minValue = 15;

	};

	function setMinValueToStats(race){
		$scope.npc.atributos.stamina.inicial = $scope.stamina.minValue ;
		$scope.npc.atributos.magicka.inicial = $scope.magicka.minValue;
		$scope.npc.atributos.health.inicial = $scope.health.minValue;
	};

	function setBasicMagicResistance(magicResistance) {
		if (!!magicResistance) {
			$scope.npc.resistances.magicResistance = magicResistance
		}else{
			$scope.npc.resistances.magicResistance = baseMagicResistance;	
		}
	};

	function setPoisonResistance (lvl) {
		if (lvl = 1) {
			$scope.npc.resistances.poisonResistance = 5 + $scope.npc.lvl -1;
		}else{
			$scope.npc.resistances.poisonResistance = 5 + Math.floor($scope.npc.lvl/2);
		}
	};

	function setDiseaseResistance (lvl) {
		if (lvl = 1) {
			$scope.npc.resistances.diseaseResistance = 5 + $scope.npc.lvl -1;
		}else{
			$scope.npc.resistances.diseaseResistance = 5 + Math.floor($scope.npc.lvl/2);
		}
	};

	function setFireResistance (lvl) {
		if (lvl = 1) {
			$scope.npc.resistances.fireResistance = 5 + $scope.npc.lvl -1;
		}else{
			$scope.npc.resistances.fireResistance = 5 + Math.floor($scope.npc.lvl/2);
		}
	};

	function setFrostResistance (lvl) {
		if (lvl = 1) {
			$scope.npc.resistances.frostResistance = 5 + $scope.npc.lvl -1;
		}else{
			$scope.npc.resistances.frostResistance = 5 + Math.floor($scope.npc.lvl/2);
		}
	};


	function altmerTraits(){
		setBasicMagicResistance();
		$scope.magicka.multiplicador = 1.2;
		$scope.magicka.minValue = 10;
		setMinValueToStats($scope.npc.race.nome);
		setDiseaseResistance(2);
		// Adicionar Arcanist

	};


	function redguardTraits (){
		setBasicMagicResistance();
		$scope.stamina.multiplicador = 1.2;
		$scope.magicka.minValue = 0;
		$scope.stamina.minValue = 10;
		$scope.startpoints = 110;
		setMinValueToStats($scope.npc.race.nome);
		setDiseaseResistance(1);
		setPoisonResistance(1);
		//adicionar Born to Battle:
	};

	function bretonTraits(){
		setBasicMagicResistance(12);
		$scope.magicka.multiplicador = 1.1;
		baseMinvalue();
		setMinValueToStats($scope.npc.race.nome);


		//adicionar Mer Heritage
	};

	function argonianTraits(){
		setBasicMagicResistance();
		$scope.npc.resistances.diseaseResistance = 5 + $scope.npc.lvl -1;
		$scope.npc.resistances.poisonResistance = "Immunity";
		baseMinvalue();
		setMinValueToStats($scope.npc.race.nome);

	};

	function bosmerTraits(){
		setBasicMagicResistance();
		$scope.npc.resistances.diseaseResistance = 5 + $scope.npc.lvl -1;
		baseMinvalue();
		setMinValueToStats($scope.npc.race.nome);
		

		//Adcionar Natural Marksman
	};

	function dummerTraits(){
		if ($scope.npc.lvl < 15) {
			setFireResistance(1);	
		}
		baseMinvalue();
		setMinValueToStats();
		setBasicMagicResistance();
		//Adcionar Dunmer Fighting Style:
	};

	function imperialTraits(){
		setBasicMagicResistance();
		baseMinvalue();
		setMinValueToStats($scope.npc.race.nome);
		
		// Adcionar Voice of the Emperor e Might of the Empire
	};

	function nordTraits (){
		setBasicMagicResistance();
		setMinValueToStats($scope.npc.race.nome);
		if ($scope.npc.lvl < 15) {
			setFrostResistance(1);
		}
		// Adcionar Northern Warrior:
	};

	function orcTraits(){
		setBasicMagicResistance();
		$scope.health.multiplicador = 1.2;
		setMinValueToStats($scope.npc.race.nome);
		// Adcionar Brute Strength
	};

	function khajithTraits(){
		setBasicMagicResistance();
		baseMinvalue();
		setMinValueToStats($scope.npc.race.nome);
		
		// Adcionar Agility e Claws.
	};

	$scope.flexible = function(atributo){
		if (atributo=="health") $scope.health.multiplicador = 1.1;
		if (atributo=="stamina") $scope.stamina.multiplicador = 1.1;
		if (atributo=="magicka") $scope.magicka.multiplicador= 1.1;
	}

	$scope.setStamina = function(atributoinicial, atributolvl){
		if (!!atributoinicial && atributoinicial != 10) {
			$scope.npc.atributos.stamina.total = Math.floor(atributoinicial * $scope.stamina.multiplicador) + atributolvl;
		} else{
			$scope.npc.atributos.stamina.total  = $scope.stamina.minValue;
		}
		setSpeed($scope.npc);
	};


	$scope.setMagicka = function(atributoinicial, atributolvl){
		if (!!atributoinicial && atributoinicial != 10) {
			$scope.npc.atributos.magicka.total = Math.floor(atributoinicial * $scope.magicka.multiplicador) + atributolvl;
		} else{
			$scope.npc.atributos.magicka.total  = $scope.magicka.minValue;
		}

	}; 


	$scope.setHealth = function(atributoinicial, atributolvl){
		if (!!atributoinicial) {
			$scope.npc.atributos.health.total = Math.floor(atributoinicial * $scope.health.multiplicador) + atributolvl;
		} else{
			$scope.npc.atributos.health.total = $scope.health.minValue;
			console.log($scope.npc.atributos.health.total);

		}
		setDamageReduction($scope.npc);

	};

	function setSpeed(npc){
		var modStamina = Math.floor(npc.atributos.stamina.total / 50);
		console.log(modStamina);
		$scope.npc.speed = npc.race.basespeed + modStamina;
		setDodge($scope.npc);
	}; 

	function setDodge(npc){
		$scope.npc.dodge= npc.speed + modDodge;
	};

	function setDamageReduction(npc){
		var modHealth =  Math.floor(npc.atributos.health.total / 50);
		$scope.npc.damageReduction = baseDR + modHealth;
	};	


});