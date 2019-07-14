//
//  Enums.swift
//  SpanishToEnglishLanguageQuiz
//
//  Created by Mohammad Zulqarnain on 13/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import Foundation

//Constant Strings
enum Nib: String {
    typealias RawValue = String
    
    case questionView = "QuestionView"
    case stopWatchCounter = "StopWatchCounter"
    case wordBubbleView = "WordBubbleView"
    case scoreView = "ScoreView"
    case buttonView = "ButtonView"
    case tutorialImageView = "TutorialImageView"
    case splashScreenImageView = "SplashScreenImageView"
    case labelView = "LabelView"
    case instructorCommentView = "InstructorCommentView"
}

//Constant Strings
enum Strings: String {
    typealias RawValue = String
    
    case nextButtonTitle = "Next"
    case goToQuizType = "Go To Quiz Type Selection"
    case goToGame = "Replay"
    case scoreValuePrefix = "Score: \n"
    case scoreDatePrefix = "Date: \n"
    
    case SplashScreenViewControllerTitle = "Splash Screen"
    case TutorialViewControllerTitle = "Tutorial Screen"
    case QuizTypeSelectionViewControllerTitle = "Quiz Type Selection Screen"
    case GamePlayViewControllerTitle = "GamePlay Screen"
    case ScoreScreenViewControllerTitle = "Score Screen"
    case GameRouteViewControllerTitle = "GameRoute Screen"
    
     case SplashScreenViewControllerAccessibilityIdentifier = "SplashScreenViewController"
     case TutorialViewControllerAccessibilityIdentifier = "TutorialViewController"
     case QuizTypeSelectionViewControllerAccessibilityIdentifier = "QuizTypeSelectionViewController"
     case GamePlayViewControllerAccessibilityIdentifier = "GamePlayViewController"
     case ScoreScreenViewControllerAccessibilityIdentifier = "ScoreScreenViewController"
     case GameRouteViewControllerAccessibilityIdentifier = "GameRouteViewController"
}

//Constant Enum
enum QuizType: Int {
    typealias RawValue = Int
    
    case englishToSpanish = 0
    case spanishToEnglish
}

//Constant Enum
enum Constants: Double {
    case burstAnimationDuration = 0.1
    case tutorialAnimationTimeInSeconds = 24.0
    case alarmTimeInSeconds = 0.4
    case stopWatchTimeInSeconds = 14
    case splashAnimationTimeInSeconds = 4.0
}

//Segue Enum
enum Route: String {
    typealias RawValue = String
    
    case splashToTutorialScreenTransition = "splashToTutorialScreenTransition"
    case tutorialToQuizTypeTransition = "quizTutorialToSelectQuizTransition"
    case quizSelectToGamePlayTransition = "quizSelectToGamePlayTransition"
    case gamePlayToScoreScreenTransition = "gamePlayToScoreScreenTransition"
    case scoreScreenToGameRouteTransition = "scoreScreenToGameRouteTransition"
    case gameRouteScreenToQuizTypeSelectionTransition = "gameRouteScreenToQuizTypeSelectionTransition"
     case gameRouteScreenToGameplayTransition = "gameRouteScreenToGameplayTransition"
}
