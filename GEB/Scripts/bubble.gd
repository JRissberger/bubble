class_name bubble extends RigidBody2D
@export var label: Label
@export var parent: Node2D
@export var title: String
var atk:int:
	get: 
		return atk
	set(value):
		atk = value
		if atk <= 0:
			atk = 1;
var health:int;
var hp:int:
	get: 
		return hp;
		#return health;
	set(value):
		hp = value
		health = value;
		if health <= 0:
			health = 1;
var spd_mult:int;
var radius:int;
var playerCreated:bool; #bool
var winner:bool; #bool
var isPlayer:bool;
var collis;
#sound effects
var sound_player := AudioStreamPlayer.new();

#var activeSprites: Array = [];
#array order is none, water, paint, soap, xenon, oxygen, helium, tadpoles, glitter, knife 
var Spd_mult:
	get: 
		return spd_mult
	set(value):
		spd_mult = value
		if spd_mult <= 0:
			spd_mult = 1;
		
var Radius:
	get:
		return radius;
	set(value):
		radius = value;

#note: this retrieves/sets the ENTIRE array
#var ActiveSprites:
	#get:
		#return activeSprites;
	#set(value):
		#activeSprites = value;


func _init(hp:=5, spd_mult:=15, atk:=1, radius:=70):
#func _init(hp, spd_mult, atk, radius):
	self.health = hp
	self.spd_mult = spd_mult
	#self.atk = atk
	self.radius = radius
	self.playerCreated = false;
	self.winner = false;
	self.isPlayer = false;
	#self.activeSprites = [1,0,0,0,0,0,0,0,0,0];

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_child(sound_player);
	apply_central_force(Vector2(randf_range(-1, 1), randf_range(-1, 1)) * spd_mult)
	print(BubbleManager.playerSpd)
	#label.text = str("Health: ", hp);
	#label.text = str(hp);

func hit(attack: int) -> void:
	self.hp -= attack
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	apply_central_force(linear_velocity.normalized() * 0.02)
	collis = move_and_collide(linear_velocity * delta)
	if collis:
		#play soundeffects
		var sound_effect = load("res://Audio/Bump 01c.mp3");
		sound_player.stream = sound_effect;
		sound_player.play();
		linear_velocity = linear_velocity.bounce(collis.get_normal())
