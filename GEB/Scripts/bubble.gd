class_name bubble extends RigidBody2D

var atk:
	get: 
		return atk
	set(value):
		atk = value
var hp:
	get: 
		return hp
	set(value):
		hp = value
var spd_mult:
	get: 
		return spd_mult
	set(value):
		spd_mult = value	

var radius


func _init(hp=5, spd_mult=5, atk=1, radius=70):
	pass

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	apply_central_force(Vector2(randf_range(-1, 1), randf_range(-1, 1)) * spd_mult)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
