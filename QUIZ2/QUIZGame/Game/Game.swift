//
//  Game.swift
//  MillionairGame
//
//  Created by admin on 4/8/20.
//  Copyright © 2020 Artem Pozdnyakov. All rights reserved.
//

import Foundation
struct Result: Codable {
    var score: Int
    var date: Date
}

class Game {
    static let shared = Game()
    
    var game = GameSesion()
    
    private init() {
        self.results = self.recordsCaretaker.retrieveRecords()
    }
    
    var recordsCaretaker = RecordsCaretaker()
    
    var results: [Result] = [] {
        didSet {
            recordsCaretaker.save(records: self.results)
        }
    }
    
    func addRecord(_ record: Result) {
        self.results.append(record)
    }
}
