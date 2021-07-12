//
//  RoundView.swift
//  Bullseye
//
//  Created by Vo Thi Hong Diem on 7/12/21.
//

import SwiftUI

struct RoundedImageViewStroked: View {
    var systemName : String
    var body: some View {
        Image(systemName: systemName)
            .font(.title) //kích thước icon
            .foregroundColor(Color("TextColor"))
            .frame(width: 56, height: 56)
            .overlay(
                Circle().strokeBorder(Color("ButtonStrokeColor"),lineWidth: 1.5)
            )
    }
}

struct RoundedImageViewFilled: View {
    var systemName : String
    var body: some View {
        Circle()
            .foregroundColor(Color("ButtonFilledBackgroundColor"))
            .frame(width: 56, height: 56)
            .overlay(
                Image(systemName: systemName)
                    .font(.title) //kích thước icon
                    .foregroundColor(Color("ButtonFilledColor"))
            )
    }
}

struct RoundedRectTextView: View {
    var text: String
    var body: some View {
        RoundedRectangle(cornerRadius: 30)
            .strokeBorder(Color("ButtonStrokeColor"),lineWidth: 2.0)
            .frame(width: 90, height: 70)
            .overlay(BigNumberText(text: text))
    }
}

struct RoundView_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            RoundedImageViewStroked(systemName:"arrow.clockwise")
            RoundedImageViewFilled(systemName:"list.dash")
            RoundedRectTextView(text: "999")
        
        }
        VStack{
            RoundedImageViewStroked(systemName:"arrow.clockwise")
            RoundedImageViewFilled(systemName:"list.dash")
            RoundedRectTextView(text: "999")
        }
        .preferredColorScheme(.dark)
    }
}
