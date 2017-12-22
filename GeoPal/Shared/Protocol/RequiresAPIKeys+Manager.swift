extension RequiresAPIKeys {
	var apiKeysManager: APIKeysManager {
		return dependencyManager.apiKeysManager()
	}
}