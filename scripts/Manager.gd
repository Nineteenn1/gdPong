extends Area2D

var scoreP1 = 0
var scoreP2 = 0

var time_wait = 2

func _on_body_entered(body) -> void:
	if body.has_meta("is_ball"):
		scoreP1 += 1
		get_parent().get_node("Score/LeftScore").text = str(scoreP1)
		get_parent().get_node("Score2").play()
		
		if scoreP1 == 10:
			get_tree().reload_current_scene()
			body._ready()
		else:
			# done to keep the score
			# 980, 44 - initial position
			body.position = Vector2(980, 44)
			body._ready()

func _on_body_entered_2(body) -> void:
	if body.has_meta("is_ball"):
		scoreP2 += 1
		get_parent().get_node("Score/RightScore").text = str(scoreP2)
		get_parent().get_node("Score2").play()
		
		if scoreP2 == 10:
			get_tree().reload_current_scene()
			body._ready()
		else:
			# done to keep the score
			# 980, 44 - initial position
			body.position = Vector2(980, 44)
			body._ready()

