//
//  ViewController.swift
//  SpanishToEnglishLanguageQuiz
//
//  Created by Mohammad Zulqarnain on 13/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit

class SplashScreenViewController: UIViewController {

    @IBOutlet weak var splashAnimationView: UIView!

    let splashScreenImageView = Bundle.main.loadNibNamed(Nib.splashScreenImageView.rawValue, owner: self, options: nil)?.last as! SplashScreenImageView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        playLevelMusic()
        setupViews()
    }
    
    func configure() {
        self.title = Strings.SplashScreenViewControllerTitle.rawValue
        self.view.accessibilityIdentifier = Strings.SplashScreenViewControllerAccessibilityIdentifier.rawValue
    }
    
    func playLevelMusic() {
        AudioAssisstant.shared.playSound(soundName: AudioFiles.levelMusic1.rawValue, withFormat: AudioFormats.mp3.rawValue)
    }
    
    func setupViews() {
        splashAnimationView.addSubview(splashScreenImageView)
        splashScreenImageView.initiateAnimation({
            self.performSegueToTutorialViewController()
        })
    }
    
    func performSegueToTutorialViewController() {
        performSegue(withIdentifier: Route.splashToTutorialScreenTransition.rawValue, sender: self)
    }


}

