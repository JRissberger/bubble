extends Node

@export var bubble1: bubble
@export var bubble2: bubble
@export var popup: ColorRect
#feels redundant but necessary for implementation
@export var label1 : Label;
@export var label2 : Label;
@export var parent : Node2D;

#prefab of the bubbles
var bubblePrefab = preload("res://Prefabs/bubblePrefab.tscn");

func update():
	if (bubble1.Hp <= 0 || bubble2.Hp <= 0):
		bubble1.set_physics_process(false)
		bubble2.set_physics_process(false)
		if (bubble1.Hp > bubble2.Hp):
			bubble1.winner = true;
			popup.game_over(bubble1);
		else:
			bubble2.winner = true;
			popup.game_over(bubble2);
			#make sure health stat is reflected accurately.
		bubble1.label.text = str("Health: ", bubble1.hp);
		bubble2.label.text = str("Health: ", bubble2.hp);

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#check if this is the first match
	if(BubbleManager.bubbles.size() <= 1): BubbleManager.createEnemyBubble();
	#make all relavent bubbles
	#update; neither approaches to dynamically create bubbles work, 
	#will simply adjust the stats of the two existing bubbles in the scene
	for b in BubbleManager.bubbles.size():
		#makeBubble(BubbleManager.bubbles[b-1]);
		if(BubbleManager.bubbles[b] == null):BubbleManager.createEnemyBubble();
		var currentBubble = BubbleManager.bubbles[b];
		
		#because of the issue with losing the winner reference 
		#upon switching screens, the first element is always null. 
		#this will ensure A enemy, but not the enemy we want
		if(currentBubble.playerCreated == true): 
			#print(bubble1.Hp);
			#bubble1 = currentBubble;
			bubble1.title = "New";
			bubble1.label = label1;
			bubble1.parent = parent;
			#print(bubble1.Hp);
			bubble1.Atk = currentBubble.Atk;
			bubble1.Hp = currentBubble.Hp;
			bubble1.Spd_mult = currentBubble.Spd_mult;
			bubble1.Radius = currentBubble.Radius;
			bubble1.playerCreated = currentBubble.playerCreated;
			bubble1.winner = currentBubble.winner;
			bubble1.label.text = str("Health: ", bubble1.hp);
			
			#replace this bubble with what is in the bubble manager
			BubbleManager.bubbles[b] = bubble1;
		else: 
			#print(bubble1.Hp);
			#bubble2 = currentBubble;
			bubble2.title = "Previous";
			bubble2.label = label2;
			bubble2.parent = parent;
			#print(bubble2.Hp);
			bubble2.Atk = currentBubble.Atk;
			bubble2.Hp = currentBubble.Hp;
			bubble2.Spd_mult = currentBubble.Spd_mult;
			bubble2.Radius = currentBubble.Radius;
			bubble2.playerCreated = currentBubble.playerCreated;
			bubble2.winner = currentBubble.winner;
			bubble2.label.text = str("Health: ", bubble2.hp);
			
			BubbleManager.bubbles[b] = bubble2;



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
#call this function when the win condition is met
func endGame():
	#clear the list of bubbles
	BubbleManager.clearBubbles();
	

#called in _ready(). Makes a singular bubble and adds it to the game tree
#func makeBubble(bubbleX: bubble):
	#make a bubbleRB for every bubble listed in the bubble manager
	#var bubbleA = RigidBody2D.new();
	#bubbleA.transform.origin = Vector2(0, 0); #transform adjust
	#bubbleA.set_script("bubble.gd") #attach bubble script
	#var collider = CollisionShape2D.new(); #give the bubble a collider
	#collider.shape = CircleShape2D.new(); #bubbles are round 
	#bubbleA.add_child(collider);
	#var sprite = Sprite2D.new(); #adjust the sprite on the bubble
	#sprite.texture = "res://icon.svg";
	#sprite.texture = load("res"//Images//".png");
	#return bubbleA;
	
	#make a new prefab of the bubble with the stats passed in
	#var bubbleA = bubblePrefab.instantiate();
	#bubbleA.set_script("res://Scripts/bubble.gd");
	#bubbleA.bubble.Hp = bubbleX.Hp;
	#bubbleA.bubble.Atk = bubbleX.Atk;
	#bubbleA.bubble.Spd_mult = bubbleX.Spd_mult;
	#make sure the titles are correct
	#if(bubbleX.playerCreated): bubbleA.title = "New";
	#else: bubbleA.title = "Previous";
	
	#make sure there is an accompanying label
	#bubbleA.label = Label.new();
	#bubbleA.label.text = "Health: " + bubbleA.HP;
	
	#hook up the parent to the right node
	#bubbleA.parent = get_parent();
	#add_child(bubbleA);
	
