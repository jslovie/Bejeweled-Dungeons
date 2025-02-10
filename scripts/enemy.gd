class_name Enemy
extends CharacterBody2D

enum {alive, dead}
var state
var status = "alive"


var type = "Spider"
var health = 20
var health_increase = 5
var max_health = 20
var shield = 5
var shield_increase = 3
var damage : Vector2
var coin_worth = 5
var action_delay : Vector2
var blood_type


@onready var time = $ActionTimer

func _ready():
	stat_check()
	state = alive
	EnemyManager.enemy = self
	change_delay()
	%ActionTimer.start()
	%EnemyHitLabel.visible = false
	
func _process(_delta):
	%Label.text = str(time.time_left)
	if status == "dead":
		%ActionTimer.stop()

	
func stat_check():
	type = EnemyManager.type
	health = EnemyManager.health
	health_increase = EnemyManager.health_increase
	max_health = EnemyManager.max_health
	shield = EnemyManager.shield
	shield_increase = EnemyManager.shield_increase
	damage = EnemyManager.damage
	coin_worth = EnemyManager.coin_worth
	action_delay = EnemyManager.action_delay
	blood_type = EnemyManager.blood_type
	Type_check()
	
func Type_check():
	if type == "Skeleton":
		var skeleton_texture = load("res://assets/32rogues/enem/skeleton.png")
		%EnemyType.texture = skeleton_texture
	elif type == "Spider":
		var spider_texture = load("res://assets/32rogues/enem/spider.png")
		%EnemyType.texture = spider_texture
	elif type == "SkeletonArcher":
		var skeleton_archer_texture = load("res://assets/32rogues/enem/skeleton_archer.png")
		%EnemyType.texture = skeleton_archer_texture
	elif type == "SkeletonMage":
		var skeleton_mage_texture = load("res://assets/32rogues/enem/skeleton_mage.png")
		%EnemyType.texture = skeleton_mage_texture
	elif type == "Hag":
		var hag_texture = load("res://assets/32rogues/enem/hag.png")
		%EnemyType.texture = hag_texture
	elif type == "Rat":
		var rat_texture = load("res://assets/32rogues/enem/rat.png")
		%EnemyType.texture = rat_texture
	elif type == "Zombie":
		var zombie_texture = load("res://assets/32rogues/enem/zombie.png")
		%EnemyType.texture = zombie_texture
	elif type == "Ghost":
		var ghost_texture = load("res://assets/32rogues/enem/ghost.png")
		%EnemyType.texture = ghost_texture
	elif type == "Ghost Warrior":
		var ghost_warrior_texture = load("res://assets/32rogues/enem/ghost_warrior.png")
		%EnemyType.texture = ghost_warrior_texture
	elif type == "Ghoul":
		var ghoul_texture = load("res://assets/32rogues/enem/ghoul.png")
		%EnemyType.texture = ghoul_texture
	elif type == "Demon Boss":
		var demon_boss_texture = load("res://assets/32rogues/enem/demon_boss.png")
		%EnemyType.texture = demon_boss_texture
	elif type == "Devil Boss":
		var devil_boss_texture = load("res://assets/32rogues/enem/devil_boss.png")
		%EnemyType.texture = devil_boss_texture
	elif type == "Dragon Boss":
		var dragon_boss_texture = load("res://assets/32rogues/enem/dragon_boss.png")
		%EnemyType.texture = dragon_boss_texture
	elif type == "Wolf":
		var wolf_texture = load("res://assets/32rogues/enem/wolf.png")
		%EnemyType.texture = wolf_texture
	elif type == "Lamprey":
		var lamprey_texture = load("res://assets/32rogues/enem/lamprey.png")
		%EnemyType.texture = lamprey_texture
	elif type == "Crone":
		var crone_texture = load("res://assets/32rogues/enem/crone.png")
		%EnemyType.texture = crone_texture
	elif type == "Ratten":
		var ratten_texture = load("res://assets/32rogues/enem/ratten.png")
		%EnemyType.texture = ratten_texture
	elif type == "Rattena":
		var rattena_texture = load("res://assets/32rogues/enem/rattena.png")
		%EnemyType.texture = rattena_texture
	elif type == "Shroom":
		var shroom_texture = load("res://assets/32rogues/enem/shroom.png")
		%EnemyType.texture = shroom_texture
	elif type == "Gnome":
		var gnome_texture = load("res://assets/32rogues/enem/gnome.png")
		%EnemyType.texture = gnome_texture
	elif type == "Warewolf":
		var warewolf_texture = load("res://assets/32rogues/enem/warewolf.png")
		%EnemyType.texture = warewolf_texture
	elif type == "Gator":
		var gator_texture = load("res://assets/32rogues/enem/gator.png")
		%EnemyType.texture = gator_texture
	elif type == "Medusa":
		var medusa_texture = load("res://assets/32rogues/enem/medusa.png")
		%EnemyType.texture = medusa_texture
	elif type == "Minotaur":
		var minotaur_texture = load("res://assets/32rogues/enem/minotaur.png")
		%EnemyType.texture = minotaur_texture
	elif type == "Leshen":
		var leshen_texture = load("res://assets/32rogues/enem/leshen.png")
		%EnemyType.texture = leshen_texture
	elif type == "Priest":
		var priest_texture = load("res://assets/32rogues/enem/priest.png")
		%EnemyType.texture = priest_texture
	elif type == "Mystic":
		var mystic_texture = load("res://assets/32rogues/enem/mystic.png")
		%EnemyType.texture = mystic_texture
	elif type == "Sly":
		var sly_texture = load("res://assets/32rogues/enem/sly.png")
		%EnemyType.texture = sly_texture
	elif type == "Mystery":
		var mystery_texture = load("res://assets/32rogues/enem/mystery.png")
		%EnemyType.texture = mystery_texture
	elif type == "Wraith":
		var wraith_texture = load("res://assets/32rogues/enem/wraith.png")
		%EnemyType.texture = wraith_texture
	elif type == "Basilisk":
		var basilisk_texture = load("res://assets/32rogues/enem/basilisk.png")
		%EnemyType.texture = basilisk_texture
	elif type == "Formicidae":
		var formicidae_texture = load("res://assets/32rogues/enem/formicidae.png")
		%EnemyType.texture = formicidae_texture
	elif type == "Divine":
		var divine_texture = load("res://assets/32rogues/enem/divine.png")
		%EnemyType.texture = divine_texture
	elif type == "Centipeda":
		var centipeda_texture = load("res://assets/32rogues/enem/centipeda.png")
		%EnemyType.texture = centipeda_texture
	elif type == "Nemean":
		var nemean_texture = load("res://assets/32rogues/enem/nemean.png")
		%EnemyType.texture = nemean_texture
	elif type == "Torment":
		var torment_texture = load("res://assets/32rogues/enem/torment.png")
		%EnemyType.texture = torment_texture
	elif type == "Haidomyrmecinae":
		var haidomyrmecinae_texture = load("res://assets/32rogues/enem/haidomyrmecinae.png")
		%EnemyType.texture = haidomyrmecinae_texture
	elif type == "Angel":
		var angel_texture = load("res://assets/32rogues/enem/angel.png")
		%EnemyType.texture = angel_texture
	elif type == "Microchaetus":
		var microchaetus_texture = load("res://assets/32rogues/enem/microchaetus.png")
		%EnemyType.texture = microchaetus_texture
	elif type == "Torment Us":
		var torment_us_texture = load("res://assets/32rogues/enem/torment_us.png")
		%EnemyType.texture = torment_us_texture
		
