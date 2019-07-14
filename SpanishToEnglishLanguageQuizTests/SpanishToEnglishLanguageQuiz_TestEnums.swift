//
//  SpanishToEnglishEnumTest.swift
//  SpanishToEnglishLanguageQuizTests
//
//  Created by Mohammad Zulqarnain on 14/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest

@testable import SpanishToEnglishLanguageQuiz

class SpanishToEnglishLanguageQuiz_TestEnums: XCTestCase {
    
    func testEnums() {

        //Audio Assitant enums
        checStringValue(AudioFormats.wav.rawValue, "wav")
        checStringValue(AudioFormats.mp3.rawValue, "mp3")
        checStringValue(AudioFiles.win.rawValue, "win")
        checStringValue(AudioFiles.loose.rawValue, "loose")
        checStringValue(AudioFiles.levelMusic1.rawValue, "levelMusic")
        checStringValue(AudioFiles.bubblePop.rawValue, "bubblePop")

        //Test Constant enums
        checStringValue(Nib.questionView.rawValue, "QuestionView")
        checStringValue(Nib.stopWatchCounter.rawValue, "StopWatchCounter")
        checStringValue(Nib.wordBubbleView.rawValue, "WordBubbleView")
        checStringValue(Nib.scoreView.rawValue, "ScoreView")
        checStringValue(Nib.buttonView.rawValue, "ButtonView")
        checStringValue(Nib.tutorialImageView.rawValue, "TutorialImageView")
        checStringValue(Nib.splashScreenImageView.rawValue, "SplashScreenImageView")
        checStringValue(Nib.labelView.rawValue, "LabelView")
        checStringValue(Nib.instructorCommentView.rawValue, "InstructorCommentView")

        checStringValue(Strings.nextButtonTitle.rawValue, "Next")
         checStringValue(Strings.goToQuizType.rawValue, "Go To Quiz Type Selection")
         checStringValue(Strings.goToGame.rawValue, "Replay")
         checStringValue(Strings.scoreValuePrefix.rawValue, "Score: \n")
         checStringValue(Strings.scoreDatePrefix.rawValue, "Date: \n")

        checStringValue(Strings.SplashScreenViewControllerTitle.rawValue, "Splash Screen")
        checStringValue(Strings.TutorialViewControllerTitle.rawValue, "Tutorial Screen")
        checStringValue(Strings.QuizTypeSelectionViewControllerTitle.rawValue, "Quiz Type Selection Screen")
        checStringValue(Strings.GamePlayViewControllerTitle.rawValue, "GamePlay Screen")
        checStringValue(Strings.ScoreScreenViewControllerTitle.rawValue, "Score Screen")
       checStringValue(Strings.GameRouteViewControllerTitle.rawValue, "GameRoute Screen")
        
        checStringValue(Strings.SplashScreenViewControllerAccessibilityIdentifier.rawValue, "SplashScreenViewController")
        checStringValue(Strings.TutorialViewControllerAccessibilityIdentifier.rawValue, "TutorialViewController")
        checStringValue(Strings.QuizTypeSelectionViewControllerAccessibilityIdentifier.rawValue, "QuizTypeSelectionViewController")
        checStringValue(Strings.GamePlayViewControllerAccessibilityIdentifier.rawValue, "GamePlayViewController")
        checStringValue(Strings.ScoreScreenViewControllerAccessibilityIdentifier.rawValue, "ScoreScreenViewController")
        checStringValue(Strings.GameRouteViewControllerAccessibilityIdentifier.rawValue, "GameRouteViewController")
        
        checIntValue(QuizType.englishToSpanish.rawValue, 0)
        checIntValue(QuizType.spanishToEnglish.rawValue, 1)

        checDoubleValue(Constants.burstAnimationDuration.rawValue, 0.1)
        checDoubleValue(Constants.tutorialAnimationTimeInSeconds.rawValue, 24.0)
        checDoubleValue(Constants.alarmTimeInSeconds.rawValue, 0.4)
        checDoubleValue(Constants.stopWatchTimeInSeconds.rawValue, 14.0)
        checDoubleValue(Constants.splashAnimationTimeInSeconds.rawValue, 4.0)

        //Segue Enum
        checStringValue(Route.splashToTutorialScreenTransition.rawValue, "splashToTutorialScreenTransition")
        checStringValue(Route.tutorialToQuizTypeTransition.rawValue, "quizTutorialToSelectQuizTransition")
        checStringValue(Route.quizSelectToGamePlayTransition.rawValue, "quizSelectToGamePlayTransition")
        checStringValue(Route.gamePlayToScoreScreenTransition.rawValue, "gamePlayToScoreScreenTransition")
        checStringValue(Route.scoreScreenToGameRouteTransition.rawValue, "scoreScreenToGameRouteTransition")
        checStringValue(Route.gameRouteScreenToQuizTypeSelectionTransition.rawValue, "gameRouteScreenToQuizTypeSelectionTransition")
        checStringValue(Route.gameRouteScreenToGameplayTransition.rawValue, "gameRouteScreenToGameplayTransition")
       
    }
    
    // MARK: - private tests

    private func checStringValue(_ value: String,  _ actualVal: String) {
        XCTAssertEqual(value, actualVal)
    }
    
    private func checIntValue(_ value: Int,  _ actualVal: Int) {
        XCTAssertEqual(value, actualVal)
    }
    
    private func checDoubleValue(_ value: Double,  _ actualVal: Double) {
        XCTAssertEqual(value, actualVal)
    }
    
}

