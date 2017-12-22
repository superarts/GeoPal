extension RequiresDependency {
	var dependencyManager: DependencyManager {
		// Dependency of DependencyManagers is managed manually here
		return ManualDependencyManager.shared
	}
}