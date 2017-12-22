import UISearchBar_Blocks

/**
 * SearchBar
 */
extension DefaultMapPresenter {
	open func setupSearchBar() {
		controller.searchBar.searchBarTextDidChangeBlock = { searchBar, text in
			if let text = text {
				self.interactor.autocompleteQuery(keywords: text) 
			}
		}
		controller.searchBar.searchBarCancelButtonClickedBlock = { searchBar in
			self.hideSearch(animated: true)
		}
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
