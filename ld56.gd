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

## Initial scene to view.
@export_file var initial_scene

## Scene list
@export var scenes := {}

## Description of export
@export var game_panel : PanelContainer

## Signals when score changes
signal score_updated(score: int)

## Signals when lives are updated
signal lives_updated(lives: int)

## Signals when carried dung changes
signal dung_carried_updated(size: int, max: int)

## Current score (may be from previous game)
var score := 0 :
	set(value):
		if score != value:
			score = value
			score_updated.emit(score)
			
## Remaining lives
var lives := 3:
	set(value):
		if lives != value:
			lives = value
			lives_updated.emit(lives)

## Current viewed panel in game_panel
var last_viewed : PackedScene

var viewing : Panel :
	set(value):
		if value != viewing:
			if viewing != null:
				game_panel.remove_child(viewing)
				viewing.queue_free()
			viewing = value
			game_panel.add_child(viewing)
			_init_viewing()

## Current level being played
var level : LD56Level :
	set(value):
		if value != level:
			level = value
			_init_level()

## Score points and notify other parts of the system
func add_score(points: int) -> void:
	score += points

## Called when level compelted
func level_completed():
	print_debug("Level completed!")

func view(scene) -> Node:
	var packed : PackedScene
	if scene is String:
		packed = load(scene)
	else:
		packed = scene
	
	if packed is PackedScene:
		last_viewed = packed
		viewing = packed.instantiate()
		return viewing
	else:
		push_error("Scene '%s' not valid = '%s'" % [scene, packed])
		return null

#############################################################################
# Initialization
#############################################################################

#func constructor():
	#pass
	
func _ready() -> void:
	score_updated.emit(score)
	lives_updated.emit(lives)
	if initial_scene:
		view(initial_scene)

#############################################################################
# Private/protected members, methods, and inner classes.
#############################################################################

## Purpose of member
#var _local := 0.0
	
## Called to update the dung indicator
func update_dung_carried(carried: int, carry_max: int, points: int) -> void:
	dung_carried_updated.emit(carried, carry_max, points)
	
## Called to setup a newly set .viewing
func _init_viewing():
	pass

## Called to set up the newly set .level
func _init_level():
	level.level_finished.connect(_level_finished)
		
## Called when the level finishes
func _level_finished(success: bool):
	if success:
		print_debug("WINNER!")
	elif lives > 0:
		lives -= 1
		view(last_viewed)
	else:
		view("game_over")
	
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
