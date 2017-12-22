import UIKit

/**
 * TODO: resolve an issue that prevents UISearchBar_Blocks to work with tests
 */
extension DefaultMapPresenter {
	open func setupSearchBar() {
	}
	open func setupSearchTableView() {
		controller.searchTableViewHeightConstraint.constant = 0
	}
	open func showSearch(animated: Bool) {
		UIView.animate(withDuration: animated ? 0.3 : 0, delay: 0, options: .curveEaseOut, animations: {
			self.controller.searchTableViewHeightConstraint.constant = self.searchCellHeight * CGFloat(self.places.count)
			self.controller.view.layoutIfNeeded()
		})
	}
	open func hideSearch(animated: Bool) {
		controller.searchBar.text = ""
		places.removeAll()
		UIView.animate(withDuration: animated ? 0.3 : 0, delay: 0, options: .curveEaseOut, animations: {
			self.controller.searchTableViewHeightConstraint.constant = 0
			self.controller.view.layoutIfNeeded()
		})
	}
}
