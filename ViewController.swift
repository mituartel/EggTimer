//
//  ViewController.swift
//  EggTimer
//
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
@IBOutlet var titleLabel: UILabel!
@IBOutlet var progressBar: UIProgressView!
    
    
    var totalTime = 0
    var secondsPassed = 0
    var timer = Timer()
    var player: AVAudioPlayer!
    let eggtimes = ["Soft": 300, "Medium": 420, "Hard":720]

 
    
    @IBAction func hardnessSelected(_ sender: UIButton)
    {
        timer.invalidate()
        let hardness = sender.currentTitle!
        
       
        
        totalTime = eggtimes[hardness]!
        
        
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    
    @objc func timerAction(){
        if secondsPassed < totalTime {
                  secondsPassed += 1
                  progressBar.progress = Float(secondsPassed) / Float(totalTime)
                  print(Float(secondsPassed) / Float(totalTime))
           
            
        }
        else  {
            timer.invalidate()
            titleLabel.text = "Done!"
            
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
                    player = try! AVAudioPlayer(contentsOf: url!)
                    player.play()
        }
            
    
    }
}
