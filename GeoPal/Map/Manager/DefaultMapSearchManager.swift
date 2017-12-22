import UIKit

class DefaultMapSearchManager: NSObject, MapSearchManager, UITableViewDataSource, UITableViewDelegate {
	var selectClosure: PlaceClosure?

	open let cid = "MapSearchTableViewCell"
	open var tableView: UITableView
	open var places = [PlaceEntity]()

	required init(tableView aTableView: UITableView) {
		tableView = aTableView
		super.init()

		tableView.delegate = self
		tableView.dataSource = self
	}
	func reload(places newPlaces: [PlaceEntity]) {
		places = newPlaces
		tableView.reloadData()
	}
}
