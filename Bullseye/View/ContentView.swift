//
//  ContentView.swift
//  Bullseye
//
//  Created by Vo Thi Hong Diem on 7/4/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var alertIsVisible : Bool = false
    @State private var sliderValue : Double = 50.0
    @State private var game : Game = Game()
    
    var body: some View {
        ZStack {
            BackgroundView(game: $game)
            VStack {
                InstructionsView(game: $game)
                    .padding(.bottom,100)
                ButtonView(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game)
            }
            VStack{
                SliderView(sliderValue: self.$sliderValue)
            }
        }
    }
}

struct InstructionsView : View{
    @Binding var game : Game
    var body : some View {
        VStack {
            InstructionText(text: "🎯🎯🎯\nPUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
            BigNumberText(text: String(game.target))
        }
    }
}

struct SliderView : View{
    @Binding var sliderValue : Double
    var body: some View{
        HStack{
            MyTextView(text: "1").frame(width: 45)
            Slider(value: $sliderValue
                   ,in: 1.0...100.0)
            MyTextView(text: "100").frame(width: 45)
        }.padding()
    }
}

struct ButtonView : View{
    @Binding var alertIsVisible: Bool
    @Binding var sliderValue : Double
    @Binding var game : Game
    
    var body: some View{
        Button(action: {
            print("Hello there")
            alertIsVisible = true
        }) {
            MyTextView(text: "Hit me".uppercased())
        }
        .padding(15)
        .background(
            ZStack {
                Color("ButtonColor")
                LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3),Color.clear]), startPoint: .top, endPoint: .bottom)
            }
        )
        .foregroundColor(Color.white)
        .cornerRadius(25.0)
        .overlay(
            RoundedRectangle(cornerRadius: 25.0)
                .strokeBorder(Color("TextColor"),lineWidth: 1.5)
        )
        .alert(isPresented: $alertIsVisible, content: {
            let roundedValue : Int = Int(self.sliderValue.rounded())
            let points = game.points(sliderValue: roundedValue)
            return Alert(title: Text("Hello There!"), message: Text("Hi, your Slider value is \(sliderValue). Rounded value is \(roundedValue).\n Your target is \(game.target). Your point is \(points)"), dismissButton: .default(Text("Close Awesome")){
                game.startNewRound(points: points)
            })
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .environment(\.sizeCategory, .extraExtraExtraLarge)
            ContentView()
                .preferredColorScheme(.dark)
                .environment(\.sizeCategory, .extraExtraExtraLarge)
        }
        ContentView().previewLayout(.fixed(width: 568, height: 320))
    }
}
