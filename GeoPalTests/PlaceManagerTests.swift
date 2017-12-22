import XCTest
@testable import GeoPal

class PlaceManagerTests: XCTestCase, RequiresPlace {
    
	let autocompleteExpectation = XCTestExpectation(description: "live.bimo.geopal.test.autocomplete")
	let lookupExpectation = XCTestExpectation(description: "live.bimo.geopal.test.lookup")

    override func setUp() {
        super.setUp()
		placeManager.setup(autocompleteClosure: { places, error in
			XCTAssertNotNil(places, "Places should not be nil")
			XCTAssertTrue(places!.count > 0, "Places should not be empty")
			XCTAssertNil(error, "Autocomplete should not returns error")
			self.autocompleteExpectation.fulfill()
		}, lookupClosure: { annotation, error in
			XCTAssertNotNil(annotation, "Annotation should not be nil")

			XCTAssertNotNil(annotation!.title, "Annotation title should not be nil")
			XCTAssertTrue(annotation!.title!.count > 0, "Annotation title should not be empty")

			XCTAssertNotNil(annotation!.subtitle, "Annotation subtitle should not be nil")
			XCTAssertTrue(annotation!.subtitle!.count > 0, "Annotation subtitle should not be empty")
			XCTAssertNil(error, "Lookup should not returns error")
			self.lookupExpectation.fulfill()
		})
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testAutocomplete() {
		placeManager.autocompleteQuery(keywords: "Central Park")
		wait(for: [autocompleteExpectation], timeout: 20.0)
    }
    
    func testLookup() {
		placeManager.lookup(id: "ChIJ4zGFAZpYwokRGUGph3Mf37k")
		wait(for: [lookupExpectation], timeout: 20.0)
    }
}