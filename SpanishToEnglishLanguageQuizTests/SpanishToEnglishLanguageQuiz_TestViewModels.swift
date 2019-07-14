//
//  SpanishToEnglishLanguageQuiz_TestViewModels.swift
//  SpanishToEnglishLanguageQuizTests
//
//  Created by Mohammad Zulqarnain on 14/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import Foundation
import XCTest

@testable import SpanishToEnglishLanguageQuiz

class SpanishToEnglishLanguageQuiz_TestViewModels: XCTestCase {
    
    var gamePlayViewModel: GamePlayViewModel!
    var scoreViewModel: ScoreViewModel!
    
    func testViewModels() {
        testGamePlayViewModel()
        testScoreViewModel()
    }
    
    func testGamePlayViewModel() {
       gamePlayViewModel = GamePlayViewModel([Word(english: "primary school", spanish: "escuela primaria")])
        checkIfNotNil(gamePlayViewModel!)
        checkIntValue(gamePlayViewModel.quizArray.count, 1)
    }
    
    func testScoreViewModel() {
       scoreViewModel = ScoreViewModel(value: "100", date: Date().description, isHigh: false)
        checkIfNotNil(scoreViewModel!)
        checkStringValue(scoreViewModel!.date, Date().description)
        checkBoolValue(scoreViewModel!.isHigh, false)
        checkStringValue(scoreViewModel!.value, "100")
    }
    
    // MARK: - private tests
    
    private func checkIfNotNil(_ value: Any) {
        XCTAssertNotNil(value)
    }
    
    private func checkIntValue(_ value: Int,  _ actualVal: Int) {
        XCTAssertEqual(value, actualVal)
    }
    
    private func checkBoolValue(_ value: Bool,  _ actualVal: Bool) {
        XCTAssertEqual(value, actualVal)
    }
    
    private func checkStringValue(_ value: String,  _ actualVal: String) {
        XCTAssertEqual(value, actualVal)
    }
}
