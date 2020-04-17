//
//  SettingView.swift
//  QUIZ Now!
//
//  Created by admin on 4/16/20.
//  Copyright © 2020 Artem Pozdnyakov. All rights reserved.
//

import Foundation
import UIKit

class SettingView: UIViewController, GameViewDelegate {
    func resultGame(questions: Int, score: Int) {
        
    }
    
    
    @IBAction func backButtonStart(_ sender: UIButton) {
    }
    
    
    
    
     @IBOutlet weak var sigmentControl: UISegmentedControl!
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "settingSegue":
            guard let destination = segue.destination as? StartWindow else { return }
            destination.delegate = self
            destination.selectStrategy = self.selectStrategySettings
            print("jopa")
        default:
            break
        }
    }
    
    
    var selectStrategySettings: Difficulty {
        switch self.sigmentControl.selectedSegmentIndex {
        case 0:
            return .standart
        case 1:
            return .shuffle
        default:
           return .standart
        }
    }
    
    
    
}
