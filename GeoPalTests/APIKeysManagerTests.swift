import XCTest
@testable import GeoPal

class APIKeysManagerTests: XCTestCase, RequiresAPIKeys {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testGooglePlacesKey() {
		XCTAssertTrue(apiKeysManager.googlePlacesKey.count > 0, "GooglePlaces key should not be empty")
    }
}