import UIKit
import MapKit

class DefaultMapInteractor: MapInteractor, RequiresDependency, RequiresPlace {
	public var presenter: MapPresenter
	public var autocompleteClosure: PlaceManager.PlacesErrorClosure?
	public var selectClosure: MapSearchManager.PlaceClosure?

	private var mapSearchManager: MapSearchManager!
	private var mapViewManager: MapViewManager!

	required init(presenter: MapPresenter, searchTableView: UITableView, mapView: MKMapView) {
		self.presenter = presenter
		setupMapViewManager(mapView: mapView)
		setupSearchManager(tableView: searchTableView)
		setupPlaceManager()
	}
	private func setupMapViewManager(mapView: MKMapView) {
		mapViewManager = dependencyManager.mapViewManager(mapView: mapView)
	}
	private func setupSearchManager(tableView: UITableView) {
		mapSearchManager = dependencyManager.mapSearchManager(tableView: tableView)
		mapSearchManager.selectClosure = { place in
			if let pid = place.id {
				self.placeManager.lookup(id: pid)
			} else {
				print("WARNING: place has no ID")
			}
			self.selectClosure?(place)
		}
	}
	private func setupPlaceManager() {
		placeManager.setup(autocompleteClosure: { places, error in
			if let places = places {
				self.mapSearchManager.reload(places: places)
			}
			self.autocompleteClosure?(places, error)
		}, lookupClosure: { annotation, error in
			if let annotation = annotation {
				self.mapViewManager.removeAllAnnotations()
				self.mapViewManager.addAnnotation(annotation)
			} else if let error = error {
				self.presenter.showError(error)
			}
			self.presenter.dismissKeyboard()
		})
	}

	func autocompleteQuery(keywords: String) {
		placeManager.autocompleteQuery(keywords: keywords) 
	}
}
