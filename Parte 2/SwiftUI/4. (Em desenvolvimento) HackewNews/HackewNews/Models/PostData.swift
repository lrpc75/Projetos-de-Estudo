//
//  PostData.swift
//  HackewNews
//
//  Created by Usuário on 31/03/23.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    var id: String{
        return objectID
    }
    let objectID: String
    let title: String
    let url: String?
    let points: Int
}
