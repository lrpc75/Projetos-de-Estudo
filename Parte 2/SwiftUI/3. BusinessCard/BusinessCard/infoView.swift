//
//  infoView.swift
//  BusinessCard
//
//  Created by Usuário on 30/03/23.
//

import SwiftUI

struct InfoView: View {
    
    let simbolName: String
    let text: String
    
    var body: some View {
        Capsule()
            .frame(height: 45)
            .foregroundColor(.white)
            .overlay(Label(text, systemImage: simbolName))
            .padding(.all)
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(simbolName: "phone.fill", text: "Exemplo de infoView")
            .previewLayout(.sizeThatFits)
    }
}
