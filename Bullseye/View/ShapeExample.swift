//
//  ShapeExample.swift
//  Bullseye
//
//  Created by Vo Thi Hong Diem on 7/12/21.
//

import SwiftUI

struct ShapeExample: View {
    var body: some View {
        VStack{
            Circle()
                .inset(by: 10)
                .stroke(lineWidth: 20.0)
                .fill(Color.blue)
                .background(Color.red)
                .frame(width: 300, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
            Circle()
                .strokeBorder(Color.white,lineWidth: 10)
                .background(Color.red)
                .frame(width: 300, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
            Ellipse()
                .fill(Color.blue)
                .background(Color.red)
                .frame(width: 300, height: 50)
            Rectangle()
                .fill(Color.blue)
                .background(Color.red)
                .frame(width: 300, height: 50)
            RoundedRectangle(cornerRadius: 40)
                .fill(Color.blue)
                .background(Color.red)
                .frame(width: 300, height: 50)
            Capsule()
                .fill(Color.blue)
                .background(Color.red)
                .frame(width: 300, height: 50)
        }.background(Color.green)
    }
}

struct ShapeExample_Previews: PreviewProvider {
    static var previews: some View {
        ShapeExample()
    }
}