func change_delay():
	@warning_ignore("narrowing_conversion")
	var random_delay = randi_range(action_delay.x, action_delay.y)
	%ActionTimer.wait_time = random_delay
	print("Action delay is: " + str(random_delay))
	
func random_action():
	var random = Random.get_rng()
		
	if random == "attack":
		inflict_damage()
		%SwordPiece.visible = true
		await get_tree().create_timer(2.0).timeout
		%SwordPiece.visible = false
			
	if random == "shield":
		shield_up()
		%ShieldPiece.visible = true
		await get_tree().create_timer(2.0).timeout
		%ShieldPiece.visible = false
			
	if random == "heal":
		heal()
		%HealPiece.visible = true
		await get_tree().create_timer(2.0).timeout
		%HealPiece.visible = false
	
	change_delay()
	
func inflict_damage():
	@warning_ignore("narrowing_conversion")
	var random_damage = randi_range(damage.x,damage.y)
	PlayerManager.player.receive_damage(random_damage)

func shield_up():
	shield += shield_increase

func heal():
	health += health_increase
	if health >= max_health:
		health = max_health

@warning_ignore("shadowed_variable")
func take_damage(damage):
	if state == alive:
		#Visual knockback
		var tween_scale = create_tween()
		tween_scale.tween_property($EnemyType,"scale", Vector2(16,16), 0.1)
		tween_scale.tween_property($EnemyType,"scale", Vector2(15,15), 0.1)
		var tween_move = create_tween()
		tween_move.tween_property($EnemyType, "position", Vector2(0,-100), 0.1)
		tween_move.tween_property($EnemyType, "position", Vector2(0, 0), 0.1)
		#Visual hit
		if blood_type == "Green":
			%AnimationPlayer.play("hit_green")
		elif blood_type == "White":
			%AnimationPlayer.play("hit_white")
		elif blood_type == "Ghost":
			%AnimationPlayer.play("hit_ghost")
		elif blood_type == "Red":
			%AnimationPlayer.play("hit_red")
			
		#Logic behind getting hit
		var health_attack = 0
		for d in range(0, damage):
			if shield > 0:
				shield -= 1
			else:
				health_attack += 1
		var total_attack = health_attack * PlayerManager.player.piece_multiplier
		health -= total_attack
		
		if health <= 0:
			health = 0
			get_killed()
		
		#Visual hit number
		%EnemyHitLabel.visible = true
		var tween_hit_number = create_tween()
		%EnemyHitLabel.text = str(damage)
		tween_hit_number.tween_property(%EnemyHitLabel, "position", Vector2(116,-364),0.5)
		await get_tree().create_timer(1).timeout
		%EnemyHitLabel.position = Vector2(116,-194)
		%EnemyHitLabel.visible = false
			
			


