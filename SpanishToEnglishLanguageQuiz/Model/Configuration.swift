//
//  Configuration.swift
//  SpanishToEnglishLanguageQuiz
//
//  Created by Mohammad Zulqarnain on 13/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import Foundation

class Configuration {
    
    static var shared = Configuration()
    
    var isSpanishToEnglishQuizType = Bool(truncating: NSNumber(value: QuizType.englishToSpanish.rawValue))
}
