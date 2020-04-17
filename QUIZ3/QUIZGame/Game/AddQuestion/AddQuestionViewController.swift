//
//  AddQuestionViewController.swift
//  QUIZ Now!
//
//  Created by admin on 4/17/20.
//  Copyright © 2020 Artem Pozdnyakov. All rights reserved.
//

import UIKit

class AddQuestionViewController: UIViewController {
    
    
    
    @IBOutlet weak var question: UITextField!
    
    @IBOutlet weak var answer1: UITextField!
    @IBOutlet weak var answe2: UITextField!
    @IBOutlet weak var answer3: UITextField!
    @IBOutlet weak var trueAnswer: UITextField!
    
    @IBAction func addQuestionButton(_ sender: UIButton) {
        addQuestion()
        alertAddQuestion()
    }
    
    
    
    func addQuestion(){
        var newQuestion = Question(question: question.text!,
                                   answer1: answer1.text!,
                                   answer2: answe2.text!,
                                   answer3: answer3.text!,
                                   answer4: trueAnswer.text!,
                                   trueAnswer: trueAnswer.text!)
        QuestionMassiv.shared.addNewQuestion(question: newQuestion)
        
    }
    
    
    
    
    
    func alertAddQuestion() {
        let alertWIndow = UIAlertController(title: "Отлично", message: "Вопрос добавлен!", preferredStyle: .alert)
        let actionButton = UIAlertAction(title: "Ok", style: .cancel, handler: {_ in
        })
        alertWIndow.addAction(actionButton)
        present(alertWIndow, animated: true, completion: nil)
    }
    
    @IBAction func tap(_ sender: UITapGestureRecognizer) {
        question.resignFirstResponder()
        answer1.resignFirstResponder()
        answe2.resignFirstResponder()
        answer3.resignFirstResponder()
        trueAnswer.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       

        // Do any additional setup after loading the view.
    }
   
}
