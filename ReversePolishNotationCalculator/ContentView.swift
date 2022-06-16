//
//  ContentView.swift
//  ReversePolishNotationCalculator
//
//  Created by Ohara Yoji on 2022/01/09.
//

import SwiftUI

struct ContentView: View {
    @State var inputArray: [String] = []
    @State var tf: Bool = false
    
    var answer: String {
        if let ans = rpn(inputArray) {
            return String(ans)
        } else {
            return String("Error")
        }
    }
    var body: some View {
        VStack(spacing: 0) {
            Text("ReversePolishNotation Calculator")
                .foregroundColor(.gray)
                .padding()
            Text(arrayToString(inputArray))
                .fontWeight(.medium)
                .frame(width: 340, height: 25, alignment: .trailing)
            Text(answer)
                .font(.largeTitle)
                .fontWeight(.black)
                .frame(width: 340, height: 50, alignment: .trailing)
            
            
            HStack(spacing: 0) {
                numpad(array: $inputArray, num_ope: "+")
                numpad(array: $inputArray, num_ope: "-")
                numpad(array: $inputArray, num_ope: "*")
                numpad(array: $inputArray, num_ope: "/")
            }
            
            HStack(spacing: 0) {
                // num pad
                VStack(spacing: 0) {
                    HStack(spacing: 0) {
                        numpad(array: $inputArray, num_ope: "7")
                        numpad(array: $inputArray, num_ope: "8")
                        numpad(array: $inputArray, num_ope: "9")
                    }
                    
                    HStack(spacing: 0) {
                        numpad(array: $inputArray, num_ope: "4")
                        numpad(array: $inputArray, num_ope: "5")
                        numpad(array: $inputArray, num_ope: "6")
                    }
                    
                    HStack(spacing: 0) {
                        numpad(array: $inputArray, num_ope: "1")
                        numpad(array: $inputArray, num_ope: "2")
                        numpad(array: $inputArray, num_ope: "3")
                    }
                    
                    HStack(spacing: 0) {
                        Button(action: {inputArray.append("0")}) {
                            Text("0")
                                .font(.title)
                                .fontWeight(.heavy)
                                .foregroundColor(.black)
                                .frame(width: 250, height: 70)
                        }
                        .frame(width: 250, height: 70)
                        .padding(10)
                    }
                }
                
                // EnterとAC
                VStack(spacing: 0){
                    Button(action: {
                        tf = true
                        print(inputArray)
                    }) {
                        Text("=")
                            .font(.title)
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                            .frame(width: 70, height: 250)
                    }
                    .frame(width: 70, height: 250)
                    .padding(10)
                    
                    Button(action: {
                        inputArray.removeAll()
                        tf = false
                    }) {
                        Text("AC")
                            .font(.title)
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                            .frame(width: 70, height: 70)
                    }
                    .frame(width: 70, height: 70)
                    .padding(10)
                }
            }
        }
    }
}

struct numpad: View {
    @Binding var array: [String]
    var num_ope: String
    
    var body: some View {
        Button(action: {array.append(num_ope)}) {
            Text(num_ope)
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(.black)
                .frame(width: 70, height: 70)
        }
        .frame(width: 70, height: 70)
        .padding(10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}







