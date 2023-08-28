//
//  ViewController.swift
//  BullsEye
//
//  Created by laijiaaa1 on 2023/8/26.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue:Int = 0
    var targetValue:Int = 0
    var score = 0
    var round = 0
   
    @IBOutlet weak var rounds: UILabel!
    @IBOutlet weak var scores: UILabel!
    @IBOutlet weak var hitMeButton: UIButton!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        startNewRound()
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")!
        slider.setThumbImage(thumbImageNormal, for: .normal)
        let thumbImageHighLighted = UIImage(named: "SliderThumb-Highlighted")!
        slider.setThumbImage(thumbImageHighLighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        let trackLeftImage = UIImage(named: "SliderTrackLeft")!
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        let trackRightImage = UIImage(named: "SliderTrackRight")!
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
    }
    
    @IBAction func showAlert(){
        
        let different = abs(currentValue - targetValue)
//        if different < 0 {
//            different *= -1
//        }
        
        var points = 100 - different
        score += points
        let title: String
        if different == 0{
            title = "Perfect!"
            points += 100
        }else if different < 5 {
            title = "You almost had it!"
            if different == 1 {
                points += 50
            }
        }else if different < 10 {
            title = "Pretty good!"
        }else {
        title = "Not even close..."
        }
        let message = "You scored \(points) points"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: {
            action in self.startNewRound()
//            暫存，於點擊時執行（按下ok才startNewRound）
        })
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func sliderMoved(_ slider:UISlider){
        
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
    }
    
    func startNewRound(){
        round += 1
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabel()
        
        
    }
    
    func updateLabel(){
        targetLabel.text = String(targetValue)
        scores.text = String(score)
        rounds.text = String(round)
    }
    
   @IBAction func startOverLabel(){
        score = 0
        round = 0
        startNewRound()
    }
}
