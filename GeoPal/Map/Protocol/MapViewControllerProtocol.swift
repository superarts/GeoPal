import UIKit
import MapKit

protocol MapViewControllerProtocol {
	var view: UIView! { get }
	var searchBar: UISearchBar! { get }
	var mapView: MKMapView! { get }
	var searchTableView: UITableView! { get }
	var searchTableViewHeightConstraint: NSLayoutConstraint! { get }
}
