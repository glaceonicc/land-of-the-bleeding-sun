extends Node

var inarena = false
var aiming = false

var STATE = "none"
var allyID = 0

var allycount = 4

var ally1 = allies.Orchid
var ally2 = allies.Orchid
var ally3 = allies.Orchid
var ally4 = allies.Orchid

var w1 = items.fist
var w2 = items.fist
var w3 = items.fist
var w4 = items.fist

signal progress_turn

signal attack
signal defend
signal bounce
