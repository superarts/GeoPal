import UIKit

protocol ContactPresenter {
}

class ContactViewController: UIViewController {
	@IBOutlet var contactTableView: UITableView!

	var presenter: ContactPresenter!

	override func viewDidLoad() {
		super.viewDidLoad()
	}
}
