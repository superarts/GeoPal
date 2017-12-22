import GooglePlaces

class GooglePlacesManager: NSObject, PlaceManager, RequiresAPIKeys {
	public static var shared: PlaceManager = GooglePlacesManager()

	open var autocompleteClosure: PlacesErrorClosure?
	open var lookupClosure: AnnotationErrorClosure?
	open var fetcher: GMSAutocompleteFetcher!

	override init() {
		super.init()
		setupFetcher()
	}
	private func setupFetcher() {
		let key = apiKeysManager.googlePlacesKey
		GMSPlacesClient.provideAPIKey(key)
		fetcher = GMSAutocompleteFetcher(bounds: nil, filter: nil)
		fetcher.delegate = self
	}

	public func setup(autocompleteClosure: PlacesErrorClosure?, lookupClosure: AnnotationErrorClosure?) {
		self.autocompleteClosure = autocompleteClosure
		self.lookupClosure = lookupClosure
	}
	public func autocompleteQuery(keywords: String) {
		fetcher.sourceTextHasChanged(keywords)
	}
	public func lookup(id: String) {
		GMSPlacesClient.shared().lookUpPlaceID(id, callback: { place, error in
			if let place = place {
				let annotation = SimpleAnnotation(coordinate: place.coordinate)
				annotation.title = place.name
				annotation.subtitle = place.formattedAddress
				self.lookupClosure?(annotation, error)
			} else {
				self.lookupClosure?(nil, error)
			}
		})
	}
}
