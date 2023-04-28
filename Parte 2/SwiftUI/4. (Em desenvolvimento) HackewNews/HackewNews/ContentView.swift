//
//  ContentView.swift
//  HackewNews
//
//  Created by Usuário on 31/03/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManagar = NetworkManager()
    
    var body: some View {
        VStack {
            NavigationView{
                List(networkManagar.posts){ post in
                    Text(post.title)
                }
                .navigationTitle("Hacker News")
            }
            onAppear(){
                networkManagar.fecthData()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
