class_name bubble extends RigidBody2D
var atk
var health
var hp
var spd_mult
var radius

var Atk:
	get: 
		return atk
	set(value):
		atk = value
var Hp:
	get: 
		return hp
	set(value):
		hp = value
var Spd_mult:
	get: 
		return spd_mult
	set(value):
		spd_mult = value	


func _init(hp=5, spd_mult=5, atk=1, radius=70):
	self.health = hp
	self.hp = hp
	self.spd_mult = spd_mult
	self.atk = atk
	self.radius = radius

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	apply_central_force(Vector2(randf_range(-1, 1), randf_range(-1, 1)) * spd_mult)


func hit(attack: int) -> void:
	self.health -= attack

func _process(delta: float) -> void:
	apply_central_force(linear_velocity.normalized() * 0.02)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	var collis = move_and_collide(linear_velocity * delta)
	if collis:
		linear_velocity = linear_velocity.bounce(collis.get_normal())
		if collis.get_collider().has_method("hit"):
			collis.get_collider().hit(atk)
		if health <= 0:
			pass	#TODO: when health 0, ????
		
