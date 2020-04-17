//
//  GameSesion.swift
//  MillionairGame
//
//  Created by admin on 4/8/20.
//  Copyright © 2020 Artem Pozdnyakov. All rights reserved.
//

import Foundation
import UIKit

class GameSesion: UIViewController, GameViewDelegate {
   
   
    var score = 0
    var question = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var gameView: GameViewController?
        gameView?.delegate = self
        
    }
    
    
    func resultGame(questions: Int, score: Int) {
        self.score = score
        self.question = questions
        
        print(self.score)
       }
    
    
    
    
}
