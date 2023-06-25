extends CharacterBody2D


const SPEED = 320.0

var direction = 0

var isP1 = false
	
func _ready() -> void:
	isP1 = get_meta("is_p1")

func _physics_process(delta) -> void:

	if isP1:
		direction = Input.get_axis("p1_mv_up", "p1_mv_down")
	if !isP1:
		direction = Input.get_axis("p2_mv_up", "p2_mv_down")
		
		
	if direction:
		velocity.y = direction * delta * SPEED * 100
	else:
		velocity.y = move_toward(velocity.x, 0, SPEED)

	move_and_collide(velocity * delta)

