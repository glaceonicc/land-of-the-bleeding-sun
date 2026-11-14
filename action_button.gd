extends Button

@export var buttontype: String
@export var id: int

func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if gl.allyID == id:
		disabled = false
	else:
		disabled = true

func _on_pressed() -> void:
	if buttontype == "b":
		gl.emit_signal("bounce")
	if buttontype == "d":
		gl.emit_signal("defend")
	if buttontype == "a":
		gl.emit_signal("attack")
