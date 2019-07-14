//
//  GameRouteViewController.swift
//  SpanishToEnglishLanguageQuiz
//
//  Created by Mohammad Zulqarnain on 13/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit

class GameRouteViewController: UIViewController {
    @IBOutlet weak var buttonViewForQuizSelect: UIView!
    @IBOutlet weak var instructorCommentDisplayView: UIView!
    @IBOutlet weak var buttonViewForPlayGameAgain: UIView!

    let quizSelectButtonView = Bundle.main.loadNibNamed(Nib.buttonView.rawValue, owner: self, options: nil)?.last as! ButtonView
    
    
    let playGameAgainButtonView = Bundle.main.loadNibNamed(Nib.buttonView.rawValue, owner: self, options: nil)?.last as! ButtonView
    
    let instructorCommentView = Bundle.main.loadNibNamed(Nib.instructorCommentView.rawValue, owner: self, options: nil)?.last as! InstructorCommentView
    
    var isScoreHigh: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure() 
        setupView()
    }
    
    func configure() {
        self.title = Strings.GameRouteViewControllerTitle.rawValue
        self.view.accessibilityIdentifier = Strings.GameRouteViewControllerAccessibilityIdentifier.rawValue
    }
    
    func performSegueToQuizSelectViewController() {
        performSegue(withIdentifier: Route.gameRouteScreenToQuizTypeSelectionTransition.rawValue, sender: self)
    }
    
    func performSegueToGamePlayViewController() {
        performSegue(withIdentifier: Route.gameRouteScreenToGameplayTransition.rawValue, sender: self)
    }
    
    func setupView() {
       
        if let _ = self.isScoreHigh {
            instructorCommentView.setImage(name: "goodJob")
            
            AudioAssisstant.shared.playSound(soundName: AudioFiles.win.rawValue, withFormat: AudioFormats.wav.rawValue)
        } else {
            instructorCommentView.setImage(name: "tryAgainNextTime")
            
            AudioAssisstant.shared.playSound(soundName: AudioFiles.loose.rawValue, withFormat: AudioFormats.wav.rawValue)
        }

        instructorCommentDisplayView.addSubview(instructorCommentView)
        quizSelectButtonView.setButtonTitle("Go To Quiz Select")
        quizSelectButtonView.buttonCallback = {
            self.performSegueToQuizSelectViewController()
        }
        buttonViewForQuizSelect.addSubview(quizSelectButtonView)
        playGameAgainButtonView.setButtonTitle("Play Again")
        playGameAgainButtonView.buttonCallback = {
            self.performSegueToGamePlayViewController()
        }
        buttonViewForPlayGameAgain.addSubview(playGameAgainButtonView)
    }
}
