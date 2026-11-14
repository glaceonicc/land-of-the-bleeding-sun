extends CharacterBody2D

@export var id: int



func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	aim(delta)


func aim(delta):
	if gl.inarena == true:
		$aim.global_position = get_global_mouse_position()
		if Input.is_action_just_pressed("click"):
			global_position = $aim.global_position
