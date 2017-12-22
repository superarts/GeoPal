import UIKit

protocol MapSearchManager {
	typealias PlaceClosure = ((PlaceEntity) -> Void)

	var selectClosure: PlaceClosure? { get set }

	init(tableView: UITableView)
	func reload(places: [PlaceEntity])
}
