import MapKit

protocol MapViewManager {
	
	init(mapView aMapView: MKMapView)
	func addAnnotation(_ annotation: SimpleAnnotation)
	func removeAllAnnotations()
}
