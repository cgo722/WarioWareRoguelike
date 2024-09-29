extends Node

var savingResource : SavingResource
var start : bool
var completed : bool
var finished : bool
var threeD : bool
var twoD : bool
var death : bool
var restart : bool
var upgrades : bool

var score : int
var hiScore : int
var skipCost : int = 300

var playerSpeed3D : float = 1.0
var playerSpeed2D : float = 1.0
var otherSpeed3D : float = 1.0
var otherSpeed2D : float = 1.0
var roundLength : float = 1.0
var enemySize3D : float = 1.0
var enemySize2D : float = 1.0
var playerSize3D : float = 1.0
var playerSize2D : float = 1.0
var jumpStrength : float = 1.0

var playerHealth : int
var unitNumbers : int

# Called when the node enters the scene tree for the first time.
func _ready():
	completed = false
	threeD = false
	twoD = false
	death = false
	playerHealth = 3
	score = 0
	savingResource = SavingResource.loadData()

func _process(delta: float) -> void:
	roundLength = clampf(roundLength, 0.1, 45)
func _reset():
	playerSpeed3D = 1.0
	playerSpeed2D = 1.0
	otherSpeed3D = 1.0
	otherSpeed2D = 1.0
	roundLength = 1.0
	enemySize3D = 1.0
	enemySize2D = 1.0
	playerSize3D = 1.0
	playerSize2D = 1.0
	jumpStrength = 1.0
