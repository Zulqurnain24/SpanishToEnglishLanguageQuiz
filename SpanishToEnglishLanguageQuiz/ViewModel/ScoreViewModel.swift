//
//  ScoreViewModel.swift
//  SpanishToEnglishLanguageQuiz
//
//  Created by Mohammad Zulqarnain on 13/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import Foundation

struct ScoreViewModel {
    var value: String
    var date: String
    var isHigh: Bool
}

extension ScoreViewModel {
    init(score: Score) {
        value = "\(score.value)"
        date = "\(score.date)"
        isHigh = score.isHigh
    }
}
