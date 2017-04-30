//
//  ViewController.swift
//  Numbers Game
//
//  Created by Michael Fan on 4/6/17.
//  Copyright © 2017 Michael Fan. All rights reserved.
//

import UIKit
import AVFoundation

class GameViewController: UIViewController {

    var game = gameModel()
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self,
                                     selector: #selector(self.alarm(_:)),
                                     userInfo: nil,
                                     repeats: true)
        game.initGame()
        shuffle()
    }
    
    func alarm(_ timer: Timer) {
        AudioServicesPlaySystemSound(1005)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var num1: UIButton!
    
    @IBOutlet weak var num2: UIButton!
    
    @IBOutlet weak var num3: UIButton!
    
    @IBOutlet weak var num4: UIButton!
    
    @IBAction func numButton1(_ sender: UIButton) {
        
        game.justChosen = (num1.titleLabel?.text)!
        if (game.updateGame()) {
            userInput.text = userInput.text! + game.justChosen
        }
        
    }
    
    @IBAction func numButton2(_ sender: UIButton) {
        game.justChosen = (num2.titleLabel?.text)!
        if (game.updateGame()) {
            userInput.text = userInput.text! + game.justChosen
        }
    }
    
    @IBAction func numButton3(_ sender: UIButton) {
        game.justChosen = (num3.titleLabel?.text)!
        if (game.updateGame()) {
            userInput.text = userInput.text! + game.justChosen
        }
    }
    
    @IBAction func numButton4(_ sender: UIButton) {
        game.justChosen = (num4.titleLabel?.text)!
        if (game.updateGame()) {
            userInput.text = userInput.text! + game.justChosen
        }
    }
    
    @IBAction func addButton(_ sender: UIButton) {
        game.justChosen = "+"
        if (game.updateGame()) {
            userInput.text = userInput.text! + game.justChosen
        }
    }
    
    @IBAction func subtractButton(_ sender: UIButton) {
        game.justChosen = "-"
        if (game.updateGame()) {
            userInput.text = userInput.text! + game.justChosen
        }
    }
    
    @IBAction func multiplyButton(_ sender: UIButton) {
        game.justChosen = "x"
        if (game.updateGame()) {
            userInput.text = userInput.text! + game.justChosen
        }
    }
    
    @IBAction func divideButton(_ sender: UIButton) {
        game.justChosen = "/"
        if (game.updateGame()) {
            userInput.text = userInput.text! + game.justChosen
        }
    }
    
    @IBAction func clearUserInput(_ sender: UIButton) {
        userInput.text = ""
        game.clearInput()
    }
    
    
    @IBOutlet weak var userInput: UILabel!
    
    
    
    @IBAction func checkUserInput(_ sender: UIButton) {
        game.setUserInput(s: userInput.text!)
        if game.checkGame() {
            timer.invalidate()
            performSegue(withIdentifier: "completedTask", sender: self)
        }
    }
    
    
    @IBAction func shuffleNumbers(_ sender: UIButton) {
        game.initGame()
        shuffle()
    }
    
    func shuffle() {
        game.initGame()
        userInput.text = ""
        num1.setTitle(String(game.numButton1), for: .normal)
        num2.setTitle(String(game.numButton2), for: .normal)
        num3.setTitle(String(game.numButton3), for: .normal)
        num4.setTitle(String(game.numButton4), for: .normal)
    }

}

