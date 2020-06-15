globalvar item_info, item, enemy;

item = {
	none: {
		title: "------",
		desc: "Empty Slot",
		battle_text: "How did you use this!? Hacker..."
	},
	potion: {
		title: "Potion",
		desc: "Heals some HP! Finally, a sensible item.",
		battle_text: "Player recovered some HP!"
	},
	water_bottle: {
		title: "Water Bottle",
		desc: "Good ol' H2O",
		battle_text: "Gotta stay hydrated."
	},
	sandwich: {
		title: "Sandwich",
		desc: "Hungry?",
		battle_text: "Uh, guess this is as good a time as any for a snack?"
	},
	gun: {
		title: "Gun",
		desc: "What are you doing with this!?",
		battle_text: "...What the fuck?"
	},
	hand_sanitizer: {
		title: "Hand Sanitizer",
		desc: "Can never be too careful.",
		battle_text: "Your foe appreciates your cleanliness as we all navigate these uncertain times together.",
	}
}

enemy = {
	test: {
		title: "Test Enemy",
		moves: ["Attack 1", "Attack 2", "Attack 3", "Attack 4"],
		intro_lines: [
			" wants to rumble!",
			" has something to say.",
			" wants to punch you a little.",
			" wants to dance, but not like, romantically. They wanna dance violently, like with fists.",
			" has a gift for you!\n(it's a knuckle sandwich)",
			" would like to deplete your HP over a series of violent, yet ordered attacks.",
		],
		mid_battle_lines: [
			" is waiting for your move.",
			" is twiddling their thumbs.",
			" thought about something funny they heard on a podcast this morning.",
			" is trying really hard to look intimidating.",
			" is just vibing.",
			" looks kinda impatient.",
			" has to go to the DMV after this.",
			" is wondering what to have for dinner tonight."
		],
	},
	sudsy: {
		title: "Sudsy",
		moves: ["Bubble", "Car Wash", "Chemical Spray", "Terrible Scrubbing"],
		intro_lines: [
			" wants to clean you.",
			" thinks you need a bath.",
			" is here to clean!"
		],
		mid_battle_lines: [
			" is thinking about how disgusting you are.",
			" is daydreaming about how squeaky clean you're gonna be after she's done with you.",
			" really wishes you would just hold still." 
		],
		passive_lines: [
			" doesn't know if she wants to fight anymore.",
			" thinks that maybe, you might be clean enough already."
		],
		special_lines: [
			[item.hand_sanitizer,"Sudsy scoffs at your performative cleanliness. Sudsy clearly knows that only a proper and thorough wash with soap and water (and proper scrubbing times!) will properly disinfect you!"],
		]
	}
}