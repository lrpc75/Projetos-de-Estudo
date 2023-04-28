//
//  ContentView.swift
//  Dicee-SwiftUI
//
//  Created by Usuário on 30/03/23.
//

import SwiftUI

struct ContentView: View {
        
        @State var dadoEsquerdo = 1
        @State var dadoDireito = 1
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack {
                Image("diceeLogo")
                
                Spacer()
                
                HStack {
                    DiceView(n: dadoEsquerdo)
                    DiceView(n: dadoDireito)
                }
                .padding(.all)
                
                Spacer()
                
                Button("Roll") {
                    dadoEsquerdo = Int.random(in: 1...6)
                    dadoDireito = Int.random(in: 1...6)
                }
                .foregroundColor(.white)
                .font(.system(size:38))
                .fontWeight(.heavy)
                .background(Color . red)
                .padding(.all)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct DiceView: View {
    let n: Int
    
    var body: some View {
        Image("dice\(n)")
            .resizable()
            .aspectRatio(1, contentMode: .fit)
            .padding(.all)
    }
}
