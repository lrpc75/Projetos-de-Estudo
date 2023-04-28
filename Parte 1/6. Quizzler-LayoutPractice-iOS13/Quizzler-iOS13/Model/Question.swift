//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Usuário on 26/11/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct Question{
    let text: String
    let optionButton: [String]
    let answer: String
    
    init(q:String, a:[String], c:String){
        text = q
        optionButton = a
        answer = c
    }
}

