//
//  ScoreScreenViewController.swift
//  SpanishToEnglishLanguageQuiz
//
//  Created by Mohammad Zulqarnain on 13/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit

class ScoreScreenViewController: UIViewController {

    @IBOutlet weak var scoreValueDisplayView: UIView!
    @IBOutlet weak var nextButtonDisplayView: UIView!
    @IBOutlet weak var scoreDateDisplayView: UIView!
    let scoreValueLabelView = Bundle.main.loadNibNamed(Nib.labelView.rawValue, owner: self, options: nil)?.last as! LabelView
    let scoreDateDisplayLabelView = Bundle.main.loadNibNamed(Nib.labelView.rawValue, owner: self, options: nil)?.last as! LabelView
    let buttonView = Bundle.main.loadNibNamed(Nib.buttonView.rawValue, owner: self, options: nil)?.last as! ButtonView
    var score: Score?
    var scoreViewModel: ScoreViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        initializeViewModel()
        setupView()
    }
    
    func configure() {
        self.title = Strings.ScoreScreenViewControllerTitle.rawValue
        self.view.accessibilityIdentifier = Strings.ScoreScreenViewControllerAccessibilityIdentifier.rawValue
    }
    
    func initializeViewModel() {
        guard let score = self.score as Score? else { return }
        scoreViewModel = ScoreViewModel(score: score)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Route.scoreScreenToGameRouteTransition.rawValue {
            guard let isScoreHigh = self.scoreViewModel?.isHigh as Bool?  else { return }
            let destinationVC = segue.destination as! GameRouteViewController
            destinationVC.isScoreHigh = isScoreHigh
        }
    }
    
    func performSegueToGameRouteViewController() {
        performSegue(withIdentifier: Route.scoreScreenToGameRouteTransition.rawValue, sender: self)
    }
    
    func setupView() {
        buttonView.buttonCallback = {
            self.performSegueToGameRouteViewController()
        }

        guard let scoreViewModel = self.scoreViewModel as ScoreViewModel? else { return }
        
        scoreValueLabelView.setText(Strings.scoreValuePrefix.rawValue + scoreViewModel.value)
        scoreDateDisplayLabelView.setText(Strings.scoreDatePrefix.rawValue + scoreViewModel.date)
        scoreValueDisplayView.addSubview(scoreValueLabelView)
        buttonView.setButtonTitle(Strings.nextButtonTitle.rawValue)
        nextButtonDisplayView.addSubview(buttonView)
        scoreDateDisplayView.addSubview(scoreDateDisplayLabelView)
    }

}
