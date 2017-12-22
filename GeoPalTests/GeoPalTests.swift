//
//  MapViewControllerTests.swift
//  MapViewControllerTests
//
//  Created by Leo on 12/18/17.
//  Copyright © 2017 Bimo.live. All rights reserved.
//

import XCTest
@testable import GeoPal

class MapViewControllerTests: XCTestCase, RequiresDependency {
	
	var controller: MapViewController!
	var presenter: MapPresenter!
	var interactor: MapInteractor!

    override func setUp() {
        super.setUp()

		controller = UIStoryboard(name: "Test", bundle: nil).instantiateViewController(withIdentifier: "MapViewController") as! MapViewController
		controller.loadView()
		presenter = dependencyManager.mapPresenter(controller: controller)
		interactor = dependencyManager.mapInteractor(presenter: presenter, searchTableView: controller.searchTableView, mapView: controller.mapView)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testPresenter() {
		XCTAssertNoThrow(presenter.showError(NSError(domain: "GeoPal", code: -1, userInfo: nil)), "Presenter should not throw exception")
		XCTAssertNoThrow(presenter.dismissKeyboard(), "Presenter should not throw exception")
		
    }

	func testInteractor() {
		XCTAssertNoThrow(interactor.autocompleteQuery(keywords: "Central Park"), "Interactor should not throw exception")
	}
}