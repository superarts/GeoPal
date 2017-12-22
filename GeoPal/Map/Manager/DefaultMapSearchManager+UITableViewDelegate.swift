import UIKit

/**
 * UITableViewDelegate
 */
extension DefaultMapSearchManager {

	open func tableView(_ tableView: UITableView, didSelectRowAt path: IndexPath) {
		selectClosure?(places[path.row])
	}
}
