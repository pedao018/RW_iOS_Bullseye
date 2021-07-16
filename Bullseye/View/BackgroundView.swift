//
//  BackgroundView.swift
//  Bullseye
//
//  Created by Vo Thi Hong Diem on 7/12/21.
//

import SwiftUI

struct BackgroundView: View {
    @Binding var game : Game
    var body: some View {
        VStack{
            TopView(game: $game).padding(.top)
            Spacer()
            BottomView(game: $game)
        }
        .padding()
        .background(
            RingView()
        )
    }
}

struct TopView: View {
    @Binding var game : Game
    var body: some View {
        HStack{
            Button(action: {
                game.restart()
            }){
                RoundedImageViewStroked(systemName:"arrow.clockwise")
            }
            Spacer()
            RoundedImageViewFilled(systemName:"list.dash")
        }
    }
}

struct BottomView: View {
    @Binding var game : Game
    var body: some View {
        HStack{
            NumberView(title: "Score",text:String(game.score))
            Spacer()
            NumberView(title: "Round",text:String(game.round))
        }
    }
}

struct NumberView: View {
    var title: String
    var text: String
    var body: some View {
        VStack(spacing: 0){
            LabelTextView(text: title)
            RoundedRectTextView(text: text)
        }
    }
}

struct RingView : View{
    @Environment(\.colorScheme) var colorScheme
    var body: some View{
        ZStack{
            ForEach(0..<6){ring in
                let size = CGFloat(135 * ring)
                let opacicty = colorScheme == .dark ? 0.1 : 0.3
                let radialGradient = RadialGradient(gradient: Gradient(colors: [Color("RingsColor").opacity(0.8), Color("RingsColor").opacity(opacicty)]), center: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, startRadius: 100, endRadius: 300)
                Circle()
                    .stroke(lineWidth: 20.0)
                    .fill(radialGradient)
                    .frame(width: size, height: size)
            }
        }.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct BackgroundView_Previews: PreviewProvider {
    
    static var previews: some View {
        BackgroundView(game: .constant(Game()))//.constant tạo tạm 1 instance của biến Game để preview
        BackgroundView(game: .constant(Game()))
            .preferredColorScheme(.dark)
    }
}