func get_killed():
	LevelManager.level_done += 1
	print("available level is: " + str(LevelManager.available_level))
	if LevelManager.available_level == 11:
		LevelManager.floor += 1
		print("floor is " + str(LevelManager.floor))
	if LevelManager.available_level == 51:
		PlayerManager.player.player_won = true
		print("player won")
	#Shield Cap
	if PlayerManager.player.shield >  PlayerManager.player.shield_max:
		PlayerManager.player.shield =  PlayerManager.player.shield_max
	#Status change and stop for actions
	state = dead
	status = "dead"
	PlayerManager.player.get_coins(coin_worth)
	%ActionTimer.stop()
	%Actions.visible = false
	
	#Visual hit
	if blood_type == "Green":
		%AnimationPlayer.play("hit_green")
	elif blood_type == "White":
		%AnimationPlayer.play("hit_white")
	elif blood_type == "Ghost":
		%AnimationPlayer.play("hit_ghost")
	elif blood_type == "Red":
			%AnimationPlayer.play("hit_red")
			
	var tween_scale = create_tween()
	tween_scale.tween_property($EnemyType,"scale", Vector2(16,16), 0.1)
	tween_scale.tween_property($EnemyType,"scale", Vector2(15,15), 0.1)
	var tween_move = create_tween()
	tween_move.tween_property($EnemyType, "position", Vector2(800,0), 0.5)
	var tween_rotate = create_tween()
	tween_rotate.tween_property($EnemyType, "rotation", deg_to_rad(90), 0.5)
	
	#Autosave
	SaveManager.autosave()
	
	#Update player spins
	PlayerManager.player.spins_left += 1
	
	
	
	##Scene change
	#await get_tree().create_timer(3).timeout
	#get_tree().change_scene_to_file("res://scenes/dungeons/between_level.tscn")
	#LevelManager.show_map = true

func stunt(amount):
	var stunt_time = %ActionTimer.time_left + amount
	%ActionTimer.start(stunt_time)
	%Stunted.visible = true
	await  get_tree().create_timer(amount).timeout
	%Stunted.visible = false
	
func stop_action():
	%ActionTimer.stop()

func start_action():
	%ActionTimer.start()

func _on_action_timer_timeout():
	random_action()
