extends Node2D

# BATTLE SCRIPT

func _ready() -> void:
	gl.STATE = "pick1"
	gl.allyID = 1

func _process(delta: float) -> void:
	if gl.STATE == "pick1":
		pick1()
	if gl.STATE == "pick2":
		pick2()
	if gl.STATE == "pick3":
		pick3()
	if gl.STATE == "pick4":
		pick4()

func pick1():
	pass

func pick2():
	pass

func pick3():
	pass

func pick4():
	pass
