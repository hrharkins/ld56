# Copyright (c) 2024 Rich Harkins.  All Rights Reserved.
extends LD56Element
class_name LD56Dungball

## Purpose of this script.
##
## Desription of this script.
## See https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_documentation_comments.html#bbcode-and-class-reference

static func find_from(node: Node) -> LD56Dungball:
	return (
		LD56Ancestry.find_ancestor_of(node, LD56Dungball)
	) as LD56Dungball

#############################################################################
# Public Interface
#############################################################################

## Size of this dungball.
@export var size := 1

## Maximum size of dungball.
@export var max_size := 32

## Ratio of max size for minmum sized dungball
@export var min_scale_ratio := 2.0

## Size of "full grown" dungball (aspect ratio 1.0 assumed)
@export var full_scale := 0.5

## Description of signal
#signal mysignal()

## Purpose of variable
#var myvar := 0.0

#############################################################################
# Initialization
#############################################################################

#func constructor():
	#pass
	
#func _ready() -> void:
	#pass

#############################################################################
# Private/protected members, methods, and inner classes.
#############################################################################

## Last size of dungbal prior to rescale
var _last_size := 0

## Returns scale based on size and full size scale.
static func scale_dungball(
	_size: int, 
	_max_size: int, 
	_min_scale: float, 
	_full_scale: float) -> float:
	
	var scale_range := _full_scale - _min_scale
	return _min_scale + scale_range * (_size * 1.0 / _max_size)
	
## Rescales this dungball.
func rescale():
	var min_scale := full_scale / min_scale_ratio
	var dung_scale := scale_dungball(size, max_size, min_scale, full_scale)
	scale = Vector2(dung_scale, dung_scale)
	
## Attempts to integrate a dungball into this one by adjusting the sizes.
func add_dung(other: LD56Dungball) -> bool:
	var new_size := size + other.size
	if new_size <= max_size:
		size = new_size
		return true
	else:
		return false
		
## Delegates interaction with beetle's dungball.  
## 
## The beetle side needs to do the heavy lifting here.
func interact_with_beetle_ball(beetle: LD56Beetle) -> void:
	super(beetle)
	beetle.integrate_dung(self)

## Purpose of inner class
#class MyClass:
	#pass

#############################################################################
# Event processing, signal handlers
#############################################################################

#func _process(_delta: float) -> void:
	#pass

func _physics_process(_delta: float) -> void:
	# Rescale the dungball if needed.
	if size != _last_size:
		_last_size = size
		rescale()

#func _input(event: InputEvent) -> void:
	#pass
