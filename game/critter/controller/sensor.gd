# Copyright (c) 2024 Rich Harkins.  All Rights Reserved.
extends Area2D
class_name LD56Sensor

## Triggers method when collision occurs.  Requires a collision shape.
##
## TODO: Better documentation

## Locates this class in the node tree based on a descendant.
static func find_from(node: Node) -> LD56Sensor:
	return (
		LD56Ancestry.find_ancestor_of(node, LD56Sensor)
	) as LD56Sensor

#############################################################################
# Public Interface
#############################################################################

## Method name to call on other object
@export var method : String

## Parameter to pass to other object
@export var source : Node = self

## Look for method on source or on the collided object?  The first argument
## of the call witll be the other object.
@export var call_source := false

## Search for method in parents?
@export var search_ancestors := false

## Search for method in children?
@export var search_descendants := false

## Limit search to specific type.  Leave blank to accept any type with the
## method specified.  Subclasses of type will also be accepted.
@export var type : String

## Extra arguments to provide
@export var args : Array

## Description of signal
#signal mysignal()

## Purpose of variable
#var myvar := 0.0


#############################################################################
# Initialization
#############################################################################

#func constructor():
	#pass
	
func _ready() -> void:
	area_entered.connect(on_collision)
	body_entered.connect(on_collision)

#############################################################################
# Private/protected members, methods, and inner classes.
#############################################################################

## Purpose of member
#var _local := 0.0

## Purpose of method
func on_collision(other):
	var target
	var _method = method
	
	if not _method and type:
		_method = "trigger"
	
	if not _method:
		return

	if search_ancestors:
		var ancestor = source if call_source else other
		while ancestor != null:
			if ((type == "" or is_instance_of(ancestor, type))
				and ancestor.has_method(_method)):				
				target = ancestor
			else:
				ancestor = ancestor.get_parent()
		
		if ancestor != null:
			target = ancestor
	
	if target == null and search_descendants:
		var check = source if call_source else other
		var todo := []
		
		# Do a breadth-first search for the target type.
		while check != null:
			if check is Node:
				var child_count : int = check.get_child_count()
				var idx := 0
				while idx < child_count:
					var child = check.get_child(idx)
					idx += 1
				
					if ((type == "" or is_instance_of(check, type))
						and check.has_method(_method)):				
						target = check
						break
					elif child.get_child_count():
						todo.push_back(child)
					
			if target == null:
				check = todo.pop_front()
			else:
				break
		
	if target == null:
		push_error("'%s' cannot find '%s' in '%s'" % [self, method, other])
		return
	else:
		return notify(other, _method, args.duplicate())

## Invokes teh callable with arguments, calling source or _other's method
## as per call_source.  _params is assumed to be an isolated shallow copy
## of the arguments to invoke so assumes subclasses may manipulate the
## top-level array safely (but not nested elements).
func notify(_other: Variant, _method: String, _params: Array) -> Variant:
	var target = source if call_source else _other
	_params.push_front(_other if call_source else source)
	return target.callv(_method, _params)

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
