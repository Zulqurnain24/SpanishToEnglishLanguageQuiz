//
//  SplashScreenImageView.swift
//  SpanishToEnglishLanguageQuiz
//
//  Created by Mohammad Zulqarnain on 13/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit

class SplashScreenImageView: UIImageView {

    let duration = Constants.splashAnimationTimeInSeconds.rawValue
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       configureAnimation()
    }
    
    func configureAnimation() {
        let imgListArray :NSMutableArray = []
        for countValue in 0...7
        {
            
            guard let strImageName = "splashAnimation\(countValue).png" as String?,  let image  = UIImage(named: strImageName) else { return }
            
            imgListArray.add(image)
        }
        
        self.animationImages = imgListArray as? [UIImage];
        self.animationDuration = TimeInterval(duration)
    }
    
    func initiateAnimation( _ completionHandler: (() -> Void)? = nil) {
        self.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now() + duration, execute: {
            self.stopAnimating()
            guard completionHandler != nil else { return }
            completionHandler!()
        })
    }
    
}
