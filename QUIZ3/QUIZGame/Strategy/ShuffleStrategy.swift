//
//  ShuffleStrategy.swift
//  QUIZ Now!
//
//  Created by admin on 4/16/20.
//  Copyright © 2020 Artem Pozdnyakov. All rights reserved.
//

import Foundation

class ShuffleStrategy: StrategyQuestion {
    
    var newAnswer = [Question]()
    
    func createQuestion(question: [Question]) -> [Question] {
        var answer = question.shuffled()
        return answer
    }
}
