extends Node

class_name Damageable 

@export var health : float = 20

func hit(damage : int):
	health -= damage
	
	if (health <= 0):
		wait(1)
		get_parent().queue_free()
