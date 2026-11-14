extends CharacterBody2D

@export var id: int

var aiming = false

func _ready() -> void:
	gl.connect("attack", attack)
	gl.connect("defend", defend)
	gl.connect("bounce", bounce)

func _physics_process(delta: float) -> void:
	if aiming == true:
		aim(delta)

func attack():
	pass

func defend():
	pass

func bounce():
	if gl.allyID == id:
		aiming = true


func aim(delta):
	if gl.inarena == true:
		$aim.global_position = get_global_mouse_position()
		if Input.is_action_just_pressed("click"):
			global_position = $aim.global_position
			aiming == false
