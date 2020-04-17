//
//  StrategyQuestion.swift
//  QUIZ Now!
//
//  Created by admin on 4/16/20.
//  Copyright © 2020 Artem Pozdnyakov. All rights reserved.
//

import Foundation

protocol StrategyQuestion {
    func createQuestion(question: [Question]) -> [Question]
}
