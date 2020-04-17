//
//  QuestionCaretaker.swift
//  QUIZ Now!
//
//  Created by admin on 4/17/20.
//  Copyright © 2020 Artem Pozdnyakov. All rights reserved.
//

import Foundation

class QuestionCaretaker {
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    private let key = "question"
    
   
    func save(question: [Question]) {
        do {
            let data = try self.encoder.encode(question)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error)
        }
    }
    
    func retrieveQuestion() -> [Question] {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return []
        }
        do {
            return try self.decoder.decode([Question].self, from: data)
        } catch {
            print(error)
            return []
        }
    }
    
}
