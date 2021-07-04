//
//  Game.swift
//  Bullseye
//
//  Created by Vo Thi Hong Diem on 7/5/21.
//

import Foundation
struct Game{
    var target : Int = Int.random(in: 1...100)
    var score : Int = 0
    var round : Int = 0
    
    func points(sliderValue: Int) -> Int {
        /*let differentValue : Int = abs(self.target - sliderValue)
        let awardValue : Int = 100 - differentValue
        return awardValue */
        100 - abs(self.target - sliderValue)
    }
}
