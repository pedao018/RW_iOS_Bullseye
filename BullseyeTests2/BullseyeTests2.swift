//
//  BullseyeTests2.swift
//  BullseyeTests2
//
//  Created by Vo Thi Hong Diem on 7/5/21.
//

import XCTest
@testable import Bullseye
class BullseyeTests2: XCTestCase {
    
    var game : Game!
    override func setUpWithError() throws {
        game = Game()
    }
    
    override func tearDownWithError() throws {
        game = nil
    }
    
    func testExample() throws {
        XCTAssertEqual(game.points(sliderValue: 50), 99)
    }
}
