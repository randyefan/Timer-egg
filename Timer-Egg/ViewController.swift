//
//  ViewController.swift
//  Timer-Egg
//
//  Created by Randy Efan Jayaputra on 25/02/20.
//  Copyright © 2020 Randy Efan Jayaputra. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    let timer = ["Soft" : 3, "Medium" : 6, "Hard" : 7]
    
    @IBOutlet weak var Judul: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var waktu = Timer()
    var player: AVAudioPlayer!
    
    var result = 0
    var secondPassed = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func pressTimer(_ sender: UIButton) {
        
        waktu.invalidate()
        secondPassed = 0
        progressBar.progress = 0
        
        let measureness = sender.currentTitle!
        
        Judul.text = measureness
        Judul.textColor = UIColor.black
        
        result = timer[measureness]!
        
        waktu = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)
//        print(result)
    }
    
    @objc func update() {
        if(secondPassed < result) {
            
            secondPassed+=1
            
            let percentageBar = Float(secondPassed) / Float(result)
            
            progressBar.progress = percentageBar
            
            
        } else {
            waktu.invalidate()
            playSound()
            Judul.text = "DONE!"
            Judul.textColor = UIColor.red
        }
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
}

