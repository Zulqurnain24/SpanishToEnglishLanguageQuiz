//
//  StopWatchCounter.swift
//  SpanishToEnglishLanguageQuiz
//
//  Created by Mohammad Zulqarnain on 13/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit

class StopWatchCounter: UIImageView {
    
    let durationForStopWatch = Constants.stopWatchTimeInSeconds.rawValue
    let durationForAlarmBuzz = Constants.alarmTimeInSeconds.rawValue
    
    override func awakeFromNib() {
        super.awakeFromNib()
        image = UIImage(named: "stopwatch0")
        setupStopWatchAnimation()
    }
    
    func setupStopWatchAnimation() {

        let imgListArray :NSMutableArray = []
        for countValue in 0...5
        {
            guard let strImageName = "stopwatch\(countValue).png" as String?,  let image  = UIImage(named: strImageName) else { return }
            
            imgListArray.add(image)
        }
        for countValue in 0...3
        {
            
            guard let strImageName = "stopwatchAlarmRing\(countValue).png" as String?,  let image  = UIImage(named: strImageName) else { return }
            
            imgListArray.add(image)
        }
        
        self.animationImages = imgListArray as? [UIImage];
        self.animationDuration = TimeInterval(durationForStopWatch + durationForAlarmBuzz)
    }

    func finishAnimations() {
        self.stopAnimating()
        self.layer.removeAllAnimations()
    }
    
    func initiateAnimation( _ completionHandler: (() -> Void)? = nil) {
        self.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now() + durationForStopWatch, execute: {
            guard completionHandler != nil else { return }
            completionHandler!()
        })
    }
    
}
