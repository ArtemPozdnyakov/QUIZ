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
    @IBOutlet weak var resultLable: UILabel!
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//       // self.resultLable.text = "Jopa22222"
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "startGameSegue":
            guard let destination = segue.destination as? GameViewController else { return }
            destination.delegate = self
        default:
            break
        }
    }
    
}

extension StartWindow {
    func resultGame(questions: Int, score: Int) {
        self.resultLable.text = "Last result: \(score)/\(questions)"

    }
}
