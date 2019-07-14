//
//  GamePlayViewController.swift
//  SpanishToEnglishLanguageQuiz
//
//  Created by Mohammad Zulqarnain on 13/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit

class GamePlayViewController: UIViewController {

    var quizDataSource = QuizDataSource()
    var scoreDataSource = ScoreDataSource()
    var gamePlayViewModel: GamePlayViewModel?
    var scoreViewModel: ScoreViewModel?
    var score = Score()
    var questionCount = 0
    var correctAnswer: String?
    var previousLocation: CGPoint?
    @IBOutlet weak var quizQuestionDisplayView: UIView!
    @IBOutlet weak var stopWatchDisplayView: UIView!
    @IBOutlet weak var bubbleDisplayView: UIView!
    @IBOutlet weak var scoreDisplayView: UIView!
    @IBOutlet weak var nextButtonDisplayView: UIView!
    
    let questionView = Bundle.main.loadNibNamed(Nib.questionView.rawValue, owner: self, options: nil)?.last as! QuestionView
    
    let stopWatchCounter = Bundle.main.loadNibNamed(Nib.stopWatchCounter.rawValue, owner: self, options: nil)?.last as! StopWatchCounter
    
    
    let wordBubbleView = Bundle.main.loadNibNamed(Nib.wordBubbleView.rawValue, owner: self, options: nil)?.last as! WordBubbleView
    
    let scoreView = Bundle.main.loadNibNamed(Nib.scoreView.rawValue, owner: self, options: nil)?.last as! ScoreView
    
    let buttonView = Bundle.main.loadNibNamed(Nib.buttonView.rawValue, owner: self, options: nil)?.last as! ButtonView
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        configure()
        setupView()
        populateQuestionsArray()
        updateScore()
    }

    func configure() {
        self.title = Strings.GamePlayViewControllerTitle.rawValue
        self.view.accessibilityIdentifier = Strings.GamePlayViewControllerAccessibilityIdentifier.rawValue
    }
    
    func setupView() {
        buttonView.buttonCallback = {
            self.gameLogic()
        }
        buttonView.setButtonTitle(Strings.nextButtonTitle.rawValue)
        nextButtonDisplayView.addSubview(buttonView)
        quizQuestionDisplayView.addSubview(questionView)
        stopWatchDisplayView.addSubview(stopWatchCounter)
        scoreDisplayView.addSubview(scoreView)
        bubbleDisplayView.addSubview(wordBubbleView)
        self.view.bringSubviewToFront(bubbleDisplayView)

    }

    func performSegueToScoreViewController() {
        performSegue(withIdentifier: Route.gamePlayToScoreScreenTransition.rawValue, sender: self)
    }

    func returnNextWord(_ wordsArray: [Word]) -> Word? {
        guard questionCount <= (wordsArray.count - 1),  let word = wordsArray[questionCount] as Word? else {
            self.performSegueToScoreViewController()
            return nil }
        questionCount = questionCount + 1
        return word
    }
    
    func performBubbleAnimationWith(choice: String) {
        wordBubbleView.topDownAnimation(choice: choice)
    }
    
    func getShuffledChoice() -> String? {
        var array = gamePlayViewModel?.quizArray
        array?.shuffle()
        
        guard let shuffledChoice = array?.first?.english else { return nil }
        return shuffledChoice
    }
    
    func gameLogic() {
        
        buttonView.isUserInteractionEnabled = false
        
        self.wordBubbleView.setupBurstAnimation()
        self.wordBubbleView.frame = self.bubbleDisplayView.frame
        self.wordBubbleView.frame.origin.x = 100
        self.wordBubbleView.frame.origin.y = -214
        guard let gamePlayViewModel = self.gamePlayViewModel as GamePlayViewModel?, let quizArray = gamePlayViewModel.quizArray as [Word]?, let word = returnNextWord(quizArray),
            let question = word.spanish, let answer = word.english
            else { return }
        
        correctAnswer = answer
        
        questionView.setQuestionText(question)
        
        guard let shuffledChoice = getShuffledChoice() as String? else { return }

        wordBubbleView.finishAnimations()

        performBubbleAnimationWith(choice: shuffledChoice)
        
        stopWatchCounter.finishAnimations()
        
        stopWatchCounter.initiateAnimation({
            
            self.buttonView.isUserInteractionEnabled = true
        })
    }
    
    func populateQuestionsArray() {
        quizDataSource.populateArrayFromJSONFile(completionHandler: { wordsArray in
            var array = wordsArray
            array.shuffle() //shuffled the array to show different quiz to user each time
            gamePlayViewModel = GamePlayViewModel(array)
            self.gameLogic()
        })
    }
    
    func updateScore() {
        scoreViewModel = ScoreViewModel(score: score)
        guard let scoreViewModel = self.scoreViewModel as ScoreViewModel?, let value = scoreViewModel.value as String? else { return }
        scoreView.setLabelText(value)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let highesScore = scoreDataSource.getHighestScore() as Score? {
             self.score.isHigh = score.value > highesScore.value
        } else {
             self.score.isHigh = true
        }
       
        if segue.identifier == Route.gamePlayToScoreScreenTransition.rawValue {
            guard let score = self.score as Score?  else { return }
            let destinationVC = segue.destination as! ScoreScreenViewController
            destinationVC.score = score
            scoreDataSource.recordScore(score: score)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        wordBubbleView.finishAnimations()
        stopWatchCounter.finishAnimations()
    }
}

//extension for touches
extension GamePlayViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
         guard let firstTouchLocation = touches.first?.location(in: self.wordBubbleView) else { return }
       previousLocation = firstTouchLocation
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
       
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard stopWatchCounter.isAnimating == true || wordBubbleView.frame.origin.y != -214 && buttonView.isUserInteractionEnabled == false else {
            return }
        guard let firstTouchLocation = touches.first?.location(in: self.wordBubbleView), firstTouchLocation == previousLocation, stopWatchCounter.isAnimating else {

            AudioAssisstant.shared.playSound(soundName: AudioFiles.bubblePop.rawValue, withFormat: AudioFormats.wav.rawValue)
            DispatchQueue.main.asyncAfter(deadline: .now() + Constants.burstAnimationDuration.rawValue, execute: {
                AudioAssisstant.shared.stopSound()
            })
            self.stopWatchCounter.stopAnimating()
            
            if wordBubbleView.getChoiceText() != correctAnswer {
                score.value = score.value + 1
            } else {
                score.value = score.value - 1
            }
            updateScore()
            stopWatchCounter.finishAnimations()
            wordBubbleView.initiateAnimation()
            buttonView.isUserInteractionEnabled = true
            return }
        
        //logic for tapping the word bubble
        self.stopWatchCounter.stopAnimating()
        
        if wordBubbleView.getChoiceText() == correctAnswer {
            self.score.value = self.score.value + 1
        } else {
            self.score.value = self.score.value - 1
        }
        updateScore()
        stopWatchCounter.finishAnimations()
        wordBubbleView.initiateAnimation()
        buttonView.isUserInteractionEnabled = true
    }
}
