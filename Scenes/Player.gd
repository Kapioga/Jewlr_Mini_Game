extends KinematicBody2D

var speed = 5.0

var Wall = preload("res://Scenes/Walls.tscn")
var score = 0

#------ Controls -------#
func _physics_process(delta):
	var velocity = Vector2.ZERO
	#if Input.is_action_pressed("ui_right"):
		#position.x += 1.0 * speed
	#if Input.is_action_pressed("ui_left"):
		#position.x -= 1.0 * speed
	if Input.is_action_pressed("ui_up"):
		position.y -= 1.0 * speed
	elif Input.is_action_pressed("ui_down"):
		position.y += 1.0 * speed
		
	move_and_slide(position * velocity)

	#get_parent().get_parent().get_node("CanvasLayer/RichTextLabel").text = int(score)

#------ Resets the wall's spawn once passed -------#
func Wall_reset():
	var Wall_instance = Wall.instance()
	Wall_instance.position = Vector2(800, rand_range(-60, 60))
	
	#Allows Wall Scene to be called when the Resetter is called/collided
	get_parent().call_deferred("add_child", Wall_instance)
	
	
#------ Spawns an additional set of walls -------#
func _on_LeftResetter_body_entered(body):
	if body.name == "Walls":
		body.queue_free()
		Wall_reset()


#------ Points entered when the player collides with point area -------#
func _on_Detect_area_entered(area):
	if area.name == "PointArea":
		score = score + 1
		

#------ Detects Wall collission with Body -------#
func _on_Detect_body_entered(body):
	if body.name == "Walls":
		get_tree().reload_current_scene()


func _on_Timer_timeout():
	pass # Replace with function body.
