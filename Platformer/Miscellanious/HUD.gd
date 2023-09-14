extends CanvasLayer

var coins = 0
var health = 0
func _ready():
	$Coins.text = str(coins)
	$Hearts.text = str(health)
# Called every frame. 'delta' is the elapsed time since the previous frame.


func _on_player_coin_collected():
	coins = coins + 1
	_ready()
