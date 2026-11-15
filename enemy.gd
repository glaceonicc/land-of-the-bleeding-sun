extends StaticBody2D

@export var enemytype = "Openworm"
@export var health = 4.5
@export var id = 0
@export var attackmessage = "wowa"

var inside = 0
var inside2 = 0
var maxhealth = health
var kil = false
var a = false

func _ready() -> void:
	gl.connect("hit", hit)
	gl.connect("proceed", proceed)
	gl.connect("new_turn", newturn)
	$hpbar.max_value = maxhealth
	gl.enemycount += 1
	

func _process(delta: float) -> void:
	$hpbar.value = health
	if health <= 0 and a == false :
		a = true
		kil = true
		visible = false
		gl.enemydies += 1


func _on_die_area_area_entered(area: Area2D) -> void:
	if area.is_in_group("allies"):
		inside += 1
		inside2 += 1


func _on_die_area_area_exited(area: Area2D) -> void:
	if area.is_in_group("allies"):
		inside -= 1
		inside2 -= 1

func hit(damage):
	if inside > 0:
		health -= damage
		inside = 0
		print("owowads")

func proceed():
	if gl.STATE == "enemies" and gl.current == id:
		print("current:" + str(gl.current) + "id:" + str(id))
		if kil == false:
			gl.emit_signal("addlog", attackmessage)
			if gl.allycount < 5:
				var a1 = position.distance_to(gl.vectora1)
				var a2 = position.distance_to(gl.vectora2)
				var a3 = position.distance_to(gl.vectora3)
				var a4 = position.distance_to(gl.vectora4)
				var b1: float = 0
				var b2: float = 0
				var nearestVector: int = 0
				var nearestVector2: int = 0
				var finaldistance: float = 0
				var gotovector
				if a1 < a2:
					b1 = a1
					nearestVector = 1
				else:
					b1 = a2
					nearestVector = 2
				if a3 < a4:
					b2 = a3
					nearestVector2 = 3
				else:
					b2 = a4
					nearestVector2 = 4
				if b1 < b2:
					finaldistance = b1
					nearestVector = nearestVector
				else:
					finaldistance = b2
					nearestVector = nearestVector2
				if nearestVector == 1:
					gotovector = gl.vectora1
				if nearestVector == 2:
					gotovector = gl.vectora2
				if nearestVector == 3:
					gotovector = gl.vectora3
				if nearestVector == 4:
					gotovector = gl.vectora4
				var tween = get_tree().create_tween()
				tween.parallel().tween_property(self, "position", gotovector, 0.5).set_trans(Tween.TRANS_SINE)
				await tween.finished
				gl.emit_signal("enemyhit")
			
		if id == gl.enemycount:
			gl.current = 1
			gl.allyID = 1
			gl.emit_signal("new_turn")
		else:
			gl.current += 1
			gl.emit_signal("proceed")
			print("procced" + str(id) + str(gl.current))

			print("new turn")

func newturn():
	inside = inside2
