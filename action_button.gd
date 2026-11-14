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
	if buttontype == "a":
		if id == 1:
			icon = load(gl.w1.get("stats").get("sprite"))
		if id == 2:
			icon = load(gl.w2.get("stats").get("sprite"))
		if id == 3:
			icon = load(gl.w3.get("stats").get("sprite"))
		if id == 4:
			icon = load(gl.w4.get("stats").get("sprite"))

func _on_pressed() -> void:
	if buttontype == "b":
		gl.emit_signal("bounce")
	if buttontype == "d":
		gl.emit_signal("defend")
	if buttontype == "a":
		gl.emit_signal("attack")
