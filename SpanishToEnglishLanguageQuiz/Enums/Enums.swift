//
//  Enums.swift
//  SpanishToEnglishLanguageQuiz
//
//  Created by Mohammad Zulqarnain on 13/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import Foundation

//Constant Strings
enum Strings: String {
    typealias RawValue = String
    
    case nextButtonTitle = "Next"
    case goToQuizType = "Go To Quiz Type Selection"
    case goToGame = "Replay"
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
    case tutorialAnimationTimeInSeconds = 0.0
    case alarmTimeInSeconds = 0.5
    case stopWatchTimeInSeconds = 14.0
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
