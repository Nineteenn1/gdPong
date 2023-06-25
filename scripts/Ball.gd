extends CharacterBody2D

const SPEED = 150

var direction = Vector2.ZERO
var collision = 0

var input = false

func _ready() -> void:
	direction.x = [-1, 1].pick_random()
	direction.y = [-1, 1].pick_random()

func _physics_process(delta) -> void:

	if direction:
		velocity.x = direction.x * delta * SPEED * 100
		velocity.y = direction.y * delta * SPEED * 100
	else:
		velocity.y = move_toward(velocity.x, 0, SPEED)

	collision = move_and_collide(velocity * delta)
	move_and_slide()
	
	if collision:
		# - - - - - - - - - - - - - - - - - - - - - - - - - - glitch cases                                                     
		if collision.get_collider().name == "StaticBody2D" or (velocity.y > 0 and velocity.y < 10) or (velocity.y < 0 and velocity.y > -10) or velocity.y == 0:
			direction.y *= -1
		else:
			direction.x *= -1
		get_parent().get_node("Bounce").play()


func _input(event):
	if event is InputEventKey and event.pressed:
		input = true
