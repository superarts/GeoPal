import UIKit
import MapKit

protocol DependencyManager {
	static var shared: DependencyManager { get }

	func apiKeysManager() -> APIKeysManager
	func placeManager() -> PlaceManager
	func mapPresenter(controller: MapViewControllerProtocol) -> MapPresenter
	func mapInteractor(presenter: MapPresenter, searchTableView: UITableView, mapView: MKMapView) -> MapInteractor
	func mapSearchManager(tableView: UITableView) -> MapSearchManager
	func mapViewManager(mapView: MKMapView) -> MapViewManager
}
