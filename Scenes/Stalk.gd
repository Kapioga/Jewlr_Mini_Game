extends AnimationPlayer

var animation = Animation.new()
var track_index = animation.add_track(Animation.TYPE_VALUE)

func _physics_process(delta):
	animation.track_set_path(track_index, "KinematicBody2D:position:x")
	animation.track_insert_key(track_index, 0.0, 0)
	animation.track_insert_key(track_index, 0.5, 100)

move_and_collide(animation)
