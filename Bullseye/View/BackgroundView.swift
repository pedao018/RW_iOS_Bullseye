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
            TopView().padding(.top)
            Spacer()
            BottomView(game: $game)
        }
        .padding()
        .background(Color("BackgroundColor"))
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/) //Tô màu luôn cả thanh trạng thái iphone
    }
}

struct TopView: View {
    var body: some View {
        HStack{
            RoundedImageViewStroked(systemName:"arrow.clockwise")
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

struct BackgroundView_Previews: PreviewProvider {
    
    static var previews: some View {
        BackgroundView(game: .constant(Game()))//.constant tạo tạm 1 instance của biến Game để preview
        BackgroundView(game: .constant(Game()))
            .preferredColorScheme(.dark)
    }
}
