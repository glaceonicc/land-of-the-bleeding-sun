extends CharacterBody2D

@export var id: int

var range: float
var weaponrange: float
var aiming = false
var inrange = false
var inwrange = false
var action = ""
var naming = ""
var damage: int

func _ready() -> void:
	gl.connect("attack", attack)
	gl.connect("defend", defend)
	gl.connect("bounce", bounce)
	gl.connect("proceed", proceed)
	$aim/sprite.visible = false
	
	if id == 1:
		$sprite.texture = load(gl.ally1.get("info").get("sprite"))
		range = gl.ally1.get("basestats").get("rng") * 120
		weaponrange = gl.w1.get("stats").get("rng") * 120 
		gl.hp1 = gl.ally1.get("basestats").get("hp")
		gl.maxhp1 = gl.ally1.get("basestats").get("hp")
		naming = gl.ally1.get("info").get("name")
		damage = gl.ally1.get("basestats").get("dmg")
	if id == 2:
		$sprite.texture = load(gl.ally2.get("info").get("sprite"))
		range = gl.ally2.get("basestats").get("rng") * 120
		weaponrange = gl.w2.get("stats").get("rng") * 120 
		gl.hp2 = gl.ally2.get("basestats").get("hp")
		gl.maxhp2 = gl.ally2.get("basestats").get("hp")
		naming = gl.ally2.get("info").get("name")
		damage = gl.ally2.get("basestats").get("dmg")
	if id == 3:
		$sprite.texture = load(gl.ally3.get("info").get("sprite"))
		range = gl.ally3.get("basestats").get("rng") * 120
		weaponrange = gl.w3.get("stats").get("rng") * 120 
		gl.hp3 = gl.ally3.get("basestats").get("hp")
		gl.maxhp3 = gl.ally3.get("basestats").get("hp")
		naming = gl.ally3.get("info").get("name")
		damage = gl.ally3.get("basestats").get("dmg")
	if id == 4:
		$sprite.texture = load(gl.ally4.get("info").get("sprite"))
		range = gl.ally4.get("basestats").get("rng") * 120
		weaponrange = gl.w4.get("stats").get("rng") * 120 
		gl.hp4 = gl.ally4.get("basestats").get("hp")
		gl.maxhp4 = gl.ally4.get("basestats").get("hp")
		naming = gl.ally4.get("info").get("name")
		damage = gl.ally4.get("basestats").get("dmg")

	

func _physics_process(delta: float) -> void:
	if aiming == true and action == "bounce":
		aim()
	elif aiming == true and action == "bounceattack":
		bounceattackaim()
	if position.distance_to(get_global_mouse_position()) > range:
		inrange = false
	else:
		inrange = true
	if position.distance_to(get_global_mouse_position()) > weaponrange:
		inwrange = false
	else:
		inwrange = true

func attack():
	if id == gl.allyID and gl.w1.get("stats").get("type") == "meele":
		action = "bounceattack"
		aiming = true
	if id == gl.allyID and gl.w2.get("stats").get("type") == "meele":
		action = "bounceattack"
		aiming = true
	if id == gl.allyID and gl.w3.get("stats").get("type") == "meele":
		action = "bounceattack"
		aiming = true
	if id == gl.allyID and gl.w4.get("stats").get("type") == "meele":
		action = "bounceattack"
		aiming = true
		

func defend():
	pass

func bounce():
	if gl.allyID == id:
		action = "bounce"
		aiming = true


func aim():
	$aim/sprite.visible = true
	if gl.inarena == true and inrange == true:
		$aim.global_position = get_global_mouse_position()
	if Input.is_action_just_pressed("click"):
		#global_position = $aim.global_position
		aiming = false
		gl.allyID += 1

func proceed():
	if gl.STATE == "allies" and gl.current == id:
		if action == "bounce":
			gl.emit_signal("addlog", naming + " bounced back!")
			var tween = get_tree().create_tween()
			var thing = $aim.global_position
			$aim.visible = false
			tween.parallel().tween_property(self, "position", thing, 0.5).set_trans(Tween.TRANS_SINE)
			$anim.play("anim1")
			await $anim.animation_finished
		if action == "bounceattack":
			gl.emit_signal("addlog", naming + " attacks by bouncing!")
			var tween = get_tree().create_tween()
			var thing = $aim.global_position
			$aim.visible = false
			tween.parallel().tween_property(self, "position", thing, 0.5).set_trans(Tween.TRANS_SINE)
			$anim.play("anim1")
			await $anim.animation_finished
			gl.emit_signal("hit", damage)
		if gl.current < gl.allycount:
			gl.current += 1
		else:
			gl.current = 1
			gl.STATE = "enemies"
		gl.emit_signal("proceed")

func bounceattackaim():
	$aim/sprite.visible = true
	if gl.inarena == true and inwrange == true:
		$aim.global_position = get_global_mouse_position()
	if Input.is_action_just_pressed("click"):
		aiming = false
		gl.allyID += 1
