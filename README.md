# bubble


create genetically engineered bubbles (do bubbles have genes??? discuss) pit them against each other in an arena
	-various ingredients (soap, air, extra things (paint, SHARP ROCKS, filled with multitudes of tadpoles)
	-each ingredient adds (or removes) from base hp, speed, attack??
	-pit them against each other--toss them in an arena where they just bounce around
		-initial speed and direction
		-every change in direction (from hitting a wall or the other bubble) reduces health
		-last bubble alive wins and is stored for the next match

Individual parts
	1. art assets
		-bubble ingredients
		-bowl
		-ui
		-arena
		-bubbles (of various colors)
	
	2. bubble creation
		-drag ingredients into the bowl (click if this gets messy)
		-tally up what's there
		-click create, bubble generated with stats (health)
		-store bubble
		
	3. arena
		-have initial opponent bubble
		-click start, bubbles given initial direction and velocity (based on speed stat)
		-detract from hp every time direction is changed
		-winner bubble stored as new opponent
		-optional: attack stat from bubble causes bubble that's hit to have more hp drained when hit by bubble
