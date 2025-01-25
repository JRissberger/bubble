class_name bubble extends RigidBody2D

var atk = 1
var hp = 5
var radius = 15;
var spd_mult = 5;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	apply_central_force(Vector2(randf_range(-1, 1), randf_range(-1, 1)) * spd_mult)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
