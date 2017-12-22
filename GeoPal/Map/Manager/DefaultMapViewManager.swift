import MapKit

class DefaultMapViewManager: MapViewManager {
	var mapView: MKMapView

	private let regionPadding: CGFloat = 50

	required init(mapView aMapView: MKMapView) {
		mapView = aMapView
	}

	public func addAnnotation(_ annotation: SimpleAnnotation) {
		mapView.addAnnotation(annotation)
		zoomMapFitAnnotations()
	}
	public func removeAllAnnotations() {
		mapView.removeAnnotations(mapView.annotations)
	}

	private func zoomMapFitAnnotations() {
        var zoomRect = MKMapRectNull
        for annotation in mapView.annotations {
            let annotationPoint = MKMapPointForCoordinate(annotation.coordinate)
            let pointRect = MKMapRectMake(annotationPoint.x, annotationPoint.y, 0, 0)

            if (MKMapRectIsNull(zoomRect)) {
                zoomRect = pointRect
            } else {
                zoomRect = MKMapRectUnion(zoomRect, pointRect)
            }
        }
        mapView.setVisibleMapRect(zoomRect, edgePadding: UIEdgeInsetsMake(regionPadding, regionPadding, regionPadding, regionPadding), animated: true)
    }
}
