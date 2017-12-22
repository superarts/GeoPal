import UIKit
import MapKit

/**
 * A simple dependency manager. Consider build a `SwinjectDependencyManager` or
 * `DIPDependencyManager` for more features.
 */
class ManualDependencyManager: DependencyManager {
	public static var shared: DependencyManager = ManualDependencyManager()

	/**
	 * Shared managers
	 */
	public func apiKeysManager() -> APIKeysManager {
		return SandboxAPIKeysManager.shared
		//return BackupSandboxAPIKeysManager.shared
	}
	public func placeManager() -> PlaceManager {
		return GooglePlacesManager.shared
	}

	/**
	 * Class managers
	 */
	public func mapPresenter(controller: MapViewControllerProtocol) -> MapPresenter {
		return DefaultMapPresenter(controller: controller)
	}
	public func mapInteractor(presenter: MapPresenter, searchTableView: UITableView, mapView: MKMapView) -> MapInteractor {
		return DefaultMapInteractor(presenter: presenter, searchTableView: searchTableView, mapView: mapView)
	}
	public func mapSearchManager(tableView: UITableView) -> MapSearchManager {
		return DefaultMapSearchManager(tableView: tableView)
	}
	func mapViewManager(mapView: MKMapView) -> MapViewManager {
		return DefaultMapViewManager(mapView: mapView)
	}
}
