extends StaticBody2D

@export var enemytype = "Openworm"
@export var health = 1.5
@export var id = 0
@export var attackmessage = "wowa"

var inside = false
var maxhealth = health

func _ready() -> void:
	gl.connect("hit", hit)
	gl.connect("proceed", proceed)
	$hpbar.max_value = maxhealth
	

func _process(delta: float) -> void:
	$hpbar.value = health


func _on_die_area_area_entered(area: Area2D) -> void:
	if area.is_in_group("allies"):
		inside = true


func _on_die_area_area_exited(area: Area2D) -> void:
	if area.is_in_group("allies"):
		inside = false

func hit(damage):
	if inside == true:
		health -= damage
		inside = false
		print("owowads")

func proceed():
	gl.emit_signal("addlog", attackmessage)
	
