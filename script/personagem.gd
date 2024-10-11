extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -300.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta: float) -> void:

	if not is_on_floor():
		velocity += get_gravity() * delta


	if Input.is_action_just_pressed("pular") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction_x := Input.get_axis("mover_esquerda", "mover_direita")
	
	if direction_x > 0:
		animated_sprite.flip_h = false
	elif direction_x < 0:
		animated_sprite.flip_h = true
	
	if direction_x == 0:
		animated_sprite.play("parado")
	else:
		animated_sprite.play("andar-horizontal")
	
	if direction_x:
		velocity.x = direction_x * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	#queria fazer um negócio tipo: se o personagem tá no mundo do metrô, ele pode ter acesso a essas funções de ir pra cima e para baixo. se não, não."	
		
	#var direction_y := Input.get_axis("mover_cima", "mover_baixo")
	
	#if direction_y > 0:
		#animated_sprite.play("andar-baixo")
	#elif direction_y < 0:
		#animated_sprite.play("andar-cima")
	#elif direction_y == 0:
		#animated_sprite.play("parado")

	#if direction_y:
		#velocity.y = direction_y * SPEED
	#else:
		#velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
