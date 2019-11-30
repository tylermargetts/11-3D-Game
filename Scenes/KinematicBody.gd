extends KinematicBody

onready var camera = $Pivot/Camera

var gravity = -30
var max_speed = 3
var min_speed = 0 
var max_velocity = 5
var ACC = 1
var speed_time = 0
var lap = 0



var velocity = Vector3()

func increase_lap(lap): 
	$HUD/Lap.text = str(lap)

func get_input():
    var input_dir = Vector3()
    # desired move in camera direction
    if Input.is_action_pressed("move_forward"):
        input_dir += (-camera.global_transform.basis.z)
    if Input.is_action_pressed("move_back"):
        input_dir += camera.global_transform.basis.z
    if Input.is_action_pressed("turn_left"):
        rotate(camera.global_transform.basis.y, .015)
    if Input.is_action_pressed("turn_right"):
        rotate(camera.global_transform.basis.y, -.015)
    input_dir = input_dir.normalized()
    return input_dir
	
func get_speed(): 
	var speed_time = 0
	if Input.is_action_pressed("move_forward"):
		speed_time += 0
	if Input.is_action_just_released("move_forward"):
		speed_time = 0
	speed_time = min(speed_time, 4)
	speed_time = max(0, speed_time)
	return speed_time

func _physics_process(delta):
    velocity.y += gravity * delta
    var desired_velocity = (get_input() * max_speed)
    max_speed += get_speed()

    velocity.x = (desired_velocity.x)
    velocity.z = desired_velocity.z
    velocity = move_and_slide(velocity, Vector3.UP, true)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
