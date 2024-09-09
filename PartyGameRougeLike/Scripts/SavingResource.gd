class_name SavingResource extends Resource

const savePath = "user://SaveData.res"
@export var HiScore : int

func saveData() -> void:
	var results = ResourceSaver.save(self, savePath)
	assert(results == OK, "HiScore")
	print(results == OK)

static func loadData() -> SavingResource:
	var save : SavingResource
	if ResourceLoader.exists(savePath):
		save = ResourceLoader.load(savePath)
	return save as SavingResource
