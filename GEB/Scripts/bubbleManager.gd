extends Node

var newBubble:bubble = bubble.new(5, 5, 1, 70);
var opponentBubble:bubble = bubble.new(5, 5, 1, 70);

#tracks the current held object
#this is here exclusively because I'm fighting for my life with signals and I don't have the time for that
#this approach would NOT get a good grade for coding standards my bad
var currentObject = "none";

#holds an array of what sprites need to be active when creating a bubble
#has options for none, and the 3 options for each category. 
var sprites = [1,0,0,0,0,0,0,0,0,0];

#sprites for the current player bubble
var playerSprites = [1,0,0,0,0,0,0,0,0,0];
#holding enemy stats since there's some issue with moving data around between class objects
var enemyhp = 5;
var enemySpd = 5;
var enemyAtk = 1;
var enemyRadius = 70;
var enemySprites = [1,0,0,0,0,0,0,0,0,0,];

#where all of the bubble objects will be stored
var bubbles:Array = [];

#tracks what's currently been added to the bubble
var gasAdded:bool = false;
var liquidAdded:bool = false;
var otherAdded:bool = false;

#RNG
var random = RandomNumberGenerator.new();
var statUpperLimit:int = 15;
var radiusUpperLimit:int = 90;

func _ready():
	
	pass # Replace with function body.

#call this when the "create" button is clicked. 
#since the creater already modifies the "new bubble", we have the new bubble already made
#add the new bubble and store it into the list of bubbles at hand; 
#reset the newBubble variable to a fresh bubble
func createBubble():
	#if(opponentBubble != null): 	BubbleManager.clearBubbles();
	newBubble.playerCreated = true;
	#newBubble.ActiveSprites = sprites;
	playerSprites = sprites;
	#store the bubble into the list of bubbles we have on hand
	bubbles.push_back(newBubble);
	#resets trackers of what's been added
	resetBubble();
	
#resets the newBubble object.
func resetBubble():
	#clear the bubble
	newBubble = bubble.new(5, 5, 1, 70);
	sprites = [1,0,0,0,0,0,0,0,0,0];
	gasAdded = false;
	liquidAdded = false;
	otherAdded = false;
	#garbage collector should be able to sweep up the "used" bubble later
	
#creates a bubble via rng and adds to the list of bubbles
func createEnemyBubble():
	var atk = enemyAtk#random.randi() % statUpperLimit - 10;
	var hp = enemyhp#random.randi() % statUpperLimit + 1;
	var spd_mult = enemySpd#random.randi() % statUpperLimit + 1;
	var radius = enemyRadius#random.randi() % radiusUpperLimit + 30;
	opponentBubble = bubble.new(hp, spd_mult, atk, radius);
	if(bubbles[0] == null): 
		bubbles[0] = opponentBubble;
	else: bubbles.push_back(opponentBubble);
	
#call this function when the match is over
func clearBubbles():
	#loop through all the bubbles to find the one marked as a winner
	#seems silly since currently it is just 1 v 1 bubble duels, 
	#however this is in consideration if we make it to battle royale implementation
	for b in bubbles.size():
		if(bubbles[b].winner == true):
			opponentBubble = bubbles[b];
	
	#reset the winning bubble. 
	#If the player made this bubble, it is no longer theirs
	opponentBubble.playerCreated = false;
	opponentBubble.winner = false;
	#clear the bubbles list
	bubbles = [];
	#add back the winning bubble
	bubbles.push_front(opponentBubble);
	#somehow when switching to creation scene, all elements 
	#in the bubbles array gets lost. it's not a scope issue
	
