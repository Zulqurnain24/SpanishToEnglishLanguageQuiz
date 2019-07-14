//
//  SpanishToEnglishLanguage_TestViews.swift
//  SpanishToEnglishLanguageQuizTests
//
//  Created by Mohammad Zulqarnain on 14/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import Foundation
import XCTest

@testable import SpanishToEnglishLanguageQuiz

class SpanishToEnglishLanguage_TestViews: XCTestCase {

    let questionView = Bundle.main.loadNibNamed(Nib.questionView.rawValue, owner: self, options: nil)?.last as! QuestionView
    
    let stopWatchCounter = Bundle.main.loadNibNamed(Nib.stopWatchCounter.rawValue, owner: self, options: nil)?.last as! StopWatchCounter
    
    
    let wordBubbleView = Bundle.main.loadNibNamed(Nib.wordBubbleView.rawValue, owner: self, options: nil)?.last as! WordBubbleView
    
    let scoreView = Bundle.main.loadNibNamed(Nib.scoreView.rawValue, owner: self, options: nil)?.last as! ScoreView
    
    let buttonView = Bundle.main.loadNibNamed(Nib.buttonView.rawValue, owner: self, options: nil)?.last as! ButtonView
    
     let tutorialImageView = Bundle.main.loadNibNamed(Nib.tutorialImageView.rawValue, owner: self, options: nil)?.last as! TutorialImageView
    
    let  labelView = Bundle.main.loadNibNamed(Nib.labelView.rawValue, owner: self, options: nil)?.last as! LabelView
    
    let  instructorCommentView = Bundle.main.loadNibNamed(Nib.instructorCommentView.rawValue, owner: self, options: nil)?.last as! InstructorCommentView
    
     let  splashScreenImageView = Bundle.main.loadNibNamed(Nib.splashScreenImageView.rawValue, owner: self, options: nil)?.last as! SplashScreenImageView
    
    func testViews() {

        //Test questionView
        questionView.setQuestionText("primary school")
        checkStringValue(questionView.questionLabel.text!, "primary school")
        checkIfNotNil(questionView)
        
        //test stop watch counter
        stopWatchCounter.setupStopWatchAnimation()
        checkIntValue(stopWatchCounter.animationImages!.count, 10)
        checkIfNotNil(stopWatchCounter)
        stopWatchCounter.startAnimating()
        stopWatchCounter.stopAnimating()
        stopWatchCounter.layer.removeAllAnimations()
        checBoolValue(stopWatchCounter.isAnimating, false)
        
        //test word bubble view
        wordBubbleView.setupBurstAnimation()
        checkIntValue(wordBubbleView.imageView.animationImages!.count, 3)
        wordBubbleView.imageView.startAnimating()
        wordBubbleView.imageView.stopAnimating()
        wordBubbleView.imageView.layer.removeAllAnimations()
        checBoolValue(wordBubbleView.imageView.isAnimating, false)
        
        //test tutorial image view
        tutorialImageView.configureAnimation()
        checkIntValue(tutorialImageView.animationImages!.count, 8)
        tutorialImageView.startAnimating()
        tutorialImageView.stopAnimating()
        tutorialImageView.layer.removeAllAnimations()
        checBoolValue(tutorialImageView.isAnimating, false)
        
        //test label view
        labelView.setText(Strings.scoreValuePrefix.rawValue + "1000")
        checkStringValue(labelView.label.text!, "Score: \n1000")
        
        //instruction view
        instructorCommentView.setImage(name: "try again next time")
        checkIfNotNil(instructorCommentView.imageView.image!)
        instructorCommentView.setImage(name: "good job")
        checkIfNotNil(instructorCommentView.imageView.image!)
        
        //splash view
        splashScreenImageView.configureAnimation()
        checkIntValue(splashScreenImageView.animationImages!.count, 8)
        splashScreenImageView.startAnimating()
        splashScreenImageView.stopAnimating()
        splashScreenImageView.layer.removeAllAnimations()
        checBoolValue(splashScreenImageView.isAnimating, false)
    }
    
    // MARK: - private tests
    
    private func checkIfNotNil(_ value: Any) {
        XCTAssertNotNil(value)
    }
    
    private func checkStringValue(_ value: String,  _ actualVal: String) {
        XCTAssertEqual(value, actualVal)
    }
    
    private func checkIntValue(_ value: Int,  _ actualVal: Int) {
        XCTAssertEqual(value, actualVal)
    }
    
    private func checDoubleValue(_ value: Double,  _ actualVal: Double) {
        XCTAssertEqual(value, actualVal)
    }
    
    private func checBoolValue(_ value: Bool,  _ actualVal: Bool) {
        XCTAssertEqual(value, actualVal)
    }
}
