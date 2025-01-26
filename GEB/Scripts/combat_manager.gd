extends Node


@export var bubble1: bubble
@export var bubble2: bubble
@export var popup: ColorRect
# Called when the node enters the scene tree for the first time.

func update():
	if (bubble1.health <= 0 || bubble2.health <= 0):
		bubble1.set_physics_process(false)
		bubble2.set_physics_process(false)
		if (bubble1.health > bubble2.health):
			popup.game_over(bubble1)
		else:
			popup.game_over(bubble2)
func _ready() -> void:
	#make all relavent bubbles
	for b in BubbleManager.bubbles.size():
		makeBubble(BubbleManager.bubbles[b]);

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
#call this function when the win condition is met
func endGame():
	pass
		

#called in _ready(). Makes a singular bubble
func makeBubble(bubbleX: bubble) -> RigidBody2D:
	#make a bubbleRB for every bubble listed in the bubble manager
	var bubbleA = RigidBody2D.new();
	bubbleA.transform.origin = Vector2(0, 0); #transform adjust
	bubbleA.set_script("bubble.gd") #attach bubble script
	var collider = CollisionShape2D.new(); #give the bubble a collider
	collider.shape = CircleShape2D.new(); #bubbles are round 
	bubbleA.add_child(collider);
	var sprite = Sprite2D.new(); #adjust the sprite on the bubble
	sprite.texture = "none";
	#sprite.texture = load("res"//Images//".png");
	
	return bubbleA;
