//
//  WeatherTests.swift
//  WeatherTests
//
//  Created by Allen Gilliam on 13/5/22.
//

import XCTest
@testable import Weather

class WeatherTests: XCTestCase {
    
    var viewModel: WeatherViewModel?
    
    override func setUp() async throws {
        viewModel = WeatherViewModel(service: FakeWeatherService())
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCurrentTemperature_AfterFetching_ShouldMatchFakeValues() throws {
        XCTAssertEqual(viewModel?.currentTemperature.value, "26.0 F")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
