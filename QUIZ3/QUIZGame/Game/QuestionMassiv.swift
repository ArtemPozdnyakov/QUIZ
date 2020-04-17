//
//  QuestionMassiv.swift
//  QUIZ Now!
//
//  Created by admin on 4/17/20.
//  Copyright © 2020 Artem Pozdnyakov. All rights reserved.
//

import Foundation


class QuestionMassiv {
static let shared = QuestionMassiv()

   
    
    var answer = [Question(question: "Что, по преданию, сказал Галилей, выйдя с суда инквизиции?\n",
                           answer1: "Ну вы, блин, даете!",
                           answer2: "Карету мне, карету!",
                           answer3: "А все-таки она вертится!",
                           answer4: "А судьи кто",
                           trueAnswer: "А все-таки она вертится!"),
                  Question(question: "Кого обслуживает на круизном лайнере стюард?\n",
                           answer1: "Таможенников",
                           answer2: "Пассажиров",
                           answer3: "Стюардесс",
                           answer4: "Матросов",
                           trueAnswer: "Пассажиров"),
                  Question(question: "Какая терапия была применена для оздоровления российской экономики?\n ",
                           answer1: "Грязелечение",
                           answer2: "Шоковая",
                           answer3: "Медикаментозная",
                           answer4: "Курортная",
                           trueAnswer: "Шоковая"),
                  Question(question: "Как называется главный труд Карла Маркса?\n",
                           answer1: "Капитал",
                           answer2: "Думай и богатей",
                           answer3: "Сновидения",
                           answer4: "Жизнь животных",
                           trueAnswer: "Капитал"),
                  Question(question: "Как можно разрезать пирог?\n",
                           answer1: "Попотолкам",
                           answer2: "Поокнам",
                           answer3: "Постенам",
                           answer4: "Пополам",
                           trueAnswer: "Пополам"),
                  Question(question: "На всякого мудреца довольно … Чего?\n",
                           answer1: "Простоты",
                           answer2: "Бедноты",
                           answer3: "Глупости",
                           answer4: "Холодца",
                           trueAnswer: "Простоты"),
                  Question(question: "Что проглотил Крокодил из ''Мойдодыра''?\n",
                           answer1: "Калошу",
                           answer2: "Мочалку",
                           answer3: "Тотошу",
                           answer4: "Умывальник",
                           trueAnswer: "Мочалку"),
                  Question(question: "Какую реку Юлий Цезарь перешел со словами ''Жребий брошен''?\n",
                           answer1: "Припять",
                           answer2: "Евфрат",
                           answer3: "Нил",
                           answer4: "Рубикон",
                           trueAnswer: "Рубикон"),
                  Question(question: "Назовите имя вожака волчьей стаи из ''Маугли''\n",
                           answer1: "Аттила",
                           answer2: "Цекало",
                           answer3: "Акела",
                           answer4: "Кибела",
                           trueAnswer: "Акела"),
                  Question(question: "Запах какого растения отпугивает сказочных вампиров?\n",
                           answer1: "Сельдерей",
                           answer2: "Чеснок",
                           answer3: "Лук",
                           answer4: "Лавровый",
                           trueAnswer: "Чеснок")
    ] {
        didSet {
            questionCaretaker.save(question: self.answer)
        }
    }
    
    func addNewQuestion(question: Question) {
        answer.append(question)
        
        
        
    }
    
    
    
    private init() {
        self.answer = answer + self.questionCaretaker.retrieveQuestion()
       }
       
       var questionCaretaker = QuestionCaretaker()
    
       
}
