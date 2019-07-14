//
//  ScoreView.swift
//  SpanishToEnglishLanguageQuiz
//
//  Created by Mohammad Zulqarnain on 13/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit

class ScoreView: UIView {

    @IBOutlet weak var label: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setLabelText(_ text: String) {
        label.text = text
    }
    
    func isHighScore(high: Bool) {
        guard high == true else {
            label.backgroundColor = UIColor.clear
            return }
        label.backgroundColor = UIColor.green
        
    }

}
