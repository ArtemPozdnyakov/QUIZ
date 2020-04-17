//
//  ViewController.swift
//  MillionairGame
//
//  Created by admin on 4/8/20.
//  Copyright © 2020 Artem Pozdnyakov. All rights reserved.
//

import UIKit


enum Difficulty {
    case standart
    case shuffle
}

protocol GameViewDelegate: class {
    func resultGame(questions: Int, score: Int)
}


class GameViewController: UIViewController {
    
    weak var delegate: GameViewDelegate?
    @IBOutlet weak var sumLable: UILabel!
    
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    @IBOutlet weak var answer4: UIButton!
    @IBOutlet weak var progressLable: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    
    
    @IBAction func exitButton(_ sender: UIButton) {
        restartGame()
    }
    
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var numberQuestionView: UILabel!
    
    var answer = QuestionMassiv.shared.answer
    var index = 0
    var indexPlus = 0
    var numberQuestion = Observable<Int>(0)
    var dollars = Observable<Int>(3)
    var progressLab = 0
    var progresViewNumber: Float = 0.0
    var newAnswer = [Question]()
    
    var difficulty: Difficulty = .standart

    
   

    private var createAppleStrategy: StrategyQuestion {
        switch self.difficulty {
        case .standart:
            return DefultStrategy()
        case .shuffle:
            return ShuffleStrategy()
        }
    }
    
    
    
    
    @IBAction func answer1(_ sender: UIButton) {
        if answer1.titleLabel?.text == newAnswer[index].trueAnswer {
            index += 1
            alertWin()
        } else {
            alertLose()
        }
        
    }
    
    @IBAction func answer2(_ sender: UIButton) {
        if answer2.titleLabel?.text == newAnswer[index].trueAnswer {
            index += 1
            alertWin()
        } else {
            alertLose()
        }
    }
    
    @IBAction func answer3(_ sender: UIButton) {
        if answer3.titleLabel?.text == newAnswer[index].trueAnswer {
            index += 1
            alertWin()
        } else {
            alertLose()
        }
    }
    
    @IBAction func answer4(_ sender: UIButton) {
        if answer4.titleLabel?.text == newAnswer[index].trueAnswer {
            index += 1
            alertWin()
        } else {
            alertLose()
        }
    }
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newAnswer = createAppleStrategy.createQuestion(question: answer)
        nextQuestion(index: index)
        progressView.setProgress(0, animated: true)
        progressLable.text = "Ответили на  \(String(progressLab))% из 100%"
        progresViewNumber = 1 / Float((newAnswer.count / 1))
        
        
    }
    
    
    
    
    
    
    func goInformation() {
        self.delegate?.resultGame(questions: newAnswer.count, score: dollars.value)
        let record = Result(score: dollars.value, date: Date())
        Game.shared.addRecord(record)
    }
    
    func progress() {
        numberQuestion.value += 1
        if index != 0 {
            progressView.progress += progresViewNumber
        } else {
            return
        }
        if index != 0 {
            progressLab = (indexPlus + (index * 100)) / newAnswer.count
        } else {
            return
        }
        progressLable.text = "Ответили на  \(String(progressLab))% из 100%"
    }
    
    
    
    
    func nextQuestion(index: Int) {
        if index <= newAnswer.count - 1 {
            progress()
            dollars.value *= 2
            numberQuestionView.text = "Номер вопроса: \(String(numberQuestion.value))"
            sumLable.text = "Выигрыш: \(String(dollars.value))$"
            question.text = newAnswer[index].question
            answer1.setTitle(newAnswer[index].answer1, for: .normal)
            answer2.setTitle(newAnswer[index].answer2, for: .normal)
            answer3.setTitle(newAnswer[index].answer3, for: .normal)
            answer4.setTitle(newAnswer[index].answer4, for: .normal)
        } else {
            progress()
            let alertWIndow = UIAlertController(title: "Ура!", message: "Игра закончена, Вы выйграли \(String(dollars.value))$!", preferredStyle: .alert)
            let actionButton = UIAlertAction(title: "Ok", style: .cancel, handler: {_ in
                self.restartGame()
            })
            alertWIndow.addAction(actionButton)
            present(alertWIndow, animated: true, completion: nil)
            
        }
    }
    
    
    
    
    func restartGame() {
        let viewController = storyboard?.instantiateViewController(identifier: "Main")
        self.navigationController?.popToRootViewController(animated: true)
        goInformation()
    }
    
    
    func alertWin() {
        let alertWIndow = UIAlertController(title: "Верно!", message: "Выигрыш: \(String(dollars.value))$!", preferredStyle: .alert)
        let actionButton = UIAlertAction(title: "Ok", style: .cancel, handler: {_ in
            self.nextQuestion(index: self.index)
        })
        alertWIndow.addAction(actionButton)
        present(alertWIndow, animated: true, completion: nil)
    }
    
    func alertLose() {
        let alertWIndow = UIAlertController(title: "Неправильно!", message: "Ваш выигрыш составил: \(String(dollars.value))$!", preferredStyle: .alert)
        let actionButton = UIAlertAction(title: "Ok", style: .cancel, handler: {_ in
            self.restartGame()
        })
        alertWIndow.addAction(actionButton)
        present(alertWIndow, animated: true, completion: nil)
    }
    
    
}









@IBDesignable extension UIButton {
    
    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}
