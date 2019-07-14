//
//  QuizTypeSelectionViewController.swift
//  SpanishToEnglishLanguageQuiz
//
//  Created by Mohammad Zulqarnain on 13/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit

class QuizTypeSelectionViewController: UIViewController {

    @IBOutlet weak var proceedButtonView: UIView!
    
    @IBOutlet weak var isQuizTypeSpanishToggleSwitch: UISwitch!
    
    let buttonView = Bundle.main.loadNibNamed("ButtonView", owner: self, options: nil)?.last as! ButtonView
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Configuration.shared.isSpanishToEnglishQuizType  = isQuizTypeSpanishToggleSwitch.isOn
        
        setupView()
    }
    
    func setupView() {
        buttonView.setButtonTitle(Strings.nextButtonTitle.rawValue)
        buttonView.buttonCallback = {
             self.performSegue(withIdentifier: Route.quizSelectToGamePlayTransition.rawValue, sender: self)
        }
        proceedButtonView.addSubview(buttonView)
    }

    @IBAction func toggleQuizType(_ sender: UISwitch) {
        Configuration.shared.isSpanishToEnglishQuizType = sender.isOn
    }

}
