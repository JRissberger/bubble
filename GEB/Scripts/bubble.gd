class_name bubble extends RigidBody2D
@export var label: Label
@export var parent: Node2D
@export var title: String
var atk:int;
var health:int;
var hp:int;
var spd_mult:int;
var radius:int;
var playerCreated:bool; #bool
var winner:bool; #bool

var Atk:
	get: 
		return atk
	set(value):
		atk = value
var Hp:
	get: 
		return hp;
		#return health;
	set(value):
		hp = value
		health = value;
var Spd_mult:
	get: 
		return spd_mult
	set(value):
		spd_mult = value	
		
var Radius:
	get:
		return radius;
	set(value):
		radius = value;


func _init(hp:=5, spd_mult:=5, atk:=1, radius:=70):
#func _init(hp, spd_mult, atk, radius):
	self.health = hp
	self.hp = hp
	self.spd_mult = spd_mult
	self.atk = atk
	self.radius = radius
	self.playerCreated = false;
	self.winner = false;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	apply_central_force(Vector2(randf_range(-1, 1), randf_range(-1, 1)) * spd_mult)
	#label.text = str("Health: ", hp);
	#label.text = str(hp);

func hit(attack: int) -> void:
	self.hp -= attack

func _process(delta: float) -> void:
	apply_central_force(linear_velocity.normalized() * 0.02)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	var collis = move_and_collide(linear_velocity * delta)
	if collis:
		linear_velocity = linear_velocity.bounce(collis.get_normal())
		if collis.get_collider().has_method("hit"):
			collis.get_collider().hit(atk);
			label.text = str("Health: ", hp);
			#label.text = str(hp);
			parent.update();
