# Copyright (c) 2024 Rich Harkins.  All Rights Reserved.
extends LD56Critter
class_name LD56Beetle

## Represents the player.

## Locates this class in the node tree based on a descendant.
static func find_from(node: Node) -> LD56Beetle:
	return (
		LD56Ancestry.find_ancestor_of(node, LD56Beetle)
	) as LD56Beetle

#############################################################################
# Public Interface
#############################################################################

## Node that will carry dung
@export var dung_carrier_node : Node

## Percent impact to speed when fully laden
@export var fully_laden_pct := 60.0

## Description of signal
#signal mysignal()

## Current dungball in mandables or null if one isn't there.
var dungball : LD56Dungball

## Drop the ball
func drop_ball() -> LD56Dungball:
	var ball := dungball
	dungball = null
	update_dung()
	return ball
	
## Release the back back to the floor
func release_ball():
	var ball := drop_ball()
	if ball != null:
		var space := LD56TileSpace.find_from(self)
		if space != null:
			space.accept_dungball(ball)
		else:
			ball.queue_free()

#############################################################################
# Initialization
#############################################################################

#func constructor():
	#pass
	
func _ready() -> void:
	update_dung()

#############################################################################
# Private/protected members, methods, and inner classes.
#############################################################################

## Purpose of member
#var _local := 0.0

## Lets the overall game know the level of dung being pushed
func update_dung():
	var dung_carried := 0 if dungball == null else dungball.size
	var max_dung := 1 if dungball == null else dungball.max_size

	var game := LD56Game.find_from(self)
	if game != null:
		var points := points_for_dung(dung_carried, max_dung)
		game.update_dung_carried(dung_carried, max_dung, points)

## Try to incorporate a new dungball into the current one, grabbing the new
## one if we don't have one already.
func integrate_dung(dung: LD56Dungball) -> void:
	if dung == dungball:
		return
	elif dungball == null:
		return
	elif dungball.add_dung(dung):
		dung.queue_free()
	update_dung()

func accept_dung(dung: LD56Dungball) -> void:
	if dung == dungball:
		return
	elif dungball == null:
		dung.reparent(self.dung_carrier_node)
		dung.position = Vector2.ZERO
		dungball = dung
		print_debug(dungball)
	elif dungball.add_dung(dung):
		dung.queue_free()
	update_dung()
		
# Computes the beetle's current speed.
func get_speed() -> float:
	var _speed := super()
	if dungball != null:
		_speed *= 1.0 - (
			(fully_laden_pct / 100.0) 
			* (dungball.size * 1.0 / dungball.max_size)
		)
	return _speed

## Computes the score for dung of a given size
func points_for_dung(size: int, max: int) -> int:
	return floor(size ** 1.2)

## Called when an enemy captures
func killed_by(enemy: LD56Enemy):
	print_debug("KILLED BY: ", enemy)
	var level := LD56Level.find_from(self)
	level.player_killed_by(enemy)

## Purpose of inner class
#class MyClass:
	#pass

#############################################################################
# Event processing, signal handlers
#############################################################################

#func _process(_delta: float) -> void:
	#pass

func _physics_process(_delta: float) -> void:
	super(_delta)

#func _input(event: InputEvent) -> void:
	#pass
	
func _on_item_sense_area_entered(area: Area2D) -> void:
	if area is LD56Element:
		area.call_deferred("interact_with_beetle_ball", self)


func _on_mouth_sense_area_entered(area: Area2D) -> void:
	if area is LD56Element:
		area.call_deferred("interact_with_beetle_mouth", self)


func _on_enemy_sense_body_entered(body: Node2D) -> void:
	if body is LD56Enemy:
		self.killed_by(body)
