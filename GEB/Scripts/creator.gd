extends Sprite2D
#gets a reference to all the bowl sprites
var waterBowl;
var paintBowl;
var soapBowl;
var xenonBowl;
var oxygenBowl;
var heliumBowl;
var tadpoleBowl;
var glitterBowl;
var knifeBowl;
var bowlImages;

var spd = 5;
var hp = 5;
var atk = 4;

#display for if an element is added of a category already filled
var popUp;

func _ready() -> void:
	waterBowl = get_node("waterBowl")
	paintBowl = get_node("paintBowl");
	soapBowl = get_node("soapBowl");
	xenonBowl = get_node("xenonBowl");
	oxygenBowl = get_node("oxygenBowl");
	heliumBowl = get_node("heliumBowl");
	glitterBowl = get_node("glitterBowl");
	knifeBowl = get_node("knifeBowl");
	tadpoleBowl = get_node("tadpoleBowl");
	bowlImages = [waterBowl, paintBowl, soapBowl, xenonBowl, oxygenBowl, heliumBowl, glitterBowl, knifeBowl, tadpoleBowl];
	popUp = get_node("AlreadyAdded");
	
func _on_area_2d_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	#determines what to update in manager based on held object
	#I apologize for the if statements this is gonna be messy
	if BubbleManager.currentObject == "xenon" && !BubbleManager.gasAdded:
		BubbleManager.gasAdded = true;
		spd = spd + 1
		hp = hp - 1;
		#BubbleManager.newBubble.hp -= 1;
		BubbleManager.sprites[4] = 1;
		xenonBowl.visible = true;
	
	if BubbleManager.currentObject == "oxygen" && !BubbleManager.gasAdded:
		BubbleManager.gasAdded = true;
		spd = spd + 2;
		hp = hp - 2;
		#BubbleManager.newBubble.hp -= 2;
		BubbleManager.sprites[5] = 1;
		oxygenBowl.visible = true;
	
	if BubbleManager.currentObject == "helium" && !BubbleManager.gasAdded:
		BubbleManager.gasAdded = true;
		spd = spd + 3;
		hp = hp - 3;
		#BubbleManager.newBubble.hp -= 3;
		BubbleManager.sprites[6] = 1;
		heliumBowl.visible = true;
	
	if BubbleManager.currentObject == "water" && !BubbleManager.liquidAdded:
		BubbleManager.liquidAdded = true;
		hp = hp + 1;
		atk = atk - 2;
		#BubbleManager.newBubble.hp += 1;
		#BubbleManager.newBubble.Spd_mult -= 2;
		BubbleManager.sprites[0] = 0;
		BubbleManager.sprites[1] = 1;
		waterBowl.visible = true;
	
	if BubbleManager.currentObject == "paint" && !BubbleManager.liquidAdded:
		BubbleManager.liquidAdded = true;
		hp = hp + 3;
		atk = atk - 3;
		#BubbleManager.newBubble.hp += 3;
		#BubbleManager.newBubble.Spd_mult -= 3;
		BubbleManager.sprites[0] = 0;
		BubbleManager.sprites[2] = 1;
		paintBowl.visible = true;
	
	if BubbleManager.currentObject == "soap" && !BubbleManager.liquidAdded:
		BubbleManager.liquidAdded = true;
		hp = hp + 5;
		atk = atk - 1;
		#BubbleManager.newBubble.hp += 5;
		#BubbleManager.newBubble.Spd_mult -= 4;
		BubbleManager.sprites[0] = 0;
		BubbleManager.sprites[3] = 1;
		soapBowl.visible = true;
	
	if BubbleManager.currentObject == "tadpoles" && !BubbleManager.otherAdded:
		BubbleManager.otherAdded = true;
		#BubbleManager.newBubble.atk += 1;
		atk = atk + 1;
		spd =  spd - 1;
		BubbleManager.sprites[7] = 1;
		tadpoleBowl.visible = true;
	
	if BubbleManager.currentObject == "glitter" && !BubbleManager.otherAdded:
		BubbleManager.otherAdded = true;
		#BubbleManager.newBubble.atk += 2;
		atk = atk + 2;
		spd = spd - 2;
		BubbleManager.sprites[8] = 1;
		glitterBowl.visible = true;
	
	if BubbleManager.currentObject == "knife" && !BubbleManager.otherAdded:
		BubbleManager.otherAdded = true;
		#BubbleManager.newBubble.atk += 3;
		atk = atk + 3;
		spd = spd - 3;
		BubbleManager.sprites[9] = 1;
		knifeBowl.visible = true;
	
	BubbleManager.newBubble.atk = atk;
	BubbleManager.newBubble.spd_mult = spd;
	BubbleManager.playerSpd = spd;
	BubbleManager.newBubble.hp = hp;

	#with how often the signal is sent, this is popping up regardless. will look at later
	#if BubbleManager.gasAdded && (BubbleManager.currentObject == "helium" || 
	#BubbleManager.currentObject == "oxygen" || BubbleManager.currentObject == "xenon"):
		#popUp.visible = true;
		
	#if BubbleManager.liquidAdded && (BubbleManager.currentObject == "water" || BubbleManager.currentObject == "soap"
	#|| BubbleManager.currentObject == "paint"):
		#popUp.visible = true;
		
	#if BubbleManager.otherAdded && (BubbleManager.currentObject == "knife" || BubbleManager.currentObject == "glitter"
	#|| BubbleManager.currentObject == "tadpoles"):
		#popUp.visible = true;
	

#resets all visible objects (does this regardless of reset or create being made)
func _on_button_pressed() -> void:
	for i in 9:
		bowlImages[i].visible = false;
	BubbleManager.otherAdded = false;
	BubbleManager.liquidAdded = false;
	BubbleManager.gasAdded = false;
	pass # Replace with function body.
