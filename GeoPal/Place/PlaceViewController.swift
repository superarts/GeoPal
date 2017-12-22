import UIKit

protocol PlacePresenter {
}

class PlaceViewController: UIViewController {
	@IBOutlet var placeTableView: UITableView!

	var presenter: PlacePresenter!

	override func viewDidLoad() {
		super.viewDidLoad()
	}
}
