# Copyright (c) 2024 Rich Harkins.  All Rights Reserved.
extends Node
class_name LD56LevelEnd

## Purpose of this script.
##
## Desription of this script.
## See https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_documentation_comments.html#bbcode-and-class-reference

## Locates this class in the node tree based on a descendant.
static func find_from(node: Node) -> LD56LevelEnd:
	return (
		LD56Ancestry.find_ancestor_of(node, LD56LevelEnd)
	) as LD56LevelEnd

#############################################################################
# Public Interface
#############################################################################

## Description of export
#@export var myexport := 0

## Description of signal
signal ending_completed()

## Purpose of variable
var highlighted : Node2D
var highlight_color : Color
var unhighlighted_color : Color

## Sets the highlighting
func highlight(node: Node2D, color: Color) -> void:
	highlighted = node
	highlight_color = highlight_color
	unhighlighted_color = highlighted.modulate

#############################################################################
# Initialization
#############################################################################

#func constructor():
	#pass
	
func _ready() -> void:
	blink_highlighted()

#############################################################################
# Private/protected members, methods, and inner classes.
#############################################################################

## Purpose of member
var _highlighting := false

## Purpose of method
#func method() -> void:
	#pass

## Called when the level free and the next (or same) level should appear.
func end_level() -> void:
	ending_completed.emit()

## Called to "blink" the highlighted Node.
func blink_highlighted() -> void:
	print_debug("blink")
	_highlighting = not _highlighting
	if _highlighting:
		highlighted.modulate = highlight_color
	else:
		highlighted.modulate = unhighlighted_color

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
