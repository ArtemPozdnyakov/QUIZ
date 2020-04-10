//
//  ViewController.swift
//  MillionairGame
//
//  Created by admin on 4/8/20.
//  Copyright © 2020 Artem Pozdnyakov. All rights reserved.
//

import UIKit

protocol GameViewDelegate: class {
    func resultGame(questions: Int, score: Int)
}


class GameViewController: UIViewController {
    
    weak var delegate: GameViewDelegate?
    
    
    @IBOutlet weak var question: UILabel!
    
    @IBAction func exit(_ sender: Any) {
        goInformation()
        restartGame()
    }
    
    var index = 0
    var score = 0
    @IBAction func buttonBltyat(_ sender: UIButton) {
        let button = sender
        
        if index <= 8{
            if button.tag == answer[index].true1{
                index += 1
                score += 1
                question.text = answer[index].question
                
                
            } else {
                goInformation()
                restartGame()
            }
        } else {
            score += 1
            goInformation()
            restartGame()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        question.text = answer[0].question
        
        
        
    }
    
    func goInformation() {
        self.delegate?.resultGame(questions: answer.count, score: score)
        
        let record = Result(score: score, date: Date())
        Game.shared.addRecord(record)
    }
    
    func restartGame() {
        let viewController = storyboard?.instantiateViewController(identifier: "Main")
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    var answer = [Question(question: "Что, по преданию, сказал Галилей, выйдя с суда инквизиции?\n \t1)А судьи кто?\n\t2)А все-таки она вертится!\n\t3)Карету мне, карету!\n\t4)Ну вы, блин, даете!",
                           false1: 4,
                           false2: 3,
                           false3: 1,
                           true1: 2),
                  Question(question: "Кого обслуживает на круизном лайнере стюард?\n \t1)Пассажиров\n\t2)Матросов\n\t3)Таможенников\n\t4)Стюардесс",
                           false1: 3,
                           false2: 2,
                           false3: 4,
                           true1: 1),
                  Question(question: "Какая терапия была применена для оздоровления российской экономики?\n \t1)Медикаментозная \n\t2)Курортная\n\t3)Шоковая\n\t4)Грязелечение",
                           false1: 4,
                           false2: 2,
                           false3: 1,
                           true1: 3),
                  Question(question: "Как называется главный труд Карла Маркса?\n\t1)Сновидения\n\t2)Думай и богатей\n\t3)Капитал\n\t4)Жизнь животных",
                           false1: 4,
                           false2: 2,
                           false3: 1,
                           true1: 3),
                  Question(question: "Как можно разрезать пирог?\n\t1)Пополам \n\t2)Попотолкам\n\t3)Постенам\n\t4)Поокнам",
                           false1: 4,
                           false2: 2,
                           false3: 3,
                           true1: 1),
                  Question(question: "На всякого мудреца довольно … Чего?\n\t1)Глупости\n\t2)Бедноты\n\t3)Простоты\n\t4)Холодца",
                           false1: 4,
                           false2: 2,
                           false3: 1,
                           true1: 3),
                  Question(question: "Что проглотил Крокодил из ''Мойдодыра''?\n \t1)Мочалку \n\t2)Калошу\n\t3)Умывальник\n\t4)Тотошу",
                           false1: 4,
                           false2: 2,
                           false3: 3,
                           true1: 1),
                  Question(question: "Какую реку Юлий Цезарь перешел со словами ''Жребий брошен''?\n\t1)Нил\n\t2)Евфрат\n\t3)Рубикон\n\t4)Припять",
                           false1: 4,
                           false2: 2,
                           false3: 1,
                           true1: 3),
                  Question(question: "Назовите имя вожака волчьей стаи из ''Маугли''\n \t1)Аттила \n\t2)Цекало\n\t3)Кибела\n\t4)Акела",
                           false1: 1,
                           false2: 2,
                           false3: 1,
                           true1: 4),
                  Question(question: "Запах какого растения отпугивает сказочных вампиров?\n \t1)Лук\n\t2)Чеснок\n\t3)Сельдерей\n\t4)Лавровый лист",
                           false1: 4,
                           false2: 3,
                           false3: 1,
                           true1: 2)
    ]
    
    
    
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
