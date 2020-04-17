//
//  File.swift
//  MillionairGame
//
//  Created by admin on 4/10/20.
//  Copyright © 2020 Artem Pozdnyakov. All rights reserved.
//

import Foundation
import UIKit



class StartWindow: UIViewController, GameViewDelegate {
    
    @IBAction func startButton(_ sender: UIButton) {
        
    }
//    @IBAction func backStartWindow(_ sender: UIButton) {
//        let viewController = storyboard?.instantiateViewController(identifier: "Main")
//        self.navigationController?.popToRootViewController(animated: true)
//    }
    @IBOutlet weak var resultLable: UILabel!
    

   // @IBOutlet weak var sigmentControl: UISegmentedControl!
    weak var delegate: GameViewDelegate?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "startGameSegue":
            guard let destination = segue.destination as? GameViewController else { return }
            destination.delegate = self
            destination.difficulty = self.selectStrategy
        default:
            break
        }
    }
    
    var selectStrategy: Difficulty = .standart

    
}

extension StartWindow {
    func resultGame(questions: Int, score: Int) {
        self.resultLable.text = "Last result: \(score)$"

    }
}
