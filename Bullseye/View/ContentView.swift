//
//  ContentView.swift
//  Bullseye
//
//  Created by Vo Thi Hong Diem on 7/4/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var alertIsVisible : Bool = false
    @State private var sliderValue : Double = 15.0
    @State private var game : Game = Game()
    
    var body: some View {
        VStack {
            VStack {
                Text("🎯🎯🎯\nPUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
                    .bold()
                    .kerning(2)//letter space
                    .multilineTextAlignment(.center)
                    .lineSpacing(2)
                    .font(.footnote)//size chữ
                Text(String(game.target))
                    .font(.largeTitle)
                    .fontWeight(.black)
            }
            HStack{
                Text("1").bold()
                Slider(value: self.$sliderValue
                       ,in: 1.0...100.0)
                Text("100").bold()
            }
            Button(action: {
                print("Hello there")
                self.alertIsVisible = true
            }) {
                Text("Hit me")
            }.alert(isPresented: $alertIsVisible, content: {
                let roundedValue : Int = Int(self.sliderValue.rounded())
                return Alert(title: Text("Hello There!"), message: Text("Hi, your Slider value is \(self.sliderValue). Rounded value is \(roundedValue).\n Your target is \(self.game.target). Your point is \(self.game.points(sliderValue: roundedValue))"), dismissButton: .default(Text("Close")))
            })
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.sizeCategory, .extraExtraExtraLarge)
        ContentView().previewLayout(.fixed(width: 568, height: 320))
    }
}
