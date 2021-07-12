//
//  TextViews.swift
//  Bullseye
//
//  Created by Vo Thi Hong Diem on 7/9/21.
//

import SwiftUI

struct InstructionText: View {
    var text : String
    
    var body: some View {
        Text(text)
            .foregroundColor(Color("TextColor"))
            .bold()
            .kerning(2)//letter space
            .multilineTextAlignment(.center)
            .lineSpacing(2)
            .font(.footnote)//size chữ
    }
}

struct BigNumberText : View{
    var text : String
    
    var body: some View {
        Text(String(text))
            .foregroundColor(Color("TextColor")).font(.largeTitle)
            .fontWeight(.black)
    }
}

struct MyTextView : View{
    var text : String
    var body: some View{
        Text(text).bold()
    }
}

struct LabelTextView : View{
    var text : String
    var body: some View{
        Text(text.uppercased())
            .font(.caption)
            .foregroundColor(Color("TextColor"))
            .tracking(2.0)
            .bold()
    }
}

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            InstructionText(text: "haha")
            BigNumberText(text: "99")
            LabelTextView(text: "Score")
        }
    }
}
