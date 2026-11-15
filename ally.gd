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
var inside = false
var inside2 = false
var shield = false
var kil =false
var presesd = false

func _ready() -> void:
	gl.connect("attack", attack)
	gl.connect("defend", defend)
	gl.connect("bounce", bounce)
	gl.connect("proceed", proceed)
	gl.connect("enemyhit", enemyhit)
	gl.connect("new_turn", new_turn)
	
	
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
		$aim/sprite.visible = true
	elif aiming == true and action == "bounceattack":
		bounceattackaim()
		$aim/sprite.visible = true
	if position.distance_to(get_global_mouse_position()) > range:
		inrange = false
	else:
		inrange = true
	if position.distance_to(get_global_mouse_position()) > weaponrange:
		inwrange = false
	else:
		inwrange = true
	if shield == true:
		$defend.visible = true
	else:
		$defend.visible = false
	
	if id == 1:
		gl.vectora1 = position
		if gl.hp1 <= 0:
			kil =true
	if id == 2:
		gl.vectora2 = position
		if gl.hp2 <= 0:
			kil =true
	if id == 3:
		gl.vectora3 = position
		if gl.hp3 <= 0:
			kil =true
	if id == 4:
		gl.vectora4 = position
		if gl.hp4 <= 0:
			kil =true
	var a = true
	
	if id == gl.allyID:
		pass
	else:
		presesd = false
	
	if kil==true:
		if a == true:
			a = false
			gl.alliesleft -= 1
		visible = false
		
		if gl.allyID == id:
			gl.allyID +=1

func attack():
	if id == gl.allyID and presesd == false:
		presesd = true
		$attack.visible = true
		if gl.w1.get("stats").get("type") == "meele":
			action = "bounceattack"
			aiming = true
		if gl.w2.get("stats").get("type") == "meele":
			action = "bounceattack"
			aiming = true
		if gl.w3.get("stats").get("type") == "meele":
			action = "bounceattack"
			aiming = true
		if gl.w4.get("stats").get("type") == "meele":
			action = "bounceattack"
			aiming = true
		

func defend():
	if id == gl.allyID and presesd == false:
		shield = true
		gl.allyID += 1
		gl.emit_signal("addlog", naming + " shielded themselves!")
		presesd = true
	
func bounce():
	if gl.allyID == id and presesd == false:
		action = "bounce"
		aiming = true
		$bounce.visible = true
		presesd = true


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
			tween.parallel().tween_property(self, "position", thing, 0.5).set_trans(Tween.TRANS_SINE)
			$aim.global_position = position
			$anim.play("anim1")
			await $anim.animation_finished
		if action == "bounceattack":
			gl.emit_signal("addlog", naming + " attacks by bouncing!")
			var tween = get_tree().create_tween()
			var thing = $aim.global_position
			tween.parallel().tween_property(self, "position", thing, 0.5).set_trans(Tween.TRANS_SINE)
			$aim.global_position = position
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




func _on_detect_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemyhit"):
		inside = true
		inside2=true


func _on_detect_area_exited(area: Area2D) -> void:
	if area.is_in_group("enemyhit"):
		inside = false
		inside2=false

func enemyhit():
	if inside == true:
		if id == 1:
			if shield == true:
				gl.hp1 -= 1.0
			else:
				gl.hp1 -= 5.0
		if id == 2:
			if shield == true:
				gl.hp2 -= 1.0
			else:
				gl.hp2 -= 5.0
		if id == 3:
			if shield == true:
				gl.hp3 -= 1.0
			else:
				gl.hp3 -= 5.0
		if id == 4:
			if shield == true:
				gl.hp4 -= 1.0
			else:
				gl.hp4 -= 5.0
		inside = false

func new_turn():
	shield = false
	$attack.visible = false
	$bounce.visible = false
	inside = inside2
