extends Control

func _process(_delta):
	if not self.visible:
		$username.text = GlobalVar.username
