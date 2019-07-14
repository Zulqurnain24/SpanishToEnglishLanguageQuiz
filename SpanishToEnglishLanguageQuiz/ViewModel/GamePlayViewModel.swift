//
//  GamePlayViewModel.swift
//  SpanishToEnglishLanguageQuiz
//
//  Created by Mohammad Zulqarnain on 13/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import Foundation

struct GamePlayViewModel {
    var quizArray: [Word]
}

extension GamePlayViewModel {
     init(_ quizArray: [Word]) {
        guard let isSpanishToEnglishQuizType = Configuration.shared.isSpanishToEnglishQuizType as Bool? else {
            self.quizArray = quizArray
            return }
        if isSpanishToEnglishQuizType {
            self.quizArray = quizArray
        } else {
             self.quizArray = [Word]()
             quizArray.forEach({ word in //We swap the values of english and spanish based on user's choice
                self.quizArray.append(Word(english: word.spanish, spanish: word.english))
             })
        }
    }
}
