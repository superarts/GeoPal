import MapKit

class SimpleAnnotation: NSObject, MKAnnotation {
	dynamic var coordinate: CLLocationCoordinate2D
	dynamic var title: String?
	dynamic var subtitle: String?

	init(coordinate: CLLocationCoordinate2D) {
		self.coordinate = coordinate
		super.init()
	}
}