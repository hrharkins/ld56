# Copyright (c) 2024 Rich Harkins.  All Rights Reserved.
extends Control
class_name LD56Game

## Purpose of this script.
##
## Desription of this script.
## See https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_documentation_comments.html#bbcode-and-class-reference

## Locates this class in the node tree based on a descendant.
static func find_from(node: Node) -> LD56Game:
	return (
		LD56Ancestry.find_ancestor_of(node, LD56Game)
	) as LD56Game

#############################################################################
# Public Interface
#############################################################################

## Description of export
#@export var myexport := 0

## Signals when score changes
signal score_updated(score: int)

## Signals when carried dung changes
signal dung_carried_updated(size: int, max: int)

## Current score (may be from previous game)
var score := 0 :
	set(value):
		if score != value:
			score = value
			score_updated.emit(score)


#############################################################################
# Initialization
#############################################################################

#func constructor():
	#pass
	
func _ready() -> void:
	score_updated.emit(score)

#############################################################################
# Private/protected members, methods, and inner classes.
#############################################################################

## Purpose of member
#var _local := 0.0

## Score points and notify other parts of the system
func add_score(points: int) -> void:
	score += points

## Called when level compelted
func level_completed():
	print_debug("Level completed!")
	
## Called to update the dung indicator
func update_dung_carried(carried: int, carry_max: int, points: int) -> void:
	dung_carried_updated.emit(carried, carry_max, points)

## Purpose of inner class
#class MyClass:
	#pass

#############################################################################
# Event processing, signal handlers
#############################################################################

#func _process(_delta: float) -> void:
	#pass

#func _physics_process(_delta: float) -> void:
	#pass

#func _input(event: InputEvent) -> void:
	#pass
