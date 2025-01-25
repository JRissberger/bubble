class_name bubble extends RigidBody2D

var atk = 1:
	get: 
		return atk
	set(value):
		atk = value
var hp = 5:
	get: 
		return hp
	set(value):
		hp = value
var spd_mult = 10:
	get: 
		return spd_mult
	set(value):
		spd_mult = value	


func _init(hp=5, spd_mult=10, atk=1):
	pass

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	apply_central_force(Vector2(randf_range(-1, 1), randf_range(-1, 1)) * spd_mult)

func _process(delta: float) -> void:
	apply_central_force(linear_velocity.normalized() * 0.01)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	var collis = move_and_collide(linear_velocity * delta)
	if collis:
		linear_velocity = linear_velocity.bounce(collis.get_normal())
