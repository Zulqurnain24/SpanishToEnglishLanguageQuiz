//
//  ScoreDataSource.swift
//  SpanishToEnglishLanguageQuiz
//
//  Created by Mohammad Zulqarnain on 13/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import Foundation

//Define Score struct
struct Score {
    var value = 0
    var date = Date()
    var isHigh =  false
}

class ScoreDataSource {
    private var scoreArray = [Score]()
    
    func recordScore(score: Score) {
        scoreArray.append(score)
    }
    
    func getScoreArray() -> [Score] {
        return scoreArray
    }

    func getHighestScore() -> Score? {
        scoreArray = scoreArray.sorted(by: { $0.value > $1.value })
        guard let scoreArray = self.scoreArray as [Score]?, let first = scoreArray.first as Score?, let highestScore = first as Score? else { return nil }
        return highestScore
    }
 
}
