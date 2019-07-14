//
//  TutorialViewController.swift
//  SpanishToEnglishLanguageQuiz
//
//  Created by Mohammad Zulqarnain on 13/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController {

    @IBOutlet weak var tutorialView: UIView!

    let tutorialImageView = Bundle.main.loadNibNamed(Nib.tutorialImageView.rawValue, owner: self, options: nil)?.last as! TutorialImageView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        tutorialImageView.frame = tutorialView.frame
        tutorialView.addSubview(tutorialImageView)
        tutorialImageView.initiateAnimation({
            self.performSegueToQuizTypeViewController()
        })
    }
    
    func configure() {
        self.title = Strings.TutorialViewControllerTitle.rawValue
        self.view.accessibilityIdentifier = Strings.TutorialViewControllerAccessibilityIdentifier.rawValue
    }
    
    func performSegueToQuizTypeViewController() {
        performSegue(withIdentifier: Route.tutorialToQuizTypeTransition.rawValue, sender: self)
    }
    
    
}
