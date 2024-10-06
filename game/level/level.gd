# Copyright (c) 2024 Rich Harkins.  All Rights Reserved.
extends Panel
class_name LD56Level

## Purpose of this script.
##
## Desription of this script.
## See https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_documentation_comments.html#bbcode-and-class-reference

## Locates this class in the node tree based on a descendant.
static func find_from(node: Node) -> LD56Level:
	return (
		LD56Ancestry.find_ancestor_of(node, LD56Level)
	) as LD56Level

#############################################################################
# Public Interface
#############################################################################

## Nodes to disable on halt
@export var halt_nodes : Array[Node]

## Scene to use on player death
@export var end_scene: PackedScene

## Description of signal
signal level_finished(success: bool)

## Purpose of variable
#var myvar := 0.0

## Called when the player is killed
func player_killed_by(enemy: LD56Enemy):
	var scene := end_scene.instantiate() as LD56LevelEnd
	scene.highlight(enemy, Color.RED)
	call_deferred("halt", scene)

## Called to stop the level from processing input, etc.
func halt(scene: LD56LevelEnd, success := false):
	scene.ending_completed.connect(func(): _end_level(success))
	for node in halt_nodes:
		node.process_mode = PROCESS_MODE_DISABLED
	add_child(scene)

#############################################################################
# Initialization
#############################################################################

#func constructor():
	#pass
	
func _ready() -> void:
	var game := LD56Game.find_from(self)
	if game != null:
		game.level = self

#############################################################################
# Private/protected members, methods, and inner classes.
#############################################################################

## Purpose of member
#var _local := 0.0

## Purpose of method
func _end_level(success := false) -> void:
	print_debug("LEVEL END")
	level_finished.emit(success)
	queue_free()

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
