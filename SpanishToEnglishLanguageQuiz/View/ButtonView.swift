//
//  Button.swift
//  SpanishToEnglishLanguageQuiz
//
//  Created by Mohammad Zulqarnain on 13/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit

class ButtonView: UIView {

    var buttonCallback: (()->Void)?
    
    @IBOutlet weak var button: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupView()
    }
    
    func setButtonTitle(_ titleText: String) {
        button.setTitle(titleText, for: .normal)
    }
    
    func setupView() {
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.frame = self.frame
    }
    
    func populateTitle(title: String, completionHandler: (() -> Void)? = nil) {
        button.titleLabel?.text = title
        guard completionHandler != nil else { return }
        completionHandler!()
    }

    @IBAction func buttonAction(_ sender: Any) {
        guard let completionHandler = buttonCallback as (()->Void)? else { return }
        completionHandler()
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }

}
