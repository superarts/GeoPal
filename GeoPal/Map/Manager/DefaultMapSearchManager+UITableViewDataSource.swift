import UIKit

/**
 * UITableViewDataSource
 */
extension DefaultMapSearchManager {

	open func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return places.count
	}
	open func tableView(_ tableView: UITableView, cellForRowAt path: IndexPath) -> UITableViewCell {
		let place = places[path.row]
		let cell = tableView.dequeueReusableCell(withIdentifier: cid)!
		cell.textLabel?.attributedText = place.attributedTitle
		cell.detailTextLabel?.attributedText = place.attributedSubtitle
		return cell
	}
}
