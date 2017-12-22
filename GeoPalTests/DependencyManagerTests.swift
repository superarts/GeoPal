import XCTest
@testable import GeoPal

import MapKit

class DependencyManagerTests: XCTestCase, RequiresDependency {
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

	func testSharedDependency() {
		XCTAssertNotNil(dependencyManager.apiKeysManager(), "DependencyManager should not throw exception")
		XCTAssertNotNil(dependencyManager.placeManager(), "DependencyManager should not throw exception")
	}

	func testMapDependency() {
		let controller = UIStoryboard(name: "Test", bundle: nil).instantiateViewController(withIdentifier: "MapViewController") as! MapViewController
		controller.loadView()
		let presenter = dependencyManager.mapPresenter(controller: controller)
		let interactor = dependencyManager.mapInteractor(presenter: presenter, searchTableView: controller.searchTableView, mapView: controller.mapView)

		XCTAssertNotNil(presenter, "DependencyManager should not throw exception")
		XCTAssertNotNil(interactor, "DependencyManager should not throw exception")
		XCTAssertNotNil(dependencyManager.mapSearchManager(tableView: controller.searchTableView), "DependencyManager should not throw exception")
		XCTAssertNotNil(dependencyManager.mapViewManager(mapView: controller.mapView), "DependencyManager should not throw exception")
	}
}