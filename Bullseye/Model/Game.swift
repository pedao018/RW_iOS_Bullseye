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
            let rangeValude: Int = abs(self.target - sliderValue)
            var points : Int = 100 - rangeValude
            if(rangeValude == 0){
                points += 100
            }else if(rangeValude == 5){
                points += 50
            }
            return points
        }
        
        mutating func startNewRound(points: Int){
            self.score += points
            self.round += 1
            self.target = Int.random(in: 1...100)
        }
        
        mutating func restart(){
            self.score = 0
            self.round = 1
            self.target = Int.random(in: 1...100)
        }
    }
