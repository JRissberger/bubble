extends Node

@export var bubble1: bubble
@export var bubble2: bubble
@export var popup: ColorRect
#feels redundant but necessary for implementation
@export var label1 : Label;
@export var label2 : Label;
@export var parent : Node2D;

#these hold all the node references to the possible sprites for bubbles
var bubble1Sprites;
var bubble2Sprites;
#storing max hp for transfer from player to enemy bubble
var bubbleMaxHp = 5;
var bubble1ActiveSprites
#prefab of the bubbles
var bubblePrefab = preload("res://Prefabs/bubblePrefab.tscn");
var timer = 0;

#sound effects
var sound_player := AudioStreamPlayer.new();


func update():
	if (bubble1.hp <= 0 || bubble2.hp <= 0):
		bubble1.set_physics_process(false)
		bubble2.set_physics_process(false)
		set_process(false);
		
		if (bubble1.hp > bubble2.hp):
			bubble1.winner = true;
			popup.game_over(bubble1);
			#updates stored stats for enemy bubble
			BubbleManager.enemyAtk = bubble1.atk;
			BubbleManager.enemyhp = bubbleMaxHp; #store MAX hp not current
			BubbleManager.enemySpd = bubble1.spd_mult;
			BubbleManager.enemyRadius = bubble1.Radius;
			BubbleManager.enemySprites = BubbleManager.playerSprites;
			
			var sound_effect = load("res://Audio/Pop 01b.mp3");
			sound_player.stream = sound_effect;
			sound_player.play();

		else:
			bubble2.winner = true;
			popup.game_over(bubble2);
			var sound_effect = load("res://Audio/Pop 01b.mp3");
			sound_player.stream = sound_effect;
			sound_player.play();

			#make sure health stat is reflected accurately.
		

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_child(sound_player);

	#check if this is the first match
	if(BubbleManager.bubbles.size() <= 1): BubbleManager.createEnemyBubble();
	#bubble1ActiveSprites = BubbleManager.bubbles[0].ActiveSprites;
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
			bubble1.title = "You";
			bubble1.label = label1;
			bubble1.parent = parent;
			#print(bubble1.Hp);
			bubble1.atk = currentBubble.atk;
			bubble1.hp = currentBubble.hp;
			bubble1.spd_mult = currentBubble.spd_mult;
			bubble1.Radius = currentBubble.Radius;
			bubble1.playerCreated = currentBubble.playerCreated;
			bubble1.winner = currentBubble.winner;
			bubble1.label.text = str("Health: ", bubble1.hp);
			bubble1.isPlayer = true;
			print(bubble1.isPlayer)
			bubbleMaxHp = currentBubble.hp; #records max hp at creation, used to create next round enemy if needed
			#replace this bubble with what is in the bubble manager
			BubbleManager.bubbles[b] = bubble1;
		else: 
			#print(bubble1.Hp);
			#bubble2 = currentBubble;
			bubble2.title = "Enemy bubble";
			bubble2.label = label2;
			bubble2.parent = parent;
			#print(bubble2.Hp);
			bubble2.atk = BubbleManager.enemyAtk;#currentBubble.Atk;
			bubble2.hp = BubbleManager.enemyhp; #currentBubble.Hp;
			bubble2.spd_mult = BubbleManager.enemySpd; #currentBubble.Spd_mult;
			bubble2.Radius = BubbleManager.enemyRadius; #currentBubble.Radius;
			bubble2.playerCreated = false; #currentBubble.playerCreated;
			#bubble2.ActiveSprites = BubbleManager.enemySprites;
			bubble2.winner = currentBubble.winner;
			bubble2.isPlayer = false;
			print("opponent", bubble2.isPlayer)
			bubble2.label.text = str("Health: ", bubble2.hp);
			BubbleManager.bubbles[b] = bubble2;
	
	#assigning visible sprites
	#gets references to all the sprites for bubble1 (player) and bubble2 (enemy)
	bubble1Sprites = [get_node("Bubble1/empty"), get_node("Bubble1/blue"), get_node("Bubble1/orange"), 
	get_node("Bubble1/green"), get_node("Bubble1/xenon"),
	get_node("Bubble1/oxygen"), get_node("Bubble1/helium"), get_node("Bubble1/tadpoles"), get_node("Bubble1/glitter"),
	get_node("Bubble1/knife")];
	bubble2Sprites = [get_node("Bubble2/empty"), get_node("Bubble2/blue"), get_node("Bubble2/orange"), 
	get_node("Bubble2/green"), get_node("Bubble2/xenon"),
	get_node("Bubble2/oxygen"), get_node("Bubble2/helium"), get_node("Bubble2/tadpoles"), get_node("Bubble2/glitter"),
	get_node("Bubble2/knife")];
	#for loop, if sprite array is 1, sets corresponding sprite in bubble1 array to visible
	for i in 10:
		if BubbleManager.playerSprites[i] == 1:
			bubble1Sprites[i].visible = true;
	for i in 10: 
		if BubbleManager.enemySprites[i] == 1:
			bubble2Sprites[i].visible = true;



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (timer > 0 && timer < 0.5):
		timer += delta;
	elif (timer > 0.5):
		timer = 0;
	elif (timer == 0):
		if (bubble1.collis != null && bubble1.collis.get_collider().has_method("hit")):
			bubble1.hit(bubble2.atk);
			bubble2.hit(bubble1.atk);
			
			bubble1.label.text = str("Health: ", bubble1.hp);
			bubble2.label.text = str("Health: ", bubble2.hp);
			#play sound effect
			var sound_effect = load("res://Audio/Bump 01a.mp3");
			sound_player.stream = sound_effect;
			sound_player.play();
		elif (bubble2.collis != null && bubble2.collis.get_collider().has_method("hit")):
			bubble1.hit(bubble2.atk);
			bubble2.hit(bubble1.atk);
			
			bubble1.label.text = str("Health: ", bubble1.hp);
			bubble2.label.text = str("Health: ", bubble2.hp);
			#play sound effect
			var sound_effect = load("res://Audio/Bump 01a.mp3");
			sound_player.stream = sound_effect;
			sound_player.play();
		update();
		
	
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
	
