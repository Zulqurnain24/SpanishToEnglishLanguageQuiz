//
//  AudioAssisstant.swift
//  SpanishToEnglishLanguageQuiz
//
//  Created by Mohammad Zulqurnain on 19/5/19
//

import UIKit
import AVFoundation

enum AudioFormats: String {
    
    // Audio Formats
    
    case wav = "wav"
    
    case mp3 = "mp3"
    
}


enum AudioFiles: String {
    
    // Audio Files
    
    case win = "win"
    
    case loose = "loose"
    
    case levelMusic1 = "levelMusic"

    case alarm = "alarm"
    
    case timerTick = "timerTick"
    
    case bubblePop = "bubblePop"
}

class AudioAssisstant: NSObject {
    
    static let shared: AudioAssisstant = AudioAssisstant()
    
    private let audioSession = AVAudioSession.sharedInstance()
    
    private var player: AVAudioPlayer?

    private var feedbackTimer: Timer?
    private var feedBackTimeInterval: TimeInterval?

    func playSound(soundName: String, withFormat: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: withFormat)!
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            guard let player = player else { return }
            
            player.prepareToPlay()
            player.play()
            
        } catch let error as NSError {
            print(error.description)
        }
    }
    
    func stopSound() {
        player?.stop()
    }
    
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromAVAudioSessionCategory(_ input: AVAudioSession.Category) -> String {
	return input.rawValue
}

