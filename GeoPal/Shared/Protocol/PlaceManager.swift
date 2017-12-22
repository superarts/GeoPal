protocol PlaceManager {
	typealias PlacesErrorClosure = (([PlaceEntity]?, Error?) -> Void)
	typealias AnnotationErrorClosure = ((SimpleAnnotation?, Error?) -> Void)

	static var shared: PlaceManager { get }

	func setup(autocompleteClosure: PlacesErrorClosure?, lookupClosure: AnnotationErrorClosure?)
	func autocompleteQuery(keywords: String)
	func lookup(id: String)
}