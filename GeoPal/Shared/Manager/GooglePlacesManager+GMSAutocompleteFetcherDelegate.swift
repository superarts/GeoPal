import GooglePlaces

extension GooglePlacesManager: GMSAutocompleteFetcherDelegate {

	func didAutocomplete(with predictions: [GMSAutocompletePrediction]) {
		var places: [PlaceEntity] = [PlaceEntity]()
		for prediction in predictions {
			let place = PlaceEntity()
			place.id = prediction.placeID
			place.attributedTitle = prediction.attributedPrimaryText
			place.attributedSubtitle = prediction.attributedSecondaryText
			places.append(place)
		}
		autocompleteClosure?(places, nil)
	}
	func didFailAutocompleteWithError(_ error: Error) {
		autocompleteClosure?(nil, error)
	}
}
