extends CharacterBody2D

@export var id: int

var range: float
var aiming = false
var inrange = false

func _ready() -> void:
	gl.connect("attack", attack)
	gl.connect("defend", defend)
	gl.connect("bounce", bounce)
	
	if id == 1:
		$sprite.texture = load(gl.ally1.get("info").get("sprite"))
		range = gl.ally1.get("basestats").get("rng") * 120
	if id == 2:
		$sprite.texture = load(gl.ally2.get("info").get("sprite"))
		range = gl.ally2.get("basestats").get("rng") * 120
	if id == 3:
		$sprite.texture = load(gl.ally3.get("info").get("sprite"))
		range = gl.ally3.get("basestats").get("rng") * 120
	if id == 4:
		$sprite.texture = load(gl.ally4.get("info").get("sprite"))
		range = gl.ally4.get("basestats").get("rng") * 120

	

func _physics_process(delta: float) -> void:
	if aiming == true:
		aim()
	if position.distance_to(get_global_mouse_position()) > range:
		inrange = false
	else:
		inrange = true

func attack():
	if gl.w1.get("stats").get("type") == "meele":
		aiming == true

func defend():
	pass

func bounce():
	if gl.allyID == id:
		aiming = true


func aim():
	if gl.inarena == true and inrange == true:
		$aim.global_position = get_global_mouse_position()
	if Input.is_action_just_pressed("click"):
		#global_position = $aim.global_position
		aiming = false
		gl.allyID += 1
			
