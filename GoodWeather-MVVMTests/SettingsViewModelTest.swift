//
//  SettingsViewModelTest.swift
//  GoodWeather-MVVMTests
//
//  Created by Yurii Sameliuk on 02/02/2021.
//

import XCTest
@testable import GoodWeather_MVVM

class SettingsViewModelTest: XCTestCase {
    private var settingsVM: SettingsViewModel!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        self.settingsVM = SettingsViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        let userDefaults = UserDefaults.standard
        userDefaults.removeObject(forKey: "unit")
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func test_should_return_correct_display_name_for_celsius() {
        XCTAssertEqual(self.settingsVM.selectedUnit.displayName, "Celsius")
    }
    
    func test_should_make_sure_that_default_selected_unit_is_celsius() {
        XCTAssertEqual(settingsVM.selectedUnit, .celsius)
    }
    
    func test_should_be_able_to_save_user_unit_selection() {
        
        self.settingsVM.selectedUnit = .fahrenheit
        let userDefaults = UserDefaults.standard
        XCTAssertNotNil(userDefaults.value(forKey: "unit"))
        
    }
}
