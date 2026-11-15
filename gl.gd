extends Node

var inarena = false
var aiming = false

var STATE = "none"
var allyID = 0
var current = 0

var allycount = 4
var alliesleft = 4

var ally1 = allies.Orchid
var ally2 = allies.Kiki
var ally3 = allies.Verity
var ally4 = allies.flower_figure

var hp1 = 0
var hp2 = 0
var hp3 = 0
var hp4 = 0
var maxhp1 = 0
var maxhp2 = 0
var maxhp3 = 0
var maxhp4 = 0


var w1 = items.matchet
var w2 = items.butcher
var w3 = items.verityball
var w4 = items.flower

var vectora1
var vectora2
var vectora3
var vectora4

var battleid = 0

signal progress_turn

signal proceed(id)
signal new_turn

signal attack
signal defend
signal bounce

signal addlog

signal hit
signal enemyhit

var enemycount: int
var enemydies: int
