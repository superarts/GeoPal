import UIKit
import MapKit

class MapViewController: UIViewController, MapViewControllerProtocol, RequiresDependency {
	@IBOutlet var searchBar: UISearchBar!
	@IBOutlet var mapView: MKMapView!
	@IBOutlet var searchTableView: UITableView!
	@IBOutlet var searchTableViewHeightConstraint: NSLayoutConstraint!

	private var presenter: MapPresenter!

	override func viewDidLoad() {
		super.viewDidLoad()
		presenter = dependencyManager.mapPresenter(controller: self)
	}
}
