//
//  ContentView.swift
//  BusinessCard
//
//  Created by Usuário on 30/03/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image("my_image")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 430, height: 200)
                .clipShape(Circle())
                .overlay(
                    Circle().stroke(.white, lineWidth: 5)
                )
            
            Text("Leandro Castro")
                .font(Font.custom("AlkatraFont", size: 35))
                .bold()
                .foregroundColor(.white)
            
            Text("iOS Developer")
                .foregroundColor(.white)
                .font(.system(size:20))
                .fontWeight(.semibold)
            
            Divider()
            
            InfoView(simbolName: "phone.fill", text: "(99) 99119-0803")
            InfoView(simbolName: "envelope.fill", text: "leandrorpcastro@gmail.com")
                
        }
        .frame(maxHeight: .infinity)
        .background(
            Color(red: 0.17, green: 0.17, blue: 0.33)
                .edgesIgnoringSafeArea(.all)
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
