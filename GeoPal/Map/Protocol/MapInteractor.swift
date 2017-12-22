import UIKit
import MapKit

protocol MapInteractor {
	var presenter: MapPresenter { get }
	/**
	 * When one more places are fetched from PlaceManager
	 */
	var autocompleteClosure: PlaceManager.PlacesErrorClosure? { get set }
	/**
	 * When a place is selected in SearchTableView
	 */
	var selectClosure: MapSearchManager.PlaceClosure? { get set }

	/**
	 * In this project, we go with typical VIPER approach, i.e. Managers
	 * (DataStore) are connected with interactors. This is debatable since UIKit
	 * classes will be handled by interactor. Need more discussion here.
	 */
	init(presenter: MapPresenter, searchTableView: UITableView, mapView: MKMapView) 
	func autocompleteQuery(keywords: String)
}
