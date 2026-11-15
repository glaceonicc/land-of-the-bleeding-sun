extends Node2D

# BATTLE SCRIPT

var allyscene = load("res://ally.tscn")

func _ready() -> void:
	gl.STATE = "pick1"
	gl.allyID = 1
	gl.battleid += 1
	gl.alliesleft = gl.allycount
	
	gl.connect("addlog", addlog)
	gl.connect("new_turn", new_turn)
	
	
	
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
	if gl.allyID > gl.allycount and gl.current == 0:
		gl.STATE = "allies"
		gl.current = 1
		gl.emit_signal("proceed")
	if gl.enemycount == gl.enemydies:
		print("win")
		gl.current = 0
		gl.hp1 = gl.maxhp1
		gl.hp2 = gl.maxhp2
		gl.hp3 = gl.maxhp3
		gl.hp4 = gl.maxhp4
		gl.enemycount =0 
		if gl.battleid == 1:
			get_tree().change_scene_to_file("res://battle2.tscn")
		if gl.battleid == 2:
			get_tree().change_scene_to_file("res://battle3.tscn")
		if gl.battleid == 3:
			get_tree().change_scene_to_file("res://battle4.tscn")
		if gl.battleid == 4:
			get_tree().quit()
			
	
	$ally1m/hpbar1.max_value = gl.maxhp1
	$ally2m/hpbar2.max_value = gl.maxhp2
	$ally3m/hpbar3.max_value = gl.maxhp3
	$ally4m/hpbar4.max_value = gl.maxhp4
	
	$ally1m/hpbar1.value = gl.hp1
	$ally2m/hpbar2.value = gl.hp2
	$ally3m/hpbar3.value = gl.hp3
	$ally4m/hpbar4.value = gl.hp4
	
	if gl.alliesleft == 0:
		pass

func addlog(text):
	var logz = Label.new()
	logz.text = text
	logz.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	$ScrollContainer/VBoxContainer.add_child(logz)

func new_turn():
	gl.STATE = "pick1"
	gl.current = 0
	gl.allyID = 1
