import UIKit

protocol HistoryPresenter {
}

class HistoryViewController: UIViewController {
	@IBOutlet var historyTableView: UITableView!

	var presenter: HistoryPresenter!

	override func viewDidLoad() {
		super.viewDidLoad()
	}
}
