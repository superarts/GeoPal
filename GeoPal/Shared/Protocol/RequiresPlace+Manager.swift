extension RequiresPlace {
	var placeManager: PlaceManager {
		return dependencyManager.placeManager()
	}
}