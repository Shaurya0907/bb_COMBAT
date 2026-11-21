extends CharacterBody2D
@onready var jump_counter: Label = $"../hud/Label2"
@onready var cooldown: Label = $"../hud/cooldown"
@onready var cooldown_counter: Label = $"../hud/cooldown_counter"
@onready var cooldown_timer: Timer = $"../hud/cooldown_timer"

var speed = 50
var has_jumped = false
var jump2 = false
func _ready():
	cooldown.hide()
	cooldown_counter.hide()
	
func _process(delta: float) -> void:
	
	var direction = Input.get_axis("move_left", "move_right")
	
	if Input.is_action_pressed("move_right"):
		velocity.x = direction * speed
	elif Input.is_action_pressed("move_left"):
		velocity.x = direction * speed
	if Input.is_action_just_released("move_right") or Input.is_action_just_released("move_left"):
		velocity.x = 0
	if Input.is_action_just_pressed("jump") and not has_jumped:
		velocity.y += -100
		has_jumped = true
		jump2 = true
		
	if is_on_floor():
		has_jumped = false
	#gravity
	velocity.y += 10
	
	move_and_slide()

		
		
	if jump_counter.text == '0':
		pass
	
	if jump2 and has_jumped:
		if jump_counter.text != '0':
			jump_counter.text = str(int(jump_counter.text) - 1)
		jump2 = false



#FUNCTIONS
func _cooldown(time):
		cooldown.show()
		cooldown_counter.show()
		cooldown_timer.start()
		
		
		
		
#SIGNALS
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "player":
		velocity.y = -250
		


func _on_cooldown_timer_timeout() -> void:
	pass # Replace with function body.
