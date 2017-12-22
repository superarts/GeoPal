/**
 * Google Places API key limit: 1000.
 * Use BackupSandboxAPIKeysManager if daily limit exceeds.
 */
class SandboxAPIKeysManager: APIKeysManager {
	public static var shared: APIKeysManager = SandboxAPIKeysManager()

	let googlePlacesKey = "AIzaSyBhi7ncsLUIs3CzHgmMMWt0GHF3-xVULOk"
}