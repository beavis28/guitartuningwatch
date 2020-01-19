//
//  InterfaceController.swift
//  UkuleleTuningWatch WatchKit Extension
//
//  Created by Goto, Satoshi a | RASIA on 6/11/19.
//  Copyright © 2019 engineernest. All rights reserved.
//

import WatchKit
import Foundation
import AVFoundation


class GuitarTuningController: WKInterfaceController {
    var audioPlayer: AVAudioPlayer?

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

  @IBAction func AButtonPressed() {
    playTone(tone: "A")
  }
  @IBAction func BbuttonPressed() {
    playTone(tone: "B")
  }
  @IBAction func DButtonPressed() {
    playTone(tone: "D")
  }
  @IBAction func EButtonPressed() {
    playTone(tone: "E")
  }
  @IBAction func GButtonPressed() {
    playTone(tone: "G")
  }
  @IBAction func eButtonPressed() {
    playTone(tone: "e")
  }
  
    func playTone(tone : String) {
        var sound_file: String
        sound_file = ""
        
        switch tone {
        case "A":
            sound_file = "guitarA"
        case "B":
            sound_file = "guitarB"
        case "D":
            sound_file = "guitarD"
        case "E":
            sound_file = "guitarE"
        case "G":
            sound_file = "guitarG"
        case "e":
          sound_file = "guitarHighE"
        default:
            return
        }
        let path:String? = Bundle.main.path(forResource:sound_file, ofType: "mp3")
        
        let url = URL(fileURLWithPath: path!)
        do {
            try audioPlayer = AVAudioPlayer(contentsOf: url,
                                fileTypeHint: nil)
            audioPlayer?.pause()
            audioPlayer?.play()
        } catch let error as NSError {
            print("Error: \(error.description)")
        }
    }
    
}
