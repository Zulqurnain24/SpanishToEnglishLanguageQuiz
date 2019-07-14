//
//  SpanishToEnglishLanguageQuiz_TestDatasources.swift
//  SpanishToEnglishLanguageQuizTests
//
//  Created by Mohammad Zulqarnain on 14/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import Foundation
import XCTest

@testable import SpanishToEnglishLanguageQuiz

class SpanishToEnglishLanguageQuiz_TestDatasources: XCTestCase {
    
    var scoreDataSource: ScoreDataSource!
    var quizDataSource: QuizDataSource!
    func testDataSources() {
       testScoreDataSource()
       testQuizDataSource()
    }
    
    func testScoreDataSource() {
        scoreDataSource = ScoreDataSource()
        checkIfNotNil(scoreDataSource!)
        scoreDataSource.recordScore(score: Score(value: 5, date: Date(), isHigh: false))
        scoreDataSource.recordScore(score: Score(value: 1000, date: Date(), isHigh: false))
        scoreDataSource.recordScore(score: Score(value: 100, date: Date(), isHigh: false))
        checkIntValue(scoreDataSource.getScoreArray().count, 3)
        checkIntValue(scoreDataSource.getHighestScore()!.value, 1000)
    }
    
    func testQuizDataSource() {
        quizDataSource = QuizDataSource()
        checkIfNotNil(quizDataSource!)
        quizDataSource.populateArrayFromJSONFile { words in
            checkIntValue(words.count, 297)
        }
    }
    
    // MARK: - private tests
    
    private func checkIfNotNil(_ value: Any) {
        XCTAssertNotNil(value)
    }
    
    private func checkIntValue(_ value: Int,  _ actualVal: Int) {
        XCTAssertEqual(value, actualVal)
    }
}
