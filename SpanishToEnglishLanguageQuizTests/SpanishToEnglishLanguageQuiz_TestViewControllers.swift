//
//  SpanishToEnglishLanguageQuiz_TestViewControllers.swift
//  SpanishToEnglishLanguageQuizTests
//
//  Created by Mohammad Zulqarnain on 14/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import Foundation
import XCTest

@testable import SpanishToEnglishLanguageQuiz

class SpanishToEnglishLanguageQuiz_TestViewControllers: XCTestCase {
    
    var splashScreenViewController: SplashScreenViewController!

    var tutorialViewController: TutorialViewController!

    var quizTypeSelectionViewController: QuizTypeSelectionViewController!

    var gamePlayViewController: GamePlayViewController!

    var scoreScreenViewController: ScoreScreenViewController!

    var gameRouteViewController: GameRouteViewController!
    
    func testViewControllers() {
        
        //Test SplashScreenViewController
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        splashScreenViewController = storyboard.instantiateViewController(withIdentifier: "SplashScreenViewController") as? SplashScreenViewController
        splashScreenViewController.viewDidLoad()
        splashScreenViewController.viewWillAppear(true)
        splashScreenViewController.viewDidAppear(true)
        splashScreenViewController.viewWillDisappear(true)
        splashScreenViewController.viewDidDisappear(true)
        checkIfNotNil(splashScreenViewController!)
        checkStringValue(splashScreenViewController.title!, "Splash Screen")
        checkStringValue(splashScreenViewController.view.accessibilityIdentifier!, "SplashScreenViewController")

        //Test tutorialViewController
        tutorialViewController = storyboard.instantiateViewController(withIdentifier: "TutorialViewController") as? TutorialViewController
        tutorialViewController.viewDidLoad()
        tutorialViewController.viewWillAppear(true)
        tutorialViewController.viewDidAppear(true)
        tutorialViewController.viewWillDisappear(true)
        tutorialViewController.viewDidDisappear(true)
        checkIfNotNil(tutorialViewController!)
        checkStringValue(tutorialViewController.title!, "Tutorial Screen")
        checkStringValue(tutorialViewController.view.accessibilityIdentifier!, "TutorialViewController")

        //Test quizTypeSelectionViewController
        quizTypeSelectionViewController = storyboard.instantiateViewController(withIdentifier: "QuizTypeSelectionViewController") as? QuizTypeSelectionViewController
        quizTypeSelectionViewController.viewDidLoad()
        quizTypeSelectionViewController.viewWillAppear(true)
        quizTypeSelectionViewController.viewDidAppear(true)
        quizTypeSelectionViewController.viewWillDisappear(true)
        quizTypeSelectionViewController.viewDidDisappear(true)
        checkIfNotNil(quizTypeSelectionViewController!)
        checkStringValue(quizTypeSelectionViewController.title!, "Quiz Type Selection Screen")
        checkStringValue(quizTypeSelectionViewController.view.accessibilityIdentifier!, "QuizTypeSelectionViewController")


        //Test gamePlayViewController
        gamePlayViewController = storyboard.instantiateViewController(withIdentifier: "GamePlayViewController") as? GamePlayViewController
        gamePlayViewController.viewDidLoad()
        gamePlayViewController.viewWillAppear(true)
        gamePlayViewController.viewDidAppear(true)
        gamePlayViewController.viewWillDisappear(true)
        gamePlayViewController.viewDidDisappear(true)
        checkIfNotNil(gamePlayViewController!)
        checkStringValue(gamePlayViewController.title!, "GamePlay Screen")
        checkStringValue(gamePlayViewController.view.accessibilityIdentifier!, "GamePlayViewController")

        //Test scoreScreenViewController
        scoreScreenViewController = storyboard.instantiateViewController(withIdentifier: "ScoreScreenViewController") as? ScoreScreenViewController
        scoreScreenViewController.viewDidLoad()
        scoreScreenViewController.viewWillAppear(true)
        scoreScreenViewController.viewDidAppear(true)
        scoreScreenViewController.viewWillDisappear(true)
        scoreScreenViewController.viewDidDisappear(true)
        checkIfNotNil(scoreScreenViewController!)
        checkStringValue(scoreScreenViewController.title!, "Score Screen")
        checkStringValue(scoreScreenViewController.view.accessibilityIdentifier!, "ScoreScreenViewController")

        //Test gameRouteViewController
        gameRouteViewController = storyboard.instantiateViewController(withIdentifier: "GameRouteViewController") as? GameRouteViewController
        gameRouteViewController.viewDidLoad()
        gameRouteViewController.viewWillAppear(true)
        gameRouteViewController.viewDidAppear(true)
        gameRouteViewController.viewWillDisappear(true)
        gameRouteViewController.viewDidDisappear(true)
        checkIfNotNil(gameRouteViewController!)
        checkStringValue(gameRouteViewController.title!, "GameRoute Screen")
        checkStringValue(gameRouteViewController.view.accessibilityIdentifier!, "GameRouteViewController")
    }
    
    // MARK: - private tests
    
    private func checkIfNotNil(_ value: Any) {
        XCTAssertNotNil(value)
    }
    
    private func checkStringValue(_ value: String,  _ actualVal: String) {
        XCTAssertEqual(value, actualVal)
    }
}
