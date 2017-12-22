import UIKit

class DefaultMapPresenter: MapPresenter, RequiresDependency {
	var controller: MapViewControllerProtocol!
	var interactor: MapInteractor!

	open let searchCellHeight: CGFloat = 56
	open var places = [PlaceEntity]()

	init(controller mapViewController: MapViewControllerProtocol) {
		controller = mapViewController
		interactor = dependencyManager.mapInteractor(presenter: self, searchTableView: controller.searchTableView, mapView: controller.mapView)
		interactor.autocompleteClosure = { places, error in
			if let error = error {
				self.showError(error)
			} else if let places = places, places.count > 0 {
				self.places = places
				self.showSearch(animated: true)
			} else {
				print("DefaultMapPresenter: nil results")
			}
		}
		interactor.selectClosure = { place in
			self.hideSearch(animated: true)
		}
		setupSearchBar()
		setupSearchTableView()
	}

	public func showError(_ error: Error) {
		print("TODO: display error \(error)")
	}
	public func dismissKeyboard() {
		controller.searchBar.resignFirstResponder()
	}
}
