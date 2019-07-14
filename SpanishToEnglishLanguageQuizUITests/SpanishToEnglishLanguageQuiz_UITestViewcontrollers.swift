//
//  SpanishToEnglishLanguageQuiz_UITestViewcontrollers.swift
//  SpanishToEnglishLanguageQuizUITests
//
//  Created by Mohammad Zulqarnain on 14/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import Foundation
import XCTest

@testable import SpanishToEnglishLanguageQuiz

class SpanishToEnglishLanguageQuiz_UITestViewcontrollers: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    //Test GamePlay
    func testQuizTypeGamePlayViewController() {
        
        let app = XCUIApplication()
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0, execute: {
        let nextButton = app/*@START_MENU_TOKEN@*/.buttons["Next"]/*[[".otherElements[\"GamePlayViewController\"].buttons[\"Next\"]",".buttons[\"Next\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        nextButton.tap()
        
        let gameplayviewcontrollerElement = app.otherElements["GamePlayViewController"]
        let element3 = gameplayviewcontrollerElement.children(matching: .other).element(boundBy: 3)
        let element2 = element3.children(matching: .other).element(boundBy: 0)
        let element = element2.children(matching: .other).element
        element.swipeRight()
        element/*@START_MENU_TOKEN@*/.swipeRight()/*[[".swipeDown()",".swipeRight()"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        element2.swipeDown()
        element2.tap()
        element2.tap()
        element3.tap()
        gameplayviewcontrollerElement.swipeRight()
        gameplayviewcontrollerElement/*@START_MENU_TOKEN@*/.swipeRight()/*[[".swipeUp()",".swipeRight()"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        element3.children(matching: .other).element(boundBy: 1).children(matching: .other).element.swipeDown()
        gameplayviewcontrollerElement.tap()
        gameplayviewcontrollerElement.tap()
        gameplayviewcontrollerElement.tap()
        gameplayviewcontrollerElement.swipeRight()
        nextButton.tap()
        gameplayviewcontrollerElement.tap()
        nextButton.tap()
        gameplayviewcontrollerElement.swipeRight()
        nextButton.tap()
        gameplayviewcontrollerElement.swipeRight()
        element/*@START_MENU_TOKEN@*/.swipeRight()/*[[".swipeDown()",".swipeRight()"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        element2.swipeLeft()
        element2/*@START_MENU_TOKEN@*/.swipeRight()/*[[".swipeDown()",".swipeRight()"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        nextButton/*@START_MENU_TOKEN@*/.swipeLeft()/*[[".swipeUp()",".swipeLeft()"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        element2/*@START_MENU_TOKEN@*/.swipeRight()/*[[".swipeDown()",".swipeRight()"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        gameplayviewcontrollerElement.swipeRight()
        gameplayviewcontrollerElement.swipeRight()
        gameplayviewcontrollerElement.swipeDown()
        element2.tap()
        element2.tap()
        element/*@START_MENU_TOKEN@*/.swipeRight()/*[[".swipeDown()",".swipeRight()"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        element2/*@START_MENU_TOKEN@*/.swipeRight()/*[[".swipeDown()",".swipeRight()"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        element2/*@START_MENU_TOKEN@*/.swipeLeft()/*[[".swipeUp()",".swipeLeft()"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        })
        
    }
}
