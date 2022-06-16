//
//  ButtonView.swift
//  ReversePolishNotationCalculator
//
//  Created by Ohara Yoji on 2022/01/11.
//

import SwiftUI

struct ButtonView: View {
    
    @State var inputArray: [String] = []
    
    var body: some View {
        Button(action: {self.inputArray.append("+")}) {
            Text("+")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(.white)
        }
        .frame(width: 70, height: 70)
        .background(.black)
        .padding(10)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}
