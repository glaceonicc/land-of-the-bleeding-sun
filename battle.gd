extends Node2D

# BATTLE SCRIPT

var allyscene = load("res://ally.tscn")

func _ready() -> void:
	gl.STATE = "pick1"
	gl.allyID = 1
	
	if gl.allycount == 4:
		$ally4m.visible = true
		var ally4 = allyscene.instantiate()
		ally4.position = Vector2(505, 220)
		ally4.id = 4
		add_child(ally4)
		
		$ally4m/icon4.texture = load(gl.ally4.get("info").get("sprite"))
		$ally4m/name4.text = gl.ally4.get("info").get("name")
	else:
		$ally4m.visible = false
	if gl.allycount >= 3:
		$ally3m.visible = true
		
		var ally3 = allyscene.instantiate()
		ally3.position = Vector2(505, 320)
		ally3.id = 3
		add_child(ally3)
		
		$ally3m/icon3.texture = load(gl.ally3.get("info").get("sprite"))
		$ally3m/name3.text = gl.ally3.get("info").get("name")
	else:
		$ally3m.visible = false
	if gl.allycount >= 2:
		$ally2m.visible = true
		var ally2 = allyscene.instantiate()
		ally2.position = Vector2(405, 320)
		ally2.id = 2
		add_child(ally2)
		
		$ally2m/icon2.texture = load(gl.ally2.get("info").get("sprite"))
		$ally2m/name2.text = gl.ally2.get("info").get("name")
	else:
		$ally2m.visible = false
	if gl.allycount >= 1:
		$ally1m.visible = true
		
		var ally1 = allyscene.instantiate()
		ally1.position = Vector2(405, 220)
		ally1.id = 1
		add_child(ally1)
		
		$ally1m/icon1.texture = load(gl.ally1.get("info").get("sprite"))
		$ally1m/name1.text = gl.ally1.get("info").get("name")
	else:
		$ally1m.visible = false

func _process(delta: float) -> void:
	if gl.allyID > gl.allycount:
		pass
	
