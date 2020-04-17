//
//  Question.swift
//  MillionairGame
//
//  Created by admin on 4/8/20.
//  Copyright © 2020 Artem Pozdnyakov. All rights reserved.
//

import Foundation

struct Question: Codable {
    var question: String
    var answer1: String
    var answer2: String
    var answer3: String
    var answer4: String
    var trueAnswer: String
  
}

