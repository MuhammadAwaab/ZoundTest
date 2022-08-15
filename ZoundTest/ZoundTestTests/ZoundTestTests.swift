//
//  ZoundTestTests.swift
//  ZoundTestTests
//
//  Created by Muhammad Oneeb on 15/08/2022.
//

import XCTest
@testable import ZoundTest

class ZoundTestTests: XCTestCase {

    var mockProvider: DataProviderProtocol?
    var viewModelToTest: MainViewModelProtocol?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        
        viewModelToTest?.fetchParsedDataForDisplay()
        let itemViewModel = viewModelToTest?.getCellViewModel(at: IndexPath(row: 0, section: 0))
        XCTAssertNotNil(itemViewModel)
        
        let titleText = itemViewModel?.currencyNameForDisplay()
        let descText = itemViewModel?.currencyDescForDisplay()
        
        XCTAssertTrue(titleText == "BTC")
        XCTAssertTrue(descText == "btcinr")
        
    }

    override func setUp() {
        super.setUp()
        mockProvider = MockDataProvider()
        viewModelToTest = MainViewModel(provider: mockProvider!)
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
