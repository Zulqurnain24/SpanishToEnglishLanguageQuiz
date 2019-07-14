//
//  WordBubbleView.swift
//  SpanishToEnglishLanguageQuiz
//
//  Created by Mohammad Zulqarnain on 13/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit

class WordBubbleView: UIView {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var choiceLabel: UILabel!
    
    let burstDuration = Constants.burstAnimationDuration.rawValue
    let topDownDuration = Constants.stopWatchTimeInSeconds.rawValue
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupBurstAnimation()
    }
    
    func getChoiceText() -> String {
        guard let choiceText = choiceLabel.text as String? else { return "" }
        return choiceText
    }
    
    func setChoiceText(_ text: String) {
        choiceLabel.text = text
    }
    
    func setImage(_ imageURLString: String) {
        imageView.image = UIImage(named: imageURLString)
    }
    
    func setupBurstAnimation() {
        let imgListArray :NSMutableArray = []
        for countValue in 1...3
        {
            
            guard let strImageName = "bubble\(countValue).png" as String?,  let image  = UIImage(named: strImageName) else { return }
            
            imgListArray.add(image)
        }
        
        self.imageView.animationImages = imgListArray as? [UIImage];
        self.imageView.animationDuration = TimeInterval(burstDuration)
    }

    func finishAnimations() {
        self.imageView.stopAnimating()
        self.layer.removeAllAnimations()
    }
    
    func initiateAnimation( _ completionHandler: (() -> Void)? = nil) {
        imageView.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now() + burstDuration, execute: {
            self.finishAnimations()
            guard completionHandler != nil else { return }
            completionHandler!()
        })
    }
   
    func topDownAnimation(choice: String?) {
        DispatchQueue.main.async {
            self.choiceLabel.text = choice
            
            UIView.animate(withDuration: self.topDownDuration, delay: 0.0, options: .curveEaseOut, animations: {
                var bubbleViewFrame = self.frame
                bubbleViewFrame.origin.y += 5 * bubbleViewFrame.size.height
                let halfWidth = bubbleViewFrame.size.width / 2
                let xVariation = -1 * Int(arc4random_uniform(UInt32(halfWidth))) + Int(arc4random_uniform(UInt32(halfWidth)))
                bubbleViewFrame.origin.x = bubbleViewFrame.origin.x + CGFloat(xVariation)
                self.frame = bubbleViewFrame
            }, completion: { finished in
                self.finishAnimations()
            })
        }
       
    }
}
