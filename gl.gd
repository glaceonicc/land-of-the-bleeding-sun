extends Node

var inarena = false
var aiming = false

var STATE = "none"
var allyID = 0
var current = 0

var allycount = 4

var ally1 = allies.Orchid
var ally2 = allies.Orchid
var ally3 = allies.Orchid
var ally4 = allies.Glace

var hp1
var hp2
var hp3
var hp4
var maxhp1
var maxhp2
var maxhp3
var maxhp4


var w1 = items.fist
var w2 = items.stick
var w3 = items.fist
var w4 = items.stick

signal progress_turn

signal proceed(id)

signal attack
signal defend
signal bounce

signal addlog

signal hit
