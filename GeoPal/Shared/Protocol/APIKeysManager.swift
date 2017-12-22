protocol APIKeysManager {
	static var shared: APIKeysManager { get }

	var googlePlacesKey: String { get }
}